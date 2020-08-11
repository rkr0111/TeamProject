package com.TeamPro.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.Product_UpdateService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Product_UpdateAction implements Light_action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		boolean isUpdateSuccess = false;
		Product_dto dto = new Product_dto();
		String realFolder="";
		String saveFolder="/product_file";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);
		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		String colors[] = multi.getParameterValues("udt_color");
		String proColors = "";
		for(int i=0; i<colors.length; i++) {
			proColors += colors[i] + ",";
		}
		
		dto.setCheck(multi.getParameter("udt_check"));
		dto.setProduct_name(multi.getParameter("udt_name"));
		dto.setProduct_category(multi.getParameter("udt_category"));
		dto.setProduct_price(Integer.parseInt(multi.getParameter("udt_price")));
		dto.setProduct_color(proColors);
		dto.setProduct_contents(multi.getParameter("udt_contents"));
		if(multi.getOriginalFileName((String)multi.getFileNames().nextElement()) != null) {
			dto.setProduct_img(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		}else {
			dto.setProduct_img(multi.getParameter("udt_img"));
		}
		
		Product_UpdateService productUpdateService = new Product_UpdateService();
		isUpdateSuccess = productUpdateService.getProductUpdate(dto);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("productList.bo?product_category="+dto.getProduct_category()); 
		return forward;
	}
}
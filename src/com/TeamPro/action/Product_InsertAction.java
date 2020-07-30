package com.TeamPro.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.Product_InsertService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Product_InsertAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Product_dto prodto = null;
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
		
		prodto = new Product_dto();
		prodto.setProduct_name(multi.getParameter("product_name"));
		prodto.setProduct_category(multi.getParameter("product_category"));
		prodto.setProduct_price(Integer.parseInt(multi.getParameter("product_price")));
		prodto.setProduct_color(multi.getParameter("product_color"));
		prodto.setProduct_file(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		prodto.setProduct_img(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		prodto.setProduct_contents(multi.getParameter("product_contents"));
		
		Product_InsertService productInsertService = new Product_InsertService();
		boolean isInsert = productInsertService.isInsert(prodto);
		
		System.out.println("insert action : " + isInsert);
		
		if(!isInsert){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("</script>");
		}
		else{
			request.setAttribute("product_name", multi.getParameter("product_name"));
			String product_name = (String) request.getAttribute("product_name");
			System.out.println("insert action product_name : " + product_name);
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("productList.bo?product_name=" + product_name);
		}

		return forward;
	}
	
}

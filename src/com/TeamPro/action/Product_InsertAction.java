package com.TeamPro.action;

import java.io.PrintWriter;
import java.util.Enumeration;

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
		int fileSize=100*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);
		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		// 컬러 ,로 구분
		String colors[] = multi.getParameterValues("product_color");
		String proColors = "";
		for(int i=0; i<colors.length; i++) {
			proColors += colors[i] + ",";
		}
		
		// file 가져오기
		Enumeration<String> files = multi.getFileNames();
		
		while (files.hasMoreElements()) {
			String file = (String)files.nextElement();
			String filename = multi.getFilesystemName(file);
			String origfilename = multi.getOriginalFileName(file);
			
			// 이미지 썸네일 가져오기
			String thumbnail = (String)files.nextElement();
			String thumbnailname = multi.getFilesystemName(thumbnail);
			String origfilethumbnail = multi.getOriginalFileName(thumbnail);
			
			// 상세 이미지들 가져오기
			String detailimg1 = (String)files.nextElement();
			String detailimgname1 = multi.getFilesystemName(detailimg1);
			String origfiledetailimg1 = multi.getOriginalFileName(detailimg1);
			
			String detailimg2 = (String)files.nextElement();
			String detailimgname2 = multi.getFilesystemName(detailimg2);
			String origfiledetailimg2 = multi.getOriginalFileName(detailimg2);
			
			String detailimg3 = (String)files.nextElement();
			String detailimgname3 = multi.getFilesystemName(detailimg3);
			String origfiledetailimg3 = multi.getOriginalFileName(detailimg3);
			
			String detailimg4 = (String)files.nextElement();
			String detailimgname4 = multi.getFilesystemName(detailimg4);
			String origfiledetailimg4 = multi.getOriginalFileName(detailimg4);

			// 상세이미지 ,로 구분
			String detailimgs = origfiledetailimg1 + "," 
						+ origfiledetailimg2 + "," 
						+ origfiledetailimg3 + "," 
						+ origfiledetailimg4;
			
			System.out.println("action detailimgs : " + detailimgs);
			prodto.setProduct_file(origfilename);
			prodto.setProduct_img(origfilethumbnail);
			prodto.setProduct_detailimg(detailimgs);
		}
		
		// set dto
		prodto = new Product_dto();
		prodto.setProduct_name(multi.getParameter("product_name"));
		prodto.setProduct_category(multi.getParameter("product_category"));
		prodto.setProduct_price(Integer.parseInt(multi.getParameter("product_price")));
		prodto.setProduct_color(proColors);
		prodto.setProduct_contents(multi.getParameter("product_contents"));
		prodto.setProduct_weather(multi.getParameter("product_weather"));
		
		// service 호출
		Product_InsertService productInsertService = new Product_InsertService();
		boolean isInsert = productInsertService.isInsert(prodto);
		
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
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("productList.bo?product_category="+prodto.getProduct_category());
		}

		return forward;
	}
	
}

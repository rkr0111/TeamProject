package com.TeamPro.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

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
		
		String origfilename1 = null;
		String origfilename2 = null;
		String origfilename3 = null;
		String origfilename4 = null;
		String origfilename5 = null;
		
		while (files.hasMoreElements()) {
			List<String> list = new ArrayList<String>();

			for(int i=0; i<5; i++) {
				list.add((String)files.nextElement());
			}
			System.out.println("action list.size() : " + list.size());
			for(int i=list.size()-1; i>0; i--) {
				System.out.println("action list : " + list.get(i));
			}
			
			String file1 = list.get(4);
			String file2 = list.get(3);
			String file3 = list.get(2);
			String file4 = list.get(1);
			String file5 = list.get(0);
			
			if(file1 != null) {
	 			// 파일 가져오기
				String filename1 = multi.getFilesystemName(file1);
				origfilename1 = multi.getOriginalFileName(file1);
			}
			if(file2 != null) {				
				// 이미지 썸네일 가져오기
				String filename2 = multi.getFilesystemName(file2);
				origfilename2 = multi.getOriginalFileName(file2);
			}
			
			// 상세 이미지들 가져오기
			if(file3 != null) {
				String filename3 = multi.getFilesystemName(file3);
				origfilename3 = multi.getOriginalFileName(file3);
			}
			if(file4 != null) {
				String filename4 = multi.getFilesystemName(file4);
				origfilename4 = multi.getOriginalFileName(file4);
			}
			if(file5 != null) {
				String filename5 = multi.getFilesystemName(file5);
				origfilename5 = multi.getOriginalFileName(file5);
			}

			System.out.println("--------------------------------------");
			System.out.println("action file : " + origfilename1);
			System.out.println("action thumbnail : " + origfilename2);
			System.out.println("action detailimg1 : " + origfilename3);
			System.out.println("action detailimg2 : " + origfilename4);
			System.out.println("action detailimg3 : " + origfilename5);
		}

		// 상세이미지 ,로 구분
		String detailimgs = origfilename3 + "," 
					+ origfilename4 + "," 
					+ origfilename5;

		System.out.println("--------------------------------------");
		System.out.println("action detailimgs : " + detailimgs);		
		
		// set dto
		prodto = new Product_dto();
		prodto.setProduct_name(multi.getParameter("product_name"));
		prodto.setProduct_category(multi.getParameter("product_category"));
		prodto.setProduct_price(Integer.parseInt(multi.getParameter("product_price")));
		prodto.setProduct_color(proColors);
		prodto.setProduct_file(origfilename1);
		prodto.setProduct_img(origfilename2);
		prodto.setProduct_detailimg(detailimgs);
		prodto.setProduct_contents(multi.getParameter("product_contents"));
		prodto.setProduct_weather(multi.getParameter("product_weather"));
		
		System.out.println("--------------------------------------");
		System.out.println("action prodto : " + prodto.getProduct_file());
		System.out.println("action prodto : " + prodto.getProduct_img());
		System.out.println("action prodto : " + prodto.getProduct_detailimg());
		
		// service 호출
		Product_InsertService productInsertService = new Product_InsertService();
		boolean isInsert = productInsertService.isInsert(prodto);
		
		System.out.println("--------------------------------------");
		System.out.println("action isInsert : " + isInsert);
		
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
			
			System.out.println("--------------------------------------");
			System.out.println("action product_name : " + product_name);
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("productList.bo?product_category="+prodto.getProduct_category());
		}

		return forward;
	}
	
}

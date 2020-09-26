package com.TeamPro.action;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

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

			String file1 = list.get(2);
			String file2 = list.get(1);
			String file3 = list.get(0);
			String file4 = list.get(4);
			String file5 = list.get(3);

			System.out.println("--------------------------------------");
			System.out.println("action file1 : " + file1);
			System.out.println("action file2 : " + file2);
			System.out.println("action file3 : " + file3);
			System.out.println("action file4 : " + file4);
			System.out.println("action file5 : " + file5);
			
			if(file1 != null) {
	 			// 파일 가져오기
				String filename1 = multi.getFilesystemName(file1);
				origfilename1 = multi.getOriginalFileName(file1);
			}else {
				origfilename1 = multi.getParameter("udt_file");
			}
			if(!file2.contains("")) {
				// 이미지 썸네일 가져오기
				String filename2 = multi.getFilesystemName(file2);
				origfilename2 = multi.getOriginalFileName(file2);
			}else {
				origfilename2 = multi.getParameter("udt_img");
			}
			System.out.println("--------------------------------------");
			System.out.println("action 썸네일 : " + origfilename2);
			
			// 상세 이미지들 가져오기
			if(file3 != null) {
				String filename3 = multi.getFilesystemName(file3);
				origfilename3 = multi.getOriginalFileName(file3);
			}else {
				origfilename3 = multi.getParameter("udt_detailimg1");
			}
			if(file4 != null) {
				String filename4 = multi.getFilesystemName(file4);
				origfilename4 = multi.getOriginalFileName(file4);
			}else {
				origfilename4 = multi.getParameter("udt_detailimg2");
			}
			if(file5 != null) {
				String filename5 = multi.getFilesystemName(file5);
				origfilename5 = multi.getOriginalFileName(file5);
			}else {
				origfilename5 = multi.getParameter("udt_detailimg3");
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
		
		dto.setCheck(multi.getParameter("udt_check"));
		dto.setProduct_name(multi.getParameter("udt_name"));
		dto.setProduct_category(multi.getParameter("udt_category"));
		dto.setProduct_price(Integer.parseInt(multi.getParameter("udt_price")));
		dto.setProduct_color(proColors);
		dto.setProduct_contents(multi.getParameter("udt_contents"));
		dto.setProduct_file(origfilename1);
		dto.setProduct_img(origfilename2);
		dto.setProduct_detailimg(detailimgs);
		
		Product_UpdateService productUpdateService = new Product_UpdateService();
		isUpdateSuccess = productUpdateService.getProductUpdate(dto);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("productList.bo?product_category="+dto.getProduct_category()); 
		return forward;
	}
}
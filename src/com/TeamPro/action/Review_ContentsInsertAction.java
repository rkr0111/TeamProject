package com.TeamPro.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.service.Product_InsertService;
import com.TeamPro.service.Review_ContentsInsertService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Review_ContentsInsertAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Review_dto reviewdto = new Review_dto();
		String realFolder="";
		String saveFolder="/upload/review_img";
		int fileSize=100*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);
		HttpSession session = request.getSession();
		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		// request
		String review_id = (String) session.getAttribute("id");
		String review_name = multi.getParameter("applyReview_findName");
		String review_contents = multi.getParameter("review_contents");
		
		// file 가져오기
		String origfilename1 = null;
		Enumeration<String> files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String file1 = (String) files.nextElement();
			if(file1 != null) {
				String filename1 = multi.getFilesystemName(file1);
				origfilename1 = multi.getOriginalFileName(file1);
			}
		}
		
		// set dto
		reviewdto.setReview_id(review_id);
		reviewdto.setReview_name(review_name);
		reviewdto.setReview_img(origfilename1);
		reviewdto.setReview_contents(review_contents);
		
		// service 호출
		Review_ContentsInsertService reviewContetnsInsertService = new Review_ContentsInsertService();
		boolean isInsert = reviewContetnsInsertService.isInsert(reviewdto);
		
		if(!isInsert){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("</script>");
		}
		else{			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("reviewAllList.bo");
		}

		return forward;
	}
	
}

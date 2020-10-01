package com.TeamPro.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.CustomerCenter_dto;
import com.TeamPro.service.Customer_NoticeInsertService;

public class Customer_NoticeInsertAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		CustomerCenter_dto centerdto = new CustomerCenter_dto();
		HttpSession session = request.getSession();
		
		// set dto
		centerdto.setCenter_category("notice");
		centerdto.setCenter_title(request.getParameter("center_title"));
		centerdto.setCenter_contents(request.getParameter("center_contents"));
		centerdto.setCenter_id((String) session.getAttribute("id"));
		
		// service 호출
		Customer_NoticeInsertService customerNoticeInsertService = new Customer_NoticeInsertService();
		boolean isInsert = customerNoticeInsertService.isInsert(centerdto);
		
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
			forward.setPath("customerNoticeList.bo?center_category=notice");
		}

		return forward;
	}
	
}

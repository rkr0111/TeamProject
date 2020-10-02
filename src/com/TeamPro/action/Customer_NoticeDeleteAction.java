package com.TeamPro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.CustomerCenter_dto;
import com.TeamPro.service.Customer_NoticeDeleteService;

public class Customer_NoticeDeleteAction implements Light_action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isDeleteSuccess = false;
		CustomerCenter_dto dto = new CustomerCenter_dto();
		
		dto.setCenter_no(Integer.parseInt(request.getParameter("center_no")));
		
		Customer_NoticeDeleteService customerNoticeDeleteService = new Customer_NoticeDeleteService();
		isDeleteSuccess = customerNoticeDeleteService.getNoticeDelete(dto);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("customerNoticeList.bo?center_category=notice");
		return forward;
	}
}

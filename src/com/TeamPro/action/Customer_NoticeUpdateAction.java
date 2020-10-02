package com.TeamPro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.CustomerCenter_dto;
import com.TeamPro.service.Customer_NoticeUpdateService;

public class Customer_NoticeUpdateAction implements Light_action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isUpdateSuccess = false;
		CustomerCenter_dto dto = new CustomerCenter_dto();
		
		dto.setCenter_no(Integer.parseInt(request.getParameter("center_no")));
		dto.setCenter_title(request.getParameter("center_title"));
		dto.setCenter_contents(request.getParameter("center_contents"));
		
		Customer_NoticeUpdateService customerNoticeUpdateService = new Customer_NoticeUpdateService();
		isUpdateSuccess = customerNoticeUpdateService.getProductUpdate(dto);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("customerNoticeList.bo?center_category=notice"); 
		return forward;
	}
}
package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Buyhistory_dto;
import com.TeamPro.dto.CustomerInfo_dto;
import com.TeamPro.service.Buy_nowListService;

public class Buy_nowformAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession getSession = request.getSession(false);
		
		Buy_nowListService buyNowListService = new Buy_nowListService();
		List<CustomerInfo_dto> customerinfoList = new ArrayList<CustomerInfo_dto>();		

		String id = (String)getSession.getAttribute("id");
		
		customerinfoList = buyNowListService.getCustomerList(id);
		request.setAttribute("customerinfoList", customerinfoList);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_product/product_buynow.jsp");
		return forward;	
	}
	
}

package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.service.Customer_DownloadService;
import com.TeamPro.service.Review_AllListService;

public class Customer_DownloadAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Product_dto> filelist = new ArrayList<Product_dto>();
		Customer_DownloadService customerdownloadservice = new Customer_DownloadService();
		
		filelist = customerdownloadservice.getDownloadList();
		
		if(!filelist.isEmpty()) {
			request.setAttribute("filelist", filelist);
		}
   		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_customer/customer_download.jsp");
		return forward;
	}
	
}

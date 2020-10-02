package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.CustomerCenter_dto;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.service.Index_ListService;

public class Index_ListAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Review_dto> listinfo = new ArrayList<Review_dto>();
		List<CustomerCenter_dto> centerlist = new ArrayList<CustomerCenter_dto>();
		Index_ListService indexListService = new Index_ListService();
		
		listinfo = indexListService.getReviewList();
		centerlist= indexListService.getCustomerCenterList();
		
		request.setAttribute("listinfo", listinfo);
		request.setAttribute("centerlist", centerlist);
   		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("index.jsp");
		return forward;
	}
	
}

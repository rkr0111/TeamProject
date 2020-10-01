package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.service.Index_ListService;

public class Index_ListAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Review_dto> listinfo = new ArrayList<Review_dto>();
		Index_ListService indexListService = new Index_ListService();
		
		listinfo = indexListService.getReviewList();
		
		request.setAttribute("listinfo", listinfo);
   		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("index.jsp");
		return forward;
	}
	
}

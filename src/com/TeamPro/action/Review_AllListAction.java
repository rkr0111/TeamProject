package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.service.Review_AllListService;

public class Review_AllListAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Review_dto> reviewalllist = new ArrayList<Review_dto>();
		Review_AllListService reviewAllListService = new Review_AllListService();
		
		reviewalllist = reviewAllListService.getReviewAllList();
		
		request.setAttribute("reviewalllist", reviewalllist);
   		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_review/review.jsp");
		return forward;
	}
	
}

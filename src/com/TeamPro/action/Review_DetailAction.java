package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.service.Review_AllListService;
import com.TeamPro.service.Review_DetailService;

public class Review_DetailAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Review_dto> listinfo = new ArrayList<Review_dto>();
		List<Product_dto> listimg = new ArrayList<Product_dto>();
		
		String review_name = request.getParameter("review_name");
		String review_id = request.getParameter("review_id");
		
		Review_DetailService reviewDetailService = new Review_DetailService();
		
		listinfo = reviewDetailService.getReviewDetail(review_name, review_id);
		listimg = reviewDetailService.getReviewDetailImg(review_name);
		
		request.setAttribute("listinfo", listinfo);
		request.setAttribute("listimg", listimg);
   		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_review/review_detail.jsp");
		return forward;
	}
	
}

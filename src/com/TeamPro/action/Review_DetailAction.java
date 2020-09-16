package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.ReviewComment_dto;
import com.TeamPro.dto.ReviewReply_dto;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.service.Review_AllListService;
import com.TeamPro.service.Review_DetailService;

public class Review_DetailAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Review_dto> listinfo = new ArrayList<Review_dto>();
		List<Product_dto> listimg = new ArrayList<Product_dto>();
		List<ReviewComment_dto> listcomment = new ArrayList<ReviewComment_dto>();
		List<ReviewReply_dto> listreply = new ArrayList<ReviewReply_dto>();
		
		Integer review_num = Integer.parseInt(request.getParameter("review_num"));
		Integer comment_num = Integer.parseInt(request.getParameter("comment_num"));
		
		Review_DetailService reviewDetailService = new Review_DetailService();
		
		listinfo = reviewDetailService.getReviewDetail(review_num);
		listimg = reviewDetailService.getReviewDetailImg(review_num);
		listcomment = reviewDetailService.getReviewComment(review_num);
		listreply = reviewDetailService.getReviewReply(review_num, comment_num);
		
		request.setAttribute("listinfo", listinfo);
		request.setAttribute("listimg", listimg);
		request.setAttribute("listcomment", listcomment);
		request.setAttribute("listreply", listreply);
   		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_review/review_detail.jsp");
		return forward;
	}
	
}

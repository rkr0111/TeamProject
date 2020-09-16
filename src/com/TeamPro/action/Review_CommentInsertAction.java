package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.ReviewComment_dto;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.service.Review_AllListService;
import com.TeamPro.service.Review_CommentService;
import com.TeamPro.service.Review_DetailService;

public class Review_CommentInsertAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Review_dto> listinfo = new ArrayList<Review_dto>();
		boolean isComment = false;
		
		String comment_id = request.getParameter("comment_id");
		String comment_text = request.getParameter("comment_text");
		int reviewboard_num = Integer.parseInt(request.getParameter("reviewboard_num"));
		
		Review_CommentService reviewCommentService = new Review_CommentService();
		
		isComment = reviewCommentService.setReviewComment(comment_id, comment_text, reviewboard_num);
		
		if(isComment) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("reviewDetailSelect.bo?review_num="+reviewboard_num);
		}
		return forward;		
	}
	
}

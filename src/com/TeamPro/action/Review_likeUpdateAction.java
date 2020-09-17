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
import com.TeamPro.service.Review_CommentInsertService;
import com.TeamPro.service.Review_DetailService;
import com.TeamPro.service.Review_ReplyInsertService;
import com.TeamPro.service.Review_likeUpdateService;

public class Review_likeUpdateAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isComment = false;
		
		String reivew_id = request.getParameter("reivew_id");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		
		Review_likeUpdateService reviewReplyInsertService = new Review_likeUpdateService();
		
		isComment = reviewReplyInsertService.setReviewReply(reivew_id, review_num);
		
		if(isComment) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("reviewDetailSelect.bo?review_num="+review_num);
		}
		return forward;		
	}
	
}

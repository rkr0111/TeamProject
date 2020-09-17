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

public class Review_ReplyInsertAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isComment = false;
		
		String reply_id = request.getParameter("reply_id");
		String reply_text = request.getParameter("reply_text");
		int reviewboard_num = Integer.parseInt(request.getParameter("reviewboard_num"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		
		System.out.println("id : " + reply_id + ", text : " + reply_text + ", boardnum : " + reviewboard_num
							+ ", commentnum : " + comment_num);
		
		Review_ReplyInsertService reviewReplyInsertService = new Review_ReplyInsertService();
		
		isComment = reviewReplyInsertService.setReviewReply(reply_id, reply_text, reviewboard_num, comment_num);
		
		if(isComment) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("reviewDetailSelect.bo?review_num="+reviewboard_num);
		}
		return forward;		
	}
	
}

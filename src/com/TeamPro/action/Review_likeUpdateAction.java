package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.ReviewComment_dto;
import com.TeamPro.dto.ReviewLike_dto;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.service.Review_AllListService;
import com.TeamPro.service.Review_CommentInsertService;
import com.TeamPro.service.Review_DetailService;
import com.TeamPro.service.Review_ReplyInsertService;
import com.TeamPro.service.Review_likeUpdateService;

public class Review_likeUpdateAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		JSONObject jobj = new JSONObject();
		ReviewLike_dto likedto = new ReviewLike_dto();
		List<ReviewLike_dto> likelist = null;
		boolean isCheck = false;
		
		Review_likeUpdateService reviewLikeUpdateService = new Review_likeUpdateService();
		
		String reivew_id = request.getParameter("reivew_id");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		
		likelist = reviewLikeUpdateService.getReviewLike(reivew_id, review_num);
		if(likelist.size() == 0) {
			// 해당 아이디로 좋아요 클릭하지 않았을 떼 좋아요 insert
			likedto.setLike_id(reivew_id);
			likedto.setReviewboard_num(review_num);
			likedto.setLike_check(1);
			isCheck = reviewLikeUpdateService.setReviewLike(likedto);
		}else {
			// 해당 아이디로 좋아요 클릭하지 않았을 떼 좋아요 update
			likedto.setLike_id(reivew_id);
			likedto.setReviewboard_num(review_num);
			likedto.setLike_check(0);
			isCheck = reviewLikeUpdateService.updateReviewLike(likedto);
		}
		
		request.setAttribute("likeCheck", likedto.getLike_check());
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("reviewDetailSelect.bo?review_num="+review_num);
		
		return forward;		
	}
	
}

package com.TeamPro.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.ReviewLike_dto;
import com.TeamPro.service.Review_likeUpdateService;

public class Review_likeUpdateAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ReviewLike_dto likedto = new ReviewLike_dto();
		List<ReviewLike_dto> likelist = null;
		int isis = 0;
		boolean isCheck = false;
		
		Review_likeUpdateService reviewLikeUpdateService = new Review_likeUpdateService();
		
		String reivew_id = request.getParameter("reivew_id");
		int review_num = Integer.parseInt(request.getParameter("review_num"));

		likelist = reviewLikeUpdateService.getReviewLike(reivew_id, review_num);
		
		if(likelist.size() == 0) {
			
			// 게시물 좋아요가 없을 경우
			likedto.setLike_id(reivew_id);
			likedto.setReviewboard_num(review_num);
			likedto.setLike_check(1);
			isCheck = reviewLikeUpdateService.setReviewLike(likedto);
			
		}else if(likelist.size() != 0) {
			int i=0;
			
			while( i<likelist.size() ) {
				
				if(!likelist.get(i).getLike_id().equals(reivew_id)) {
					likedto.setLike_id(reivew_id);
					likedto.setReviewboard_num(review_num);
					likedto.setLike_check(1);
					isis = 0;
				}else if(likelist.get(i).getLike_id().equals(reivew_id) && likelist.get(i).getReviewboard_num() == review_num && likelist.get(i).getLike_check() == 1) {
					// 다시 해당 아이디로 좋아요 클릭했을 때 update - off
					likedto.setLike_id(reivew_id);
					likedto.setReviewboard_num(review_num);
					likedto.setLike_check(0);
					isis = 1;
				}else if(likelist.get(i).getLike_id().equals(reivew_id) && likelist.get(i).getReviewboard_num() == review_num && likelist.get(i).getLike_check() == 0) {
					// 다시 해당 아이디로 좋아요 클릭했을 때 update - on
					likedto.setLike_id(reivew_id);
					likedto.setReviewboard_num(review_num);
					likedto.setLike_check(1);
					isis = 1;
				}
				i++;
				
			}
			
			if(isis == 0) {	
				isCheck = reviewLikeUpdateService.setReviewLike(likedto);
			}else if(isis == 1) {
				isCheck = reviewLikeUpdateService.updateReviewLike(likedto);
			}
			
		}
		
		request.setAttribute("like_check", likedto.getLike_check());
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("reviewDetailSelect.bo?review_num="+review_num+"&like_check="+request.getAttribute("like_check"));
		
		return forward;		
	}
	
}

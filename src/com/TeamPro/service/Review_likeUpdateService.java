package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.ReviewLike_dto;
import com.TeamPro.dto.Review_dto;

public class Review_likeUpdateService {
	
	public List<ReviewLike_dto> getReviewLike(String reply_id, int review_num) throws Exception {
		ReviewLike_dto likedto = new ReviewLike_dto();
		boolean isInsertSuccess = false;
		int isSelect = 0;
		List<ReviewLike_dto> likelist = null;
		ArrayList<ReviewLike_dto> list = new ArrayList<ReviewLike_dto>();
		
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		
		likelist = prodao.Conn_reviewLikeSelect(reply_id, review_num);
		
		for(int i=0; i<likelist.size(); i++) {
			likedto.setLike_check(likelist.get(i).getLike_check());
			likedto.setLike_id(likelist.get(i).getLike_id());
			likedto.setLikeno(likelist.get(i).getLikeno());
			likedto.setReviewboard_num(likelist.get(i).getReviewboard_num());
			list.add(likedto);
		}
		
		return likelist;
	}
	
	public boolean setReviewLike(ReviewLike_dto likedto) {
		boolean isInsertSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		
		int insertCount = prodao.Conn_reviewLikeInsert(likedto);
		
		if(insertCount > 0) {
			isInsertSuccess = true;
		}	
		
		return isInsertSuccess;
	}
	
}

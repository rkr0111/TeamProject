package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Review_dto;

public class Review_AllListService {

	public List<Review_dto> getReviewAllList() throws Exception {
		List<Review_dto> reviewalllist = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		reviewalllist = prodao.Conn_select_reviewAllList();
		Review_dto reviewdto = new Review_dto();
		ArrayList<Review_dto> list = new ArrayList<Review_dto>();
		
		for(int i = 0; i < reviewalllist.size(); i++) {
			reviewdto.setReview_name(reviewalllist.get(i).getReview_name());
			reviewdto.setReview_img(reviewalllist.get(i).getReview_img());
			reviewdto.setReview_contents(reviewalllist.get(i).getReview_contents());
			reviewdto.setReview_date(reviewalllist.get(i).getReview_date());
			reviewdto.setReview_id(reviewalllist.get(i).getReview_id());
			reviewdto.setReview_comment(reviewalllist.get(i).getReview_comment());
			reviewdto.setReview_reply(reviewalllist.get(i).getReview_reply());
			reviewdto.setReview_like(reviewalllist.get(i).getReview_like());
			list.add(reviewdto);
		}
		return reviewalllist;
	}
	
}

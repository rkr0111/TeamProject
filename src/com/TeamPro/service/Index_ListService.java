package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Review_dto;

public class Index_ListService {
	// 0929 review list select - dhdbswl 수정
	public List<Review_dto> getReviewList() throws Exception {
		System.out.println("연결 service");
		List<Review_dto> reviewlist = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		reviewlist = prodao.Conn_select_indexReviewList();
		Review_dto reivewdto = new Review_dto();
		ArrayList<Review_dto> list = new ArrayList<Review_dto>();
		
		for(int i = 0; i < reviewlist.size(); i++) {
			reivewdto.setReview_num(reviewlist.get(i).getReview_num());
			reivewdto.setReview_contents(reviewlist.get(i).getReview_contents());
			reivewdto.setReview_img(reviewlist.get(i).getReview_img());
			list.add(reivewdto);
		}
		return reviewlist;
	}
}

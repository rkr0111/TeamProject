package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.CustomerCenter_dto;
import com.TeamPro.dto.Review_dto;

public class Index_ListService {
	// 0929 review list select - dhdbswl ¼öÁ¤
	public List<Review_dto> getReviewList() throws Exception {
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
	
	// 10/2 
	public List<CustomerCenter_dto> getCustomerCenterList() throws Exception {
		List<CustomerCenter_dto> centerlist = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		centerlist = prodao.Conn_select_indexCustomerCenterList();
		CustomerCenter_dto centerdto = new CustomerCenter_dto();
		ArrayList<CustomerCenter_dto> list = new ArrayList<CustomerCenter_dto>();
		
		for(int i = 0; i < centerlist.size(); i++) {
			centerdto.setCenter_category(centerlist.get(i).getCenter_category());
			centerdto.setCenter_no(centerlist.get(i).getCenter_no());
			centerdto.setCenter_title(centerlist.get(i).getCenter_title());
			centerdto.setCenter_date(centerlist.get(i).getCenter_date());
			centerdto.setCenter_contents(centerlist.get(i).getCenter_contents());
			list.add(centerdto);
		}
		
		return centerlist;
	}
}

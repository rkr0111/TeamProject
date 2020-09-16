package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.Review_dto;

public class Review_AllListService {

	public List<Product_dto> getListImg() throws Exception {
		List<Product_dto> prolist = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		prolist = prodao.Conn_select_listImg();
		Product_dto prodto = new Product_dto();
		ArrayList<Product_dto> list = new ArrayList<Product_dto>();
		
		for(int i = 0; i < prolist.size(); i++) {
			prodto.setProduct_name(prolist.get(i).getProduct_name());
			prodto.setProduct_category(prolist.get(i).getProduct_category());
			list.add(prodto);
		}
		return prolist;
	}
	
	public List<Review_dto> getListInfo() throws Exception {
		List<Review_dto> infolist = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		infolist = prodao.Conn_select_listInfo();
		Review_dto reviewdto = new Review_dto();
		ArrayList<Review_dto> list = new ArrayList<Review_dto>();
		
		for(int i=0; i<infolist.size(); i++) {
			reviewdto.setReview_name(infolist.get(i).getReview_name());
			reviewdto.setReview_img(infolist.get(i).getReview_img());
			reviewdto.setReview_contents(infolist.get(i).getReview_contents());
			reviewdto.setReview_date(infolist.get(i).getReview_date());
			reviewdto.setReview_id(infolist.get(i).getReview_id());
			reviewdto.setReview_comment(infolist.get(i).getReview_comment());
			reviewdto.setReview_reply(infolist.get(i).getReview_reply());
			reviewdto.setReview_like(infolist.get(i).getReview_like());
			reviewdto.setReview_num(infolist.get(i).getReview_num());
			list.add(reviewdto);
		}
		
		return infolist;
	}
	
}

package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.Review_dto;

public class Review_DetailService {
	
	public List<Review_dto> getReviewDetail(String review_name, String review_id) throws Exception {
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		
		List<Review_dto> detailSelect = null;
		ArrayList<Review_dto> list = new ArrayList<Review_dto>();
		Review_dto reviewdto = new Review_dto();
		
		detailSelect = prodao.Conn_reviewDetailSelect(review_name, review_id);
		
		reviewdto.setReview_name(detailSelect.get(0).getReview_name());
		reviewdto.setReview_img(detailSelect.get(0).getReview_img());
		reviewdto.setReview_contents(detailSelect.get(0).getReview_contents());
		reviewdto.setReview_date(detailSelect.get(0).getReview_date());
		reviewdto.setReview_id(detailSelect.get(0).getReview_id());
		reviewdto.setReview_comment(detailSelect.get(0).getReview_comment());
		reviewdto.setReview_reply(detailSelect.get(0).getReview_reply());
		reviewdto.setReview_like(detailSelect.get(0).getReview_like());
		list.add(reviewdto);
		
		return detailSelect;
	}
	
	public List<Product_dto> getReviewDetailImg(String review_name) throws Exception {
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		
		List<Product_dto> prolist = null;
		ArrayList<Product_dto> list = new ArrayList<Product_dto>();
		Product_dto prodto = new Product_dto();
		
		prolist = prodao.Conn_reviewDetailImgSelcet(review_name);
		
		prodto.setProduct_category(prolist.get(0).getProduct_category());
		prodto.setProduct_img(prolist.get(0).getProduct_img());
		list.add(prodto);
		
		return prolist;
	}
	
}

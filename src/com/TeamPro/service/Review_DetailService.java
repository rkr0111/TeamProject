package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.ReviewComment_dto;
import com.TeamPro.dto.ReviewReply_dto;
import com.TeamPro.dto.Review_dto;

public class Review_DetailService {
	
	public List<Review_dto> getReviewDetail(int review_num) throws Exception {
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		
		List<Review_dto> detailSelect = null;
		ArrayList<Review_dto> list = new ArrayList<Review_dto>();
		Review_dto reviewdto = new Review_dto();
		
		detailSelect = prodao.Conn_reviewDetailSelect(review_num);
		
		reviewdto.setReview_name(detailSelect.get(0).getReview_name());
		reviewdto.setReview_img(detailSelect.get(0).getReview_img());
		reviewdto.setReview_contents(detailSelect.get(0).getReview_contents());
		reviewdto.setReview_date(detailSelect.get(0).getReview_date());
		reviewdto.setReview_id(detailSelect.get(0).getReview_id());
		reviewdto.setReview_comment(detailSelect.get(0).getReview_comment());
		reviewdto.setReview_reply(detailSelect.get(0).getReview_reply());
		reviewdto.setReview_like(detailSelect.get(0).getReview_like());
		reviewdto.setReview_num(detailSelect.get(0).getReview_num());
		list.add(reviewdto);
		
		return detailSelect;
	}
	
	public List<Product_dto> getReviewDetailImg(int review_num) throws Exception {
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		
		List<Product_dto> prolist = null;
		ArrayList<Product_dto> list = new ArrayList<Product_dto>();
		Product_dto prodto = new Product_dto();
		
		prolist = prodao.Conn_reviewDetailImgSelcet(review_num);
		
		prodto.setProduct_category(prolist.get(0).getProduct_category());
		prodto.setProduct_img(prolist.get(0).getProduct_img());
		list.add(prodto);
		
		return prolist;
	}
	
	public List<ReviewComment_dto> getReviewComment(int review_num) throws Exception {
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		
		List<ReviewComment_dto> cmtlist = null;
		ArrayList<ReviewComment_dto> list = new ArrayList<ReviewComment_dto>();
		ReviewComment_dto cmtdto = new ReviewComment_dto();
		
		cmtlist = prodao.Conn_reviewCommentSelect(review_num);
		
		if(!cmtlist.isEmpty()) {
			cmtdto.setComment_num(cmtlist.get(0).getComment_num());
			cmtdto.setReviewboard_num(cmtlist.get(0).getReviewboard_num());
			cmtdto.setComment_id(cmtlist.get(0).getComment_id());
			cmtdto.setComment_text(cmtlist.get(0).getComment_text());
			cmtdto.setComment_date(cmtlist.get(0).getComment_date());
			list.add(cmtdto);
		}
		
		return cmtlist;
	}
	
	public List<ReviewReply_dto> getReviewReply(int review_num) throws Exception {
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		
		List<ReviewReply_dto> replyist = null;
		ArrayList<ReviewReply_dto> list = new ArrayList<ReviewReply_dto>();
		ReviewReply_dto replydto = new ReviewReply_dto();
		
		replyist = prodao.Conn_reviewReplySelect(review_num);
		
		if(!replyist.isEmpty()) {
			replydto.setReply_num(replyist.get(0).getReply_num());
			replydto.setReviewboard_num(replyist.get(0).getReviewboard_num());
			replydto.setReply_id(replyist.get(0).getReply_id());
			replydto.setReply_text(replyist.get(0).getReply_text());
			replydto.setReply_date(replyist.get(0).getReply_date());
			list.add(replydto);
		}
		
		return replyist;
	}
	
}

package com.TeamPro.dto;

import java.sql.Date;

public class ReviewLike_dto {
	
	int likeno;
	int reviewboard_num;
	String like_id;
	int like_check;
	
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
	public int getReviewboard_num() {
		return reviewboard_num;
	}
	public void setReviewboard_num(int reviewboard_num) {
		this.reviewboard_num = reviewboard_num;
	}
	public String getLike_id() {
		return like_id;
	}
	public void setLike_id(String like_id) {
		this.like_id = like_id;
	}
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	
}

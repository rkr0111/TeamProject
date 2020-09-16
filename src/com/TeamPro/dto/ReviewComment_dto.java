package com.TeamPro.dto;

import java.sql.Date;

public class ReviewComment_dto {
	
	int comment_num;
	int reviewboard_num;
	String comment_id;
	String comment_text;
	Date comment_date;
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getReviewboard_num() {
		return reviewboard_num;
	}
	public void setReviewboard_num(int reviewboard_num) {
		this.reviewboard_num = reviewboard_num;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_text() {
		return comment_text;
	}
	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	
}

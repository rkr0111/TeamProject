package com.TeamPro.dto;

import java.sql.Date;

public class ReviewReply_dto {
	
	int reply_num;
	int reviewboard_num;
	int comment_num;
	String reply_id;
	String reply_text;
	Date reply_date;
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getReviewboard_num() {
		return reviewboard_num;
	}
	public void setReviewboard_num(int reviewboard_num) {
		this.reviewboard_num = reviewboard_num;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
}

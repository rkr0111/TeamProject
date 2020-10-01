package com.TeamPro.dto;

import java.sql.Date;

public class CustomerCenter_dto {
	
	String center_category;
	int center_no;
	String center_title;
	Date center_date;
	String center_contents;
	String center_reply;
	String center_id;
	String center_name;
	String center_phone;

	int startrow;
	
	public String getCenter_category() {
		return center_category;
	}
	public void setCenter_category(String center_category) {
		this.center_category = center_category;
	}
	public int getCenter_no() {
		return center_no;
	}
	public void setCenter_no(int center_no) {
		this.center_no = center_no;
	}
	public String getCenter_title() {
		return center_title;
	}
	public void setCenter_title(String center_title) {
		this.center_title = center_title;
	}
	public Date getCenter_date() {
		return center_date;
	}
	public void setCenter_date(Date center_date) {
		this.center_date = center_date;
	}
	public String getCenter_contents() {
		return center_contents;
	}
	public void setCenter_contents(String center_contents) {
		this.center_contents = center_contents;
	}
	public String getCenter_reply() {
		return center_reply;
	}
	public void setCenter_reply(String center_reply) {
		this.center_reply = center_reply;
	}
	public String getCenter_id() {
		return center_id;
	}
	public void setCenter_id(String center_id) {
		this.center_id = center_id;
	}
	public String getCenter_name() {
		return center_name;
	}
	public void setCenter_name(String center_name) {
		this.center_name = center_name;
	}
	public String getCenter_phone() {
		return center_phone;
	}
	public void setCenter_phone(String center_phone) {
		this.center_phone = center_phone;
	}
	
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
		
}

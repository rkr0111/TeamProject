package com.TeamPro.dto;

import java.sql.Date;

public class Ashistory_dto {
	int as_num;
	String as_id;
	String as_name;
	String as_subject;
	Date as_date;
	String as_contents;
	String as_condition;
	
	public int getAs_num() {
		return as_num;
	}
	public void setAs_num(int as_num) {
		this.as_num = as_num;
	}
	public String getAs_id() {
		return as_id;
	}
	public void setAs_id(String as_id) {
		this.as_id = as_id;
	}
	public String getAs_name() {
		return as_name;
	}
	public void setAs_name(String as_name) {
		this.as_name = as_name;
	}
	public String getAs_subject() {
		return as_subject;
	}
	public void setAs_subject(String as_subject) {
		this.as_subject = as_subject;
	}
	public Date getAs_date() {
		return as_date;
	}
	public void setAs_date(Date as_date) {
		this.as_date = as_date;
	}
	public String getAs_contents() {
		return as_contents;
	}
	public void setAs_contents(String as_contents) {
		this.as_contents = as_contents;
	}
	public String getAs_condition() {
		return as_condition;
	}
	public void setAs_condition(String as_condition) {
		this.as_condition = as_condition;
	}
}

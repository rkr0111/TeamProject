package com.TeamPro.dto;

import java.sql.Date;

public class CustomerInfo_dto {
	String customer_id;
	String customer_pwd;
	String customer_email;
	String customer_name;
	Date customer_birth;
	String customer_post;
	String customer_addr;
	String customer_phone;
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_pwd() {
		return customer_pwd;
	}
	public void setCustomer_pwd(String customer_pwd) {
		this.customer_pwd = customer_pwd;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public Date getCustomer_birth() {
		return customer_birth;
	}
	public void setCustomer_birth(Date customer_birth) {
		this.customer_birth = customer_birth;
	}
	public String getCustomer_post() {
		return customer_post;
	}
	public void setCustomer_post(String customer_post) {
		this.customer_post = customer_post;
	}
	public String getCustomer_addr() {
		return customer_addr;
	}
	public void setCustomer_addr(String customer_addr) {
		this.customer_addr = customer_addr;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	
}

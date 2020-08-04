package com.TeamPro.dto;

import java.sql.Date;

public class Buyhistory_dto {
	
	String buy_id;
	String buy_name;
	int buy_price;
	Date buy_date;
	String buy_condition;
	
	public String getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(String buy_id) {
		this.buy_id = buy_id;
	}
	public String getBuy_name() {
		return buy_name;
	}
	public void setBuy_name(String buy_name) {
		this.buy_name = buy_name;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public String getBuy_condition() {
		return buy_condition;
	}
	public void setBuy_condition(String buy_condition) {
		this.buy_condition = buy_condition;
	}	
}

package com.TeamPro.dto;

import java.sql.Date;

public class Buyhistory_dto {
	
	String buy_id;
	String buy_name;
	int buy_price;
	Date buy_date;
	String buy_condition;
	
	Date before_buyDate;
	
	String buy_category;
	String buy_img;
	String buy_colors;
	int buy_amount;
	int buy_totalprice;

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

	public Date getBefore_buyDate() {
		return before_buyDate;
	}

	public void setBefore_buyDate(Date before_buyDate) {
		this.before_buyDate = before_buyDate;
	}

	public String getBuy_category() {
		return buy_category;
	}

	public void setBuy_category(String buy_category) {
		this.buy_category = buy_category;
	}

	public String getBuy_img() {
		return buy_img;
	}

	public void setBuy_img(String buy_img) {
		this.buy_img = buy_img;
	}

	public String getBuy_colors() {
		return buy_colors;
	}

	public void setBuy_colors(String buy_colors) {
		this.buy_colors = buy_colors;
	}

	public int getBuy_amount() {
		return buy_amount;
	}

	public void setBuy_amount(int buy_amount) {
		this.buy_amount = buy_amount;
	}

	public int getBuy_totalprice() {
		return buy_totalprice;
	}

	public void setBuy_totalprice(int buy_totalprice) {
		this.buy_totalprice = buy_totalprice;
	}
	
}

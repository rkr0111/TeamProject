package com.TeamPro.dto;

import java.sql.Date;

public class Product_dto {
	
	String product_name;
	String product_category;
	int product_price;
	String product_color;
	String product_file;
	String product_img;
	String product_detailimg;
	String product_contents;
	String product_weather;
	Date product_date;
	
	String check;
	int startrow;
	
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_color() {
		return product_color;
	}
	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}
	public String getProduct_file() {
		return product_file;
	}
	public void setProduct_file(String product_file) {
		this.product_file = product_file;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_detailimg() {
		return product_detailimg;
	}
	public void setProduct_detailimg(String product_detailimg) {
		this.product_detailimg = product_detailimg;
	}
	public String getProduct_contents() {
		return product_contents;
	}
	public void setProduct_contents(String product_contents) {
		this.product_contents = product_contents;
	}	
	public String getProduct_weather() {
		return product_weather;
	}
	public void setProduct_weather(String product_weather) {
		this.product_weather = product_weather;
	}	
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
}

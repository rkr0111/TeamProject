package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class MD_randomListService {
	
	public int getListCount() throws Exception {
		int listCount = 0;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		listCount = prodao.select_ListcountAll();
		return listCount;
	}
	
	public List<Product_dto> getProductList(int randomNum) throws Exception {
		List<Product_dto> productList = null;
		ArrayList<Product_dto> list = new ArrayList<Product_dto>();
		Product_dto prodto = new Product_dto();
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		productList = prodao.Conn_select();
		
		for(int i=0; i<productList.size(); i++) {
			prodto.setProduct_name(productList.get(randomNum).getProduct_name());
			prodto.setProduct_contents(productList.get(randomNum).getProduct_contents());
			prodto.setProduct_img(productList.get(randomNum).getProduct_img());
			prodto.setProduct_category(productList.get(randomNum).getProduct_category());
			list.add(prodto);
		}
		return list;
	}
	
	public List<Product_dto> getproductAllList() throws Exception {
		List<Product_dto> proAllList = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		proAllList = prodao.Conn_select();
		Product_dto prodto = new Product_dto();
		ArrayList<Product_dto> list = new ArrayList<Product_dto>();
		
		for(int i = 0; i < proAllList.size(); i++) {
			prodto.setProduct_name(proAllList.get(i).getProduct_name());
			prodto.setProduct_category(proAllList.get(i).getProduct_category());
			prodto.setProduct_color(proAllList.get(i).getProduct_color());
			prodto.setProduct_img(proAllList.get(i).getProduct_img());
			prodto.setProduct_contents(proAllList.get(i).getProduct_contents());
			prodto.setProduct_weather(proAllList.get(i).getProduct_weather());
			list.add(prodto);
		}
		return proAllList;
	}
	
	public List<Product_dto> getWeatherProList(String product_weather) throws Exception {
		List<Product_dto> productList = null;
		Product_dto prodto = new Product_dto();
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		productList = prodao.Conn_select_weatherPro(product_weather);
		
		for(int i=0; i<productList.size(); i++) {
			prodto.setProduct_name(productList.get(i).getProduct_name());
			prodto.setProduct_contents(productList.get(i).getProduct_contents());
			prodto.setProduct_img(productList.get(i).getProduct_img());
			prodto.setProduct_category(productList.get(i).getProduct_category());
		}
		return productList;
	}
	
}

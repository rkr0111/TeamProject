package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class MD_weatherListService {
	public List<Product_dto> getWeatherProList(String product_weather) throws Exception {
		List<Product_dto> productList = null;
		ArrayList<Product_dto> list = new ArrayList<Product_dto>();
		Product_dto prodto = new Product_dto();
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		productList = prodao.Conn_select_weatherPro(product_weather);
		
		for(int i=0; i<productList.size(); i++) {
			prodto.setProduct_name(productList.get(i).getProduct_name());
			prodto.setProduct_contents(productList.get(i).getProduct_contents());
			prodto.setProduct_img(productList.get(i).getProduct_img());
			prodto.setProduct_category(productList.get(i).getProduct_category());
			list.add(prodto);
		}
		return list;
	}
}

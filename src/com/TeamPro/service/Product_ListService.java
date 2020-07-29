package com.TeamPro.service;

import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class Product_ListService {

	public List<Product_dto> getProductList(String search_product) throws Exception {
		
		List<Product_dto> productList = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		productList = prodao.Conn_select_proList(search_product);
		return productList;
	}	
}

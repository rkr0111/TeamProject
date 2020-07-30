package com.TeamPro.service;

import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class Product_ListService {
	// 0730 dhdbswl 추가
	public int getListCount() throws Exception {
		int listCount = 0;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		listCount = prodao.select_ListCount();
		System.out.println("list service getListCount : " + listCount);
		return listCount;
	}
	// 0730 dhdbswl 수정
	public List<Product_dto> getProductList(String product_name) throws Exception {
		List<Product_dto> productList = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		productList = prodao.Conn_select_proList(product_name);
		System.out.println("list service getProductList : " + product_name + ", " + productList);
		return productList;
	}	
}

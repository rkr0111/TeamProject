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
	
	public List<Product_dto> getProductList(int randomNum) {
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
	
}

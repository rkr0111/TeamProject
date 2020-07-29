package com.TeamPro.service;

import java.util.List;
import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class Product_UpdateService {

	public List<Product_dto> getProductUpdate(String search_product) throws Exception {
	
		List<Product_dto> productUpdate = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance(); 
		productUpdate = prodao.Conn_update_proList(search_product);
		return productUpdate;
	}
}

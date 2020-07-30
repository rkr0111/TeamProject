package com.TeamPro.service;

import java.util.List;
import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class Product_UpdateProService {
	
	public List<Product_dto> getProductProUpdate(String product_name) throws Exception {
		
		List<Product_dto> productUpdate = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		productUpdate = prodao.Conn_updateselect(product_name);
		return productUpdate;
	}
}

package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class Product_UpdateService {
	
	public boolean getProductUpdate(Product_dto dto) throws Exception {
		boolean isUpdateSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		
		List<Product_dto> connresultupd = new ArrayList<Product_dto>();
		
		int updateCount = prodao.Conn_update(dto);
		
		if(updateCount > 0) {
			isUpdateSuccess = true;
		}
		else {
			System.out.println("update fail");
		}
		return isUpdateSuccess;
	}
}

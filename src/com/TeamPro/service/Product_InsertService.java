package com.TeamPro.service;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class Product_InsertService {
	
	public boolean isInsert(Product_dto prodto) throws Exception {
		boolean isInsertSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		int insertCount = prodao.Conn_insert(prodto);
		
		if(insertCount > 0) {
			isInsertSuccess = true;
		}
		
		System.out.println("insert service : " + insertCount);
		
		return isInsertSuccess;
	}
}

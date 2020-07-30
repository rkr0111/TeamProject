package com.TeamPro.service;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class Product_DeleteService {
	
	public boolean getProductDelete(Product_dto dto) throws Exception {
		boolean isDeleteSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		int deleteCount = prodao.Conn_update(dto);
		
		if(deleteCount > 0) {
			prodao.Conn_delete(dto);
			isDeleteSuccess = true;
		}
		else {
			System.out.println("delete fail");
		}
		return isDeleteSuccess;
	}
}

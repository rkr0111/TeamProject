package com.TeamPro.service;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Buyhistory_dto;
import com.TeamPro.dto.Cart_dto;

public class Cart_ProInsertService {
	
	public boolean isInsert(Cart_dto cartdto) throws Exception {
		boolean isInsertSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		int insertCount = prodao.Conn_insert_cart(cartdto);
		
		if(insertCount > 0) {
			isInsertSuccess = true;
		}		
		return isInsertSuccess;
	}
}

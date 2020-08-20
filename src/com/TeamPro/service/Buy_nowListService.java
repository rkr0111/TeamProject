package com.TeamPro.service;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Buyhistory_dto;
import com.TeamPro.dto.Product_dto;

public class Buy_nowListService {

	public boolean isInsert(Buyhistory_dto buyDto) throws Exception {
		boolean isInsertSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		int insertCount = prodao.Conn_insert_buyhistory(buyDto);
		
		if(insertCount > 0) {
			isInsertSuccess = true;
		}	
		
		return isInsertSuccess;
	}
	
}

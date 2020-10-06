package com.TeamPro.service;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Buyhistory_dto;

public class Buy_ProInsertService {
	
	public boolean isInsert(Buyhistory_dto buydto) throws Exception {
		boolean isInsertSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		int insertCount = prodao.Conn_insert_buyhistory(buydto);
		
		if(insertCount > 0) {
			isInsertSuccess = true;
		}		
		return isInsertSuccess;
	}
}

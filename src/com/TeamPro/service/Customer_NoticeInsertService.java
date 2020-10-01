package com.TeamPro.service;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.CustomerCenter_dto;

public class Customer_NoticeInsertService {
	
	public boolean isInsert(CustomerCenter_dto centerdto) throws Exception {
		boolean isInsertSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		int insertCount = prodao.Conn_CustomerNoticeinsert(centerdto);
		
		if(insertCount > 0) {
			isInsertSuccess = true;
		}		
		return isInsertSuccess;
	}
}

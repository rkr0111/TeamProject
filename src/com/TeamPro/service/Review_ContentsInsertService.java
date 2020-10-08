package com.TeamPro.service;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Review_dto;

public class Review_ContentsInsertService {
	
	public boolean isInsert(Review_dto dto) throws Exception {
		boolean isInsertSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		int insertCount = prodao.Conn_insert_reviewContents(dto);
		
		if(insertCount > 0) {
			isInsertSuccess = true;
		}		
		return isInsertSuccess;
	}
}

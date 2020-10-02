package com.TeamPro.service;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.CustomerCenter_dto;

public class Customer_NoticeDeleteService {
	
	public boolean getNoticeDelete(CustomerCenter_dto dto) throws Exception {
		boolean isDeleteSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		int deleteCount = prodao.Conn_CustomerNotioce(dto);
		
		if(deleteCount > 0) {
			isDeleteSuccess = true;
		}
		else {
			System.out.println("delete fail");
		}
		return isDeleteSuccess;
	}
}

package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.CustomerCenter_dto;

public class Customer_NoticeUpdateService {
	
	public boolean getProductUpdate(CustomerCenter_dto dto) throws Exception {
		boolean isUpdateSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		
		List<CustomerCenter_dto> connresultupd = new ArrayList<CustomerCenter_dto>();
		
		int updateCount = prodao.Conn_update_customerNotice(dto);
		
		if(updateCount > 0) {
			isUpdateSuccess = true;
		}
		else {
			System.out.println("update fail");
		}
		return isUpdateSuccess;
	}
}

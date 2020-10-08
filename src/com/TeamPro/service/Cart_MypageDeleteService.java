package com.TeamPro.service;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Cart_dto;

public class Cart_MypageDeleteService {
	
	public boolean getProductDelete(Cart_dto dto) throws Exception {
		boolean isDeleteSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();

		prodao.Conn_delete_mypageCart(dto);
		isDeleteSuccess = true;
		return isDeleteSuccess;
	}
}

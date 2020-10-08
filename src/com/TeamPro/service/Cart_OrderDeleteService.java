package com.TeamPro.service;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Cart_dto;

public class Cart_OrderDeleteService {
	
	public boolean isCartDelete(Cart_dto cartdto) throws Exception {
		boolean isDeleteSuccess = false;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();

		prodao.Conn_delete_cartOrder(cartdto);
		isDeleteSuccess = true;
		return isDeleteSuccess;
	}
}

package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Buyhistory_dto;
import com.TeamPro.dto.CustomerInfo_dto;
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
	
	public List<Buyhistory_dto> getBuyList(Buyhistory_dto buyDto) throws Exception {
		List<Buyhistory_dto> buyList = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		buyList = prodao.Conn_select_buyList(buyDto);
		
		Buyhistory_dto buyhistory_dto = new Buyhistory_dto();
		ArrayList<Buyhistory_dto> list = new ArrayList<Buyhistory_dto>();
		
		for(int i=0; i<buyList.size(); i++) {
			buyhistory_dto.setBuy_id(buyList.get(i).getBuy_id());
			buyhistory_dto.setBuy_name(buyList.get(i).getBuy_name());
			buyhistory_dto.setBuy_price(buyList.get(i).getBuy_price());
			buyhistory_dto.setBuy_date(buyList.get(i).getBuy_date());
			buyhistory_dto.setBuy_condition(buyList.get(i).getBuy_condition());
			buyhistory_dto.setBuy_category(buyList.get(i).getBuy_category());
			buyhistory_dto.setBuy_img(buyList.get(i).getBuy_img());
			buyhistory_dto.setBuy_colors(buyList.get(i).getBuy_colors());
			buyhistory_dto.setBuy_amount(buyList.get(i).getBuy_amount());
			buyhistory_dto.setBuy_totalprice(buyList.get(i).getBuy_totalprice());
			list.add(buyhistory_dto);
		}
		
		return buyList;
	}
	
	public List<CustomerInfo_dto> getCustomerList(String id) throws Exception {
		List<CustomerInfo_dto> customerList = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		customerList = prodao.Conn_select_customerList(id);
		
		CustomerInfo_dto customerInfo_dto = new CustomerInfo_dto();
		ArrayList<CustomerInfo_dto> list = new ArrayList<CustomerInfo_dto>();
		
		for(int i=0; i<customerList.size(); i++) {
			customerInfo_dto.setCustomer_id(customerList.get(i).getCustomer_id());
			customerInfo_dto.setCustomer_pwd(customerList.get(i).getCustomer_pwd());
			customerInfo_dto.setCustomer_email(customerList.get(i).getCustomer_email());
			customerInfo_dto.setCustomer_name(customerList.get(i).getCustomer_name());
			customerInfo_dto.setCustomer_birth(customerList.get(i).getCustomer_birth());
			customerInfo_dto.setCustomer_post(customerList.get(i).getCustomer_post());
			customerInfo_dto.setCustomer_addr(customerList.get(i).getCustomer_addr());
			customerInfo_dto.setCustomer_phone(customerList.get(i).getCustomer_phone());
			list.add(customerInfo_dto);
		}
		
		return customerList;
	}
	
}

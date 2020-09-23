package com.TeamPro.service;

import java.util.ArrayList;
import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.Review_dto;

public class Customer_DownloadService {

	public List<Product_dto> getDownloadList() throws Exception {
		List<Product_dto> prolist = null;
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		prolist = prodao.Conn_select_productlist();
		Product_dto prodto = new Product_dto();
		ArrayList<Product_dto> list = new ArrayList<Product_dto>();
		
		for(int i = 0; i < prolist.size(); i++) {
			prodto.setProduct_name(prolist.get(i).getProduct_name());
			prodto.setProduct_category(prolist.get(i).getProduct_category());
			prodto.setProduct_file(prolist.get(i).getProduct_file());
			list.add(prodto);
		}
		return prolist;
	}
	
}

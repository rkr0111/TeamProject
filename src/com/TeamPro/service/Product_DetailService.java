package com.TeamPro.service;

import java.util.List;

import com.TeamPro.dao.TeamPro_dao;
import com.TeamPro.dto.Product_dto;

public class Product_DetailService {
	
	public List<Product_dto> getProductDetail(String product_name) throws Exception {
		TeamPro_dao prodao = TeamPro_dao.getinstance();
		prodao.getConn();
		List<Product_dto> detailSelect = null;
		detailSelect = prodao.Conn_select_proList(product_name);
		
		Product_dto dto = new Product_dto();
		dto.setProduct_name(detailSelect.get(0).toString());
		dto.setProduct_category(detailSelect.get(0).toString());
		dto.setProduct_price(Integer.parseInt(detailSelect.get(0).toString()));
		dto.setProduct_color(detailSelect.get(0).toString());
		dto.setProduct_file(detailSelect.get(0).toString());
		dto.setProduct_img(detailSelect.get(0).toString());
		dto.setProduct_contents(detailSelect.get(0).toString());
		detailSelect.add(dto);
		
		return detailSelect;
	}
}

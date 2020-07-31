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
		dto.setProduct_name(detailSelect.get(0).getProduct_name());
		dto.setProduct_category(detailSelect.get(0).getProduct_category());
		dto.setProduct_price(detailSelect.get(0).getProduct_price());
		dto.setProduct_color(detailSelect.get(0).getProduct_color());
		dto.setProduct_file(detailSelect.get(0).getProduct_file());
		dto.setProduct_img(detailSelect.get(0).getProduct_img());
		dto.setProduct_contents(detailSelect.get(0).getProduct_contents());
		detailSelect.add(dto);
		
		return detailSelect;
	}
}

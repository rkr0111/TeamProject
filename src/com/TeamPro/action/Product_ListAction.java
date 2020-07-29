package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.Product_ListService;

public class Product_ListAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Product_dto> productList = null;
		Product_ListService productListService = new Product_ListService();
		productList = new ArrayList<Product_dto>();
		
		String search_product = request.getParameter("search_product");
		productList = productListService.getProductList(search_product);
		forward.setPath("/product_desk.jsp");
		return forward;
	}
	
}

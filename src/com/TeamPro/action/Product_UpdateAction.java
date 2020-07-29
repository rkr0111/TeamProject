package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.Product_UpdateService;

public class Product_UpdateAction implements Light_action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Product_dto> productUpdate = null;
		Product_UpdateService productUpdateService = new Product_UpdateService();
		productUpdate = new ArrayList<Product_dto>();
		String search_product = request.getParameter("search_product");
		productUpdate = productUpdateService.getProductUpdate(search_product);
		forward.setPath("/productList.bo");
		return forward;
	}
}
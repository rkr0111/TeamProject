package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.Product_UpdateProService;

public class Product_UpdateProAction implements Light_action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Product_dto> productUpdate = new ArrayList<Product_dto>();
		Product_UpdateProService productUpdateProService = new Product_UpdateProService();
		
		
		
		
		
		
		String product_name = request.getParameter("product_name");
		productUpdate = productUpdateProService.getProductProUpdate(product_name);
		
		
		
		forward.setPath("/productList.bo");
		
		
		
		
		
		return forward;
	}
}

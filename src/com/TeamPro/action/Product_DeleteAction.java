package com.TeamPro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.Product_DeleteService;

public class Product_DeleteAction implements Light_action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		boolean isDeleteSuccess = false;
		Product_dto dto = new Product_dto();
		dto.setProduct_name(request.getParameter("product_name"));
		
		Product_DeleteService productDeleteService = new Product_DeleteService();
		isDeleteSuccess = productDeleteService.getProductDelete(dto);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("productList.bo"); 
		return forward;
	}
}

package com.TeamPro.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.Product_DetailService;

public class Product_DetailAction implements Light_action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		List<Product_dto> isDetailSuccess = null;
		Product_dto dto = new Product_dto();
		dto.setProduct_name(request.getParameter("product_name"));
		
		Product_DetailService productDetailService = new Product_DetailService();
		isDetailSuccess = productDetailService.getProductDetail("product_name");
		
		request.setAttribute("isDetailSuccess", isDetailSuccess);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/product_desk.jsp");
		return forward;
	}
}
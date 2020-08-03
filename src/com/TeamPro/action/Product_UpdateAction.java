package com.TeamPro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.Product_UpdateService;

public class Product_UpdateAction implements Light_action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		boolean isUpdateSuccess = false;
		Product_dto dto = new Product_dto();
		
		dto.setCheck(request.getParameter("udt_check"));
		dto.setProduct_name(request.getParameter("udt_name"));
		dto.setProduct_category(request.getParameter("udt_category"));
		dto.setProduct_price(Integer.parseInt(request.getParameter("udt_price")));
		dto.setProduct_color(request.getParameter("udt_color"));
		dto.setProduct_file(request.getParameter("udt_file"));
		dto.setProduct_img(request.getParameter("udt_img"));
		dto.setProduct_contents(request.getParameter("udt_contents"));
		
		System.out.println("action check : "+dto.getCheck());
		System.out.println("action name : "+dto.getProduct_name());
		
		Product_UpdateService productUpdateService = new Product_UpdateService();
		isUpdateSuccess = productUpdateService.getProductUpdate(dto);
		/*request.setAttribute("dto", dto);*/
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/productList.bo"); 
		return forward;
	}
}
package com.TeamPro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Cart_dto;
import com.TeamPro.service.Cart_MypageDeleteService;

public class Cart_MypageDeleteAction implements Light_action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isDeleteSuccess = false;
		Cart_dto dto = new Cart_dto();
		Cart_MypageDeleteService cartMypageDeleteService = new Cart_MypageDeleteService();
		
		String cart_id = request.getParameter("cart_id");
		String cart_name = request.getParameter("cart_name");
		String cart_count = request.getParameter("cart_count");
		String cart_price = request.getParameter("cart_price");
		
		String[] cart_names = cart_name.split(",");
		String[] cart_counts = cart_count.split(",");
		String[] cart_prices = cart_price.split(",");
		
		dto.setCart_id(cart_id);
		
		int i = 0;
		while(i<cart_names.length) {
			dto.setCart_name(cart_names[i]);
			dto.setCart_count(Integer.parseInt(cart_counts[i]));
			dto.setCart_price(Integer.parseInt(cart_prices[i]));
			
			isDeleteSuccess = cartMypageDeleteService.getProductDelete(dto);
			
			i++;
		}		
		
		if(isDeleteSuccess == true) { 
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("pages_login/DB_mypage_cart.jsp");
		}
		return forward;
	}
}

package com.TeamPro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Buyhistory_dto;
import com.TeamPro.service.Buy_nowListService;

public class Buy_nowListAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession getSession = request.getSession(false);
		
		Buy_nowListService buyNowListService = new Buy_nowListService();
		Buyhistory_dto buyDto = new Buyhistory_dto();

		String[] product_colors = request.getParameterValues("product_colors");
		String[] showamount = request.getParameterValues("showamount");

		for(int i=0; i<product_colors.length; i++) {
			if(!product_colors[i].equals("") && !showamount[i].equals(0)) {
				buyDto.setBuy_colors(product_colors[i]);
				buyDto.setBuy_amount(Integer.parseInt(showamount[i]));
			}
		}
		String id = (String)getSession.getAttribute("id");
		System.out.println(id);
		buyDto.setBuy_id(id);
		
		buyDto.setBuy_name(request.getParameter("product_name"));
		buyDto.setBuy_price(Integer.parseInt(request.getParameter("product_price")));
		// date, condition, beforedate은 어떻게 넣어야할까???
		buyDto.setBuy_category(request.getParameter("product_category"));
		buyDto.setBuy_img(request.getParameter("product_img"));
		buyDto.setBuy_totalprice(Integer.parseInt(request.getParameter("product_total")));
		
		boolean isInsert =  buyNowListService.isInsert(buyDto);
		
		if(isInsert) {
			request.setAttribute("buyDto", buyDto);
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("pages_product/product_buynow.jsp");
		}
		return forward;	
	}
	
}

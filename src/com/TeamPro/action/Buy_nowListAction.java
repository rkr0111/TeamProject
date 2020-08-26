package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Buyhistory_dto;
import com.TeamPro.dto.CustomerInfo_dto;
import com.TeamPro.service.Buy_nowListService;

public class Buy_nowListAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isInsert = false;
		HttpSession getSession = request.getSession(false);
		
		Buy_nowListService buyNowListService = new Buy_nowListService();
		Buyhistory_dto buyDto = new Buyhistory_dto();
		
		List<String> colorList = new ArrayList<String>();
		List<Integer> amountList = new ArrayList<Integer>();
		List<Buyhistory_dto> buyList = new ArrayList<Buyhistory_dto>();
		List<CustomerInfo_dto> customerList = new ArrayList<CustomerInfo_dto>();		

		String id = (String)getSession.getAttribute("id");
		String[] product_colors = request.getParameterValues("product_colors");
		String[] showamount = request.getParameterValues("showamount");
		
		int i=0;

		while(i<product_colors.length) {
			if(product_colors[i] != "" && Integer.parseInt(showamount[i]) != 0) {
				buyDto.setBuy_id(id);		
				buyDto.setBuy_name(request.getParameter("product_name"));
				buyDto.setBuy_price(Integer.parseInt(request.getParameter("product_price")));
				buyDto.setBuy_category(request.getParameter("product_category"));
				buyDto.setBuy_img(request.getParameter("product_img"));
				buyDto.setBuy_totalprice(Integer.parseInt(request.getParameter("product_total")));
				
				colorList.add(product_colors[i]);
				buyDto.setBuy_colors(colorList.get(i));
				
				amountList.add(Integer.parseInt(showamount[i]));
				buyDto.setBuy_amount(amountList.get(i));

				isInsert =  buyNowListService.isInsert(buyDto);
			}
			i++;
		}		
		
		if(isInsert) {
			buyList = buyNowListService.getBuyList(buyDto);
			customerList = buyNowListService.getCustomerList(id);
			request.setAttribute("buyList", buyList);
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("pages_product/product_buynow.jsp");
		}
		return forward;	
	}
	
}

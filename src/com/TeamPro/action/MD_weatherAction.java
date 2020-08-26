package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.MD_randomListService;

public class MD_weatherAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		MD_randomListService mdRandomListService = new MD_randomListService();
		List<Product_dto> productAllList = new ArrayList<Product_dto>();
		List<Product_dto> weaterProList = new ArrayList<Product_dto>();

		String product_weather = request.getParameter("product_weather");
		
		productAllList = mdRandomListService.getproductAllList();
		weaterProList = mdRandomListService.getWeatherProList(product_weather);
		
		request.setAttribute("productAllList", productAllList);
		request.setAttribute("weaterProList", weaterProList);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_mdpick/mdpick_weather.jsp");
		return forward;
	}
	
}

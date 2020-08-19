package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.MD_randomListService;

public class MD_randomListAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		MD_randomListService mdRandomListService = new MD_randomListService();
		List<Product_dto> productList = new ArrayList<Product_dto>();
		List<Product_dto> productAllList = new ArrayList<Product_dto>();
		List<Product_dto> weaterProList = new ArrayList<Product_dto>();

		String product_weather = request.getParameter("product_weather");
		
		int listCount = mdRandomListService.getListCount();
		int randomNum = (int)(Math.random()*listCount);
		
		productList = mdRandomListService.getProductList(randomNum);
		productAllList = mdRandomListService.getproductAllList();
		weaterProList = mdRandomListService.getWeatherProList(product_weather);
		
		request.setAttribute("productList", productList);
		request.setAttribute("productAllList", productAllList);
		request.setAttribute("weaterProList", weaterProList);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_mdpick/mdpick.jsp");
		return forward;
	}
	
}

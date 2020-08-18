package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.MD_weatherListService;

public class MD_weatherListAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Product_dto> weaterProList = new ArrayList<Product_dto>();
		
		String product_weather = request.getParameter("product_weather");
		System.out.print("action: " + product_weather);
		
		MD_weatherListService mdWeatherListService = new MD_weatherListService();
		weaterProList = mdWeatherListService.getWeatherProList(product_weather);
		
		request.setAttribute("weaterProList", weaterProList);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mdRandomList.bo");
		return forward;
	}
	
}

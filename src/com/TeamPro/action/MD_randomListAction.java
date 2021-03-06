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
		
		int listCount = mdRandomListService.getListCount();
		int randomNum = (int)(Math.random()*listCount);
		
		productList = mdRandomListService.getProductList(randomNum);
		
		request.setAttribute("productList", productList);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_mdpick/mdpick_today.jsp");
		return forward;
	}
	
}

package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.PageInfo;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.Product_ListService;

public class Product_ListAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		int page = 1;
		int limit = 10;
		ActionForward forward = null;
		List<Product_dto> productList = null;
		productList = new ArrayList<Product_dto>();
		PageInfo pageInfo = new PageInfo();
		Product_ListService productListService = new Product_ListService();
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		String search_product = request.getParameter("search_product");
		
		System.out.println("list action prodcut : " + page);
		int listCount = productListService.getListCount();
		productList = productListService.getProductList(search_product);
		
		//총 페이지 수.
   		int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
   	    int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage = maxPage;
   		
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("productList", productList);
   		
		forward.setPath("/product_desk.jsp");
		System.out.println("list action : " + search_product + ", " + forward);
		return forward;
	}
	
}

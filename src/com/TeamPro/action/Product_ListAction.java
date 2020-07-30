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
		Product_dto prodto = new Product_dto();
		List<Product_dto> productList = null;
		productList = new ArrayList<Product_dto>();
		Product_ListService productListService = new Product_ListService();
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		String product_name = request.getParameter("product_name");
		
		System.out.println("list action prodcut page : " + page);
		System.out.println("list action product_name : " + product_name);
		int listCount = productListService.getListCount();
		productList = productListService.getProductList(product_name);
		
		//총 페이지 수.
   		int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
   	    int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage = maxPage;

		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("productList", productList);
		
		String pl = (String) request.getAttribute("productList");
		System.out.println("list action listCount : " + listCount + ", product_name : " + product_name + ", productList : " + productList);
   		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/TeamPro/pages_product/product_desk.jsp");
		return forward;
	}
	
}

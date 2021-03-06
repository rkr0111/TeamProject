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
		int limit = 5;
		ActionForward forward = null;
		Product_dto prodto = new Product_dto();
		List<Product_dto> productList = new ArrayList<Product_dto>();
		Product_ListService productListService = new Product_ListService();
		
		String product_category = request.getParameter("product_category");
		String selected_opt = request.getParameter("selected_opt");
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		if(selected_opt == null){
			productList = productListService.getProductList(page, limit, product_category);
		}else if(selected_opt.equals("sort-new")){
			productList = productListService.getProductListSortNew(page, limit, product_category);
		}else if(selected_opt.equals("sort-asc")){
			productList = productListService.getProductListSortASC(page, limit, product_category);
		}else if(selected_opt.equals("sort-desc")){
			productList = productListService.getProductListSortDESC(page, limit, product_category);
		}
		
		int listCount = productListService.getListCount(product_category);
		
		//총 페이지 수.
   		int maxPage=(int)((double)listCount / limit + 0.95); //0.95를 더해서 올림 처리.
   		//현재 페이지에 보여줄 시작 페이지 수(1, 6, 11 등...)
   		int startPage = (((int) ((double)page / 5 + 0.8)) - 1) * 5 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수.(5, 10, 15 등...)
   	    int endPage = startPage + 5 - 1;

   		if (endPage> maxPage) endPage = maxPage;

		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("productList", productList);
   		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_product/product_category.jsp");
		return forward;
	}
	
}

package com.TeamPro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.service.Review_AllListService;

public class Review_AllListAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		List<Product_dto> listimg = new ArrayList<Product_dto>();
		List<Review_dto> listinfo = new ArrayList<Review_dto>();
		Review_AllListService reviewAllListService = new Review_AllListService();
		
		listimg = reviewAllListService.getListImg();
		listinfo = reviewAllListService.getListInfo();
		
		request.setAttribute("listimg", listimg);
		request.setAttribute("listinfo", listinfo);
   		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_review/review.jsp");
		return forward;
	}
	
}

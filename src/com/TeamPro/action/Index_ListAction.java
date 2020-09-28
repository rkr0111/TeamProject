package com.TeamPro.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.dto.Review_dto;
import com.TeamPro.service.Index_ListService;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;

public class Index_ListAction {

	public void execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		JsonObject jobj = null;
		List<Product_dto> prolist = new ArrayList<Product_dto>();
		List<Review_dto> reviewlist = new ArrayList<Review_dto>();
		List<String> jsonlist = new ArrayList<String>();
		Index_ListService indexListService = new Index_ListService();

		prolist = indexListService.getListProCategory();
		reviewlist = indexListService.getReviewList();
		request.setAttribute("prolist", prolist);
		request.setAttribute("reviewlist", reviewlist);
		List<Product_dto> categorylist = (List<Product_dto>) request.getAttribute("prolist");
		List<Review_dto> relist = (List<Review_dto>) request.getAttribute("reviewlist");
		System.out.println(relist.size());
		
		int i=0;
		while( i<relist.size() ) {
			jobj = new JsonObject();
			jobj.addProperty("review_num", relist.get(i).getReview_num());
			jobj.addProperty("product_category", categorylist.get(i).getProduct_category());
			jobj.addProperty("review_img", relist.get(i).getReview_img());
			jobj.addProperty("review_contents", relist.get(i).getReview_contents());
			i++;
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String gson = new Gson().toJson(jobj);
		
		System.out.println(gson);
		
		try {
            //ajax로 리턴해주는 부분
            response.getWriter().write(gson);
        } catch (JsonIOException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
}

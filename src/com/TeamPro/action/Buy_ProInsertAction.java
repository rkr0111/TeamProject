package com.TeamPro.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Buyhistory_dto;
import com.TeamPro.dto.Product_dto;
import com.TeamPro.service.Product_InsertService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Buy_ProInsertAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Buyhistory_dto buydto = new Buyhistory_dto();
		HttpSession session = request.getSession();
		
		String buy_id = (String) session.getAttribute("id");
		String buy_name = request.getParameter("product_name");
		String[] buy_price = request.getParameterValues("product_price");
		String[] buy_colors = request.getParameterValues("product_color");
		
		String[] product_count = request.getParameterValues("product_count"); // 개수
				
		// set dto
		
		// service 호출
		Product_InsertService productInsertService = new Product_InsertService();
//		boolean isInsert = productInsertService.isInsert(buydto);
//		
//		if(!isInsert){
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('등록실패')");
//			out.println("</script>");
//		}
//		else{
//			request.setAttribute("product_name", multi.getParameter("product_name"));
//			String product_name = (String) request.getAttribute("product_name");
//			
//			forward = new ActionForward();
//			forward.setRedirect(true);
//			forward.setPath("productList.bo?product_category="+prodto.getProduct_category());
//		}

		return forward;
	}
	
}

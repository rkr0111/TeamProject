package com.TeamPro.action;

import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Buyhistory_dto;
import com.TeamPro.dto.Cart_dto;
import com.TeamPro.service.Buy_ProInsertService;
import com.TeamPro.service.Cart_ProInsertService;

public class Cart_ProInsertAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Cart_dto cartdto = new Cart_dto();
		Cart_ProInsertService cartProInsertService = new Cart_ProInsertService();
		boolean isInsert = false;
		
		// request.getParameter
		String cart_id = request.getParameter("buy_id");
		String cart_name = request.getParameter("buy_name");
		String cart_category = request.getParameter("buy_category");
		String cart_img = request.getParameter("buy_img");
		int cart_price = Integer.parseInt(request.getParameter("buy_price"));
		String cart_colors = request.getParameter("buy_colors");		
		String cart_amount = request.getParameter("buy_amount");
		
		String[] coloridx = cart_colors.split(",");
		String[] amountidx = cart_amount.split(",");
		
		
		// set dto
		cartdto.setCart_id(cart_id);
		cartdto.setCart_name(cart_name);
		cartdto.setCart_category(cart_category);
		cartdto.setCart_img(cart_img);
		
		int i = 0;
		while(i < coloridx.length) {
			cartdto.setCart_price(cart_price * Integer.parseInt(amountidx[i]));
			cartdto.setCart_colors(coloridx[i]);
			cartdto.setCart_count(Integer.parseInt(amountidx[i]));
			
			isInsert = cartProInsertService.isInsert(cartdto);
			
			i++;
		}
		
		if(!isInsert){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("</script>");
		}
		else{			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("pages_login/DB_mypage_cart.jsp");
		}

		return forward;
	}
	
}

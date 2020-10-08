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
import com.TeamPro.service.Cart_OrderDeleteService;

public class Cart_OrderInsertAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Buyhistory_dto buydto = new Buyhistory_dto();
		Cart_dto cartdto = new Cart_dto();
		HttpSession session = request.getSession();
		Buy_ProInsertService buyProInsertService = new Buy_ProInsertService();
		Cart_OrderDeleteService cartorderdeleteService = new Cart_OrderDeleteService();
		boolean isInsert = false;
		boolean isCartDelete = false;
		
		// 현재 날짜 구하기
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String nowdate = year+""+month+""+day;
		
		// 난수 생성
		int randomInt = (int)(Math.random()*10000000)+1;
		
		// 주문번호 생성
		String order_num = nowdate+"-"+randomInt;
		
		// request.getParameter
		String buy_id = request.getParameter("buy_id");
		String buy_name = request.getParameter("buy_name");
		String buy_totalprice = request.getParameter("buy_totalprice");
		String buy_category = request.getParameter("buy_category");
		String buy_img = request.getParameter("buy_img");
		String buy_price = request.getParameter("buy_price");
		String buy_color = request.getParameter("buy_colors");
		String buy_amount = request.getParameter("buy_amount");
		
		String[] buy_names = buy_name.split(",");
		String[] buy_totalprices = buy_totalprice.split(",");
		String[] buy_categorys = buy_category.split(",");
		String[] buy_imgs = buy_img.split(",");
		String[] buy_prices = buy_price.split(",");
		String[] buy_colors = buy_color.split(",");
		String[] buy_amounts = buy_amount.split(",");
		
		// set dto
		buydto.setBuy_id(buy_id);
		buydto.setBuy_condition("배송 완료");
		buydto.setBuy_num(order_num);
		
		int i = 0;
		while(i<buy_names.length) {
			buydto.setBuy_name(buy_names[i]);
			buydto.setBuy_category(buy_categorys[i]);
			buydto.setBuy_img(buy_imgs[i]);
			buydto.setBuy_totalprice(Integer.parseInt(buy_totalprices[i]));
			buydto.setBuy_price(Integer.parseInt(buy_prices[i]));
			buydto.setBuy_colors(buy_colors[i]);
			buydto.setBuy_amount(Integer.parseInt(buy_amounts[i]));
			
			// service 호출
			isInsert = buyProInsertService.isInsert(buydto);
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
			cartdto.setCart_id(buy_id);
			
			int j = 0;
			while(j<buy_names.length) {
				cartdto.setCart_name(buy_names[j]);
				cartdto.setCart_price(Integer.parseInt(buy_prices[j]));
				cartdto.setCart_count(Integer.parseInt(buy_amounts[j]));
				cartdto.setCart_category(buy_categorys[j]);
				cartdto.setCart_img(buy_imgs[j]);
				cartdto.setCart_colors(buy_colors[j]);
				
				isCartDelete = cartorderdeleteService.isCartDelete(cartdto);
				j++;
			}
		}
		
		if(!isCartDelete) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니 삭제 실패')");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("pages_login/DB_mypage_buyhistory.jsp");
		}

		return forward;
	}
	
}

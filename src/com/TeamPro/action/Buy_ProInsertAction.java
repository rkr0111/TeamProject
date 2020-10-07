package com.TeamPro.action;

import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TeamPro.dto.ActionForward;
import com.TeamPro.dto.Buyhistory_dto;
import com.TeamPro.service.Buy_ProInsertService;

public class Buy_ProInsertAction implements Light_action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Buyhistory_dto buydto = new Buyhistory_dto();
		HttpSession session = request.getSession();
		Buy_ProInsertService buyProInsertService = new Buy_ProInsertService();
		boolean isInsert = false;
		
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
		String buy_id = (String) session.getAttribute("id");
		String buy_name = request.getParameter("product_name");
		int buy_totalprice = Integer.parseInt(request.getParameter("product_total"));
		String buy_category = request.getParameter("buy_category");
		String buy_img = request.getParameter("buy_img");
		String[] buy_price = request.getParameterValues("product_price");
		String[] buy_colors = request.getParameterValues("product_color");
		
		String[] buy_amount = request.getParameterValues("product_count"); // 개수
		
		// set dto
		buydto.setBuy_id(buy_id);
		buydto.setBuy_name(buy_name);
		buydto.setBuy_category(buy_category);
		buydto.setBuy_img(buy_img);
		buydto.setBuy_totalprice(buy_totalprice);
		buydto.setBuy_condition("주문 완료");
		buydto.setBuy_num(order_num);
		
		int i = 0;
		while(i < buy_colors.length) {
			buydto.setBuy_price(Integer.parseInt(buy_price[i]));
			buydto.setBuy_colors(buy_colors[i]);
			buydto.setBuy_amount(Integer.parseInt(buy_amount[i]));
			
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
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("pages_login/DB_mypage_buyhistory.jsp");
		}

		return forward;
	}
	
}

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Date"%>

<%
	String id = (String)session.getAttribute("id");
	
	if (id== null) {
		throw new Exception("아이디가 올바르지 않습니다.");
	}
	Connection conn=null;
	Statement stmt=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/light", "orro", "1995");
		if (conn == null) {
			out.println("light 데이터베이스로 연결을 할 수 없습니다.");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select buy_id, buy_name, buy_price, buy_date, buy_condition from customerinfo, buyhistory where customerinfo.customer_id=buyhistory.buy_id;");
		if(rs.next()) {
			request.setCharacterEncoding("UTF-8");
			Buyhistory_dto dto = new Buyhistory_dto();
			List<Buyhistory_dto> buyhistoryList = new ArrayList<Buyhistory_dto>();
			
			String buy_id = rs.getString(1);
			String buy_name = rs.getString(2);
			String buy_price = rs.getString(3);
			String buy_date = rs.getString(4);
			String buy_condition = rs.getString(5);
			
			dto.setBuy_id(buy_id);
			dto.setBuy_name(buy_name);
			dto.setBuy_price(Integer.parseInt(buy_price));
			dto.setBuy_date(Date.valueOf(buy_date));
			dto.setBuy_condition(buy_condition);
				
			buyhistoryList.add(dto);
			
			request.setAttribute("buyhistoryList", buyhistoryList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login_mypage.jsp");
			dispatcher.forward(request, response);

		}
		else {
			out.println("<script>alert('주문 내역이 없습니다.');</script>");
			out.println("<script>location.href='login_mypage.jsp';</script>");
		}
	} finally {
	try {
		stmt.close();
	} catch (Exception ignored) {
	}
	try {
		conn.close();
	} catch (Exception ignored) {
	}
	}
%>
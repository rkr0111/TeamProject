<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>

<!-- 
		여기 현재 사용 안 함
 -->

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String mypageCategory = "A/S 문의";

	if (id== null) {
		throw new Exception("로그인을 해주세요.");
	}
	Connection conn=null;
	Statement stmt=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/light?characterEncoding=utf8&serverTimezone=UTC", "orro", "1995");
		if (conn == null) {
			out.println("light 데이터베이스로 연결을 할 수 없습니다.");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select buy_id, buy_name, buy_condition, buy_date, adddate(buy_date, +1095) from buyhistory where buy_id='"+id+"' and buy_condition='배송 완료' order by buy_date desc;");
		if(rs.next()) {
			ArrayList<Object> asList = new ArrayList<Object>();
			
			do {
				Buyhistory_dto dto = new Buyhistory_dto();
				dto.setBuy_id(rs.getString(1));
				dto.setBuy_name(rs.getString(2));
				dto.setBuy_condition(rs.getString(3));	
				dto.setBuy_date(rs.getDate(4));
				dto.setBefore_buyDate(rs.getDate(5));
								
				asList.add(dto);
				request.setAttribute("asList", asList);
			}
			while(rs.next());
						
			RequestDispatcher dispatcher = request.getRequestDispatcher("login_mypage.jsp?mypageCategory="+mypageCategory);
			dispatcher.forward(request, response);
		}else {		
			RequestDispatcher dispatcher = request.getRequestDispatcher("login_mypage.jsp?mypageCategory="+mypageCategory);
			dispatcher.forward(request, response);
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
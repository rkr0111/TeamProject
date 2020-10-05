<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="com.TeamPro.dto.Interior_dto"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
</head>
</html>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String mypageCategory = "리뷰작성";	

	if (id== null) {
		throw new Exception("로그인을 해주세요.");
	}
	Connection conn=null;
	Statement stmt=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamlight?characterEncoding=utf8&serverTimezone=UTC", "teamlight", "teamlight1995!");
		if (conn == null) {
			out.println("light 데이터베이스로 연결을 할 수 없습니다.");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select distinct review_id, review_name, review_contents, review_img, review_date, buy_condition, product_category from buyhistory, review, product where buy_id=review_id and review_name=product_name and review_id='a' and buy_condition='배송 완료' order by review_date desc");
		
		if(rs.next()) {
			ArrayList<Object> reviewList = new ArrayList<Object>();
			
			do {
				Interior_dto dto = new Interior_dto();
				
				dto.setInterior_id(rs.getString(1));
				dto.setInterior_name(rs.getString(2));
				dto.setInterior_contents(rs.getString(3));
				dto.setInterior_img(rs.getString(4));
				dto.setInterior_date(rs.getDate(5));
				dto.setInterior_condition(rs.getString(6));
				dto.setInterior_category(rs.getString(7));
				
				reviewList.add(dto);
				request.setAttribute("reviewList", reviewList);
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
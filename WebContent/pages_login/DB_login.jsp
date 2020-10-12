<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.TeamPro.dto.CustomerInfo_dto"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("passwd");
	
	if (id== null) {
		throw new Exception("아이디를 입력하십시오.");
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
		ResultSet rs = stmt.executeQuery("select * from customerinfo where customer_id='"+id+"' and customer_pwd='"+pwd+"' ;");
		if(rs.next()) {
			request.setCharacterEncoding("UTF-8");
			id = request.getParameter("id");
			session.setAttribute("id", id);
		
			response.sendRedirect("../index.jsp");
		}
		else {
			out.println("<script>alert('아이디 혹은 비밀번호가 맞지 않습니다.');</script>");
			out.println("<script>location.href='login_login.jsp';</script>");
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
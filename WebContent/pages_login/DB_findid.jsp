<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	String name = request.getParameter("inputname");
	String phone = request.getParameter("inputphone");
	
	if (name== null) {
		throw new Exception("이름을 입력하십시오.");
	}
	if (phone==null) {
		throw new Exception("전화번호를 입력하십시오.");
	}
	Connection conn=null;
	Statement stmt=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://teamlight.cafe24.com/teamlight", "teamlight", "teamlight1995!");
		if (conn == null) {
			out.println("light 데이터베이스로 연결을 할 수 없습니다.");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select customer_id from customerinfo where customer_name='"+name+"' and customer_phone='"+phone+"' ;");
		if(rs.next()) { 
			request.setCharacterEncoding("UTF-8");
			String id = rs.getString(1);
			session.setAttribute("id", id);
			out.println("<script>alert('가입하신 아이디는 "+id+" 입니다.');</script>");
			out.println("<script>location.href='login_login.jsp';</script>");
		}
		else {
			out.println("<script>alert('입력하신 정보의 아이디가 없습니다.');</script>");
			out.println("<script>location.href='DB_findid.jsp';</script>");
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


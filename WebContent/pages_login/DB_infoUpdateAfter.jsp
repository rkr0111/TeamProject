<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.TeamPro.dto.CustomerInfo_dto"%>

<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	
	String joinPwd = request.getParameter("join-password");
	
	String emailId = request.getParameter("join-email-id");
	String emailAddr = request.getParameter("join-email-choice");
	
	String postAddr = request.getParameter("post-address");
	String firstAddr = request.getParameter("first-address");
	
	String firstPhone = request.getParameter("phone-choice");
	String middlePhone = request.getParameter("middle-phonenum");
	String lastPhone = request.getParameter("last-phonenum");	
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamlight?characterEncoding=utf8&serverTimezone=UTC", "teamlight", "teamlight1995!");
		if(conn == null) throw new Exception("DB에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		String sql = "update customerinfo set customer_pwd='"+joinPwd+"', customer_email='"+emailId+"@"+emailAddr+"', customer_addr='"+firstAddr+"', customer_phone='"+firstPhone+"-"+middlePhone+"-"+lastPhone+"' where customer_id='"+id+"'"; 
		int result = stmt.executeUpdate(sql);
		
		if(result > 0) {
			out.println("<script>alert('개인정보 수정이 완료되었습니다.');</script>");
			out.println("<script>location.href='DB_mypage_buyhistory.jsp'</script>");
		}
	}finally {
		try {
			stmt.close();
		} catch(Exception ignored) {}
		try {
			conn.close();
		} catch(Exception ignored) {}
	}
%>
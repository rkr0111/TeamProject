<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("inputname");
	String id = request.getParameter("inputid");
	String firstPhone = request.getParameter("phone-choice");
	String middlePhone = request.getParameter("middle-phonenum");
	String lastPhone = request.getParameter("last-phonenum");
	
	if (name== null) {
		throw new Exception("이름을 입력하십시오.");
	}
	if (id== null) {
		throw new Exception("아이디를 입력하십시오.");
	}
	if (firstPhone==null || middlePhone==null || lastPhone==null) {
		throw new Exception("전화번호를 입력하십시오.");
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
		ResultSet rs = stmt.executeQuery("select customer_pwd from customerinfo where customer_name='"+name+"' and customer_id='"+id+"' and customer_phone='"+firstPhone+"-"+middlePhone+"-"+lastPhone+"';");
		if(rs.next()) {
			String pwd = rs.getString(1);
			session.setAttribute("pwd", pwd);
			out.println("<script>alert('가입하신 비밀번호는 "+pwd+" 입니다.');</script>");
			out.println("<script>location.href='login_login.jsp';</script>");
		}
		else {
			out.println("<script>alert('입력하신 정보의 비밀번호가 없습니다.');</script>");
			out.println("<script>location.href='login_findpwd.jsp';</script>");
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


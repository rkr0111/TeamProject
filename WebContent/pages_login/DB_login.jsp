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
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/light", "orro", "1995");
		if (conn == null) {
			out.println("light 데이터베이스로 연결을 할 수 없습니다.");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from customerinfo where customer_id='"+id+"' and customer_pwd='"+pwd+"' ;");
		if(rs.next()) {
			ArrayList<Object> customerinfoList = new ArrayList<Object>();
			
			do {
				id = request.getParameter("id");
				session.setAttribute("id", id);
				
				CustomerInfo_dto customerinfo_dto = new CustomerInfo_dto();
				customerinfo_dto.setCustomer_id(rs.getString(1)); 
				customerinfo_dto.setCustomer_pwd(rs.getString(2));
				customerinfo_dto.setCustomer_email(rs.getString(3));
				customerinfo_dto.setCustomer_name(rs.getString(4));
				customerinfo_dto.setCustomer_birth(rs.getDate(5));
				customerinfo_dto.setCustomer_addr(rs.getString(6));
				customerinfo_dto.setCustomer_phone(rs.getString(7));
				
				customerinfoList.add(customerinfo_dto);
				request.setAttribute("customerinfoList", customerinfoList);
			}
			while(rs.next());
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../index.jsp");
			dispatcher.forward(request, response);
		}else {
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
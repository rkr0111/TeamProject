<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.CustomerInfo_dto"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<% 
	String id = (String)session.getAttribute("id");
	
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
		ResultSet rs = stmt.executeQuery("select * from light.customerinfo where customer_id='"+id+"';");
		
		if(rs.next()) {
			ArrayList<Object> memeberList = new ArrayList<Object>();
			
			do {
				CustomerInfo_dto dto = new CustomerInfo_dto();
				
				dto.setCustomer_id(rs.getString(1));
				dto.setCustomer_pwd(rs.getString(2));
				dto.setCustomer_email(rs.getString(3));
				dto.setCustomer_name(rs.getString(4));
				dto.setCustomer_birth(rs.getDate(5));
				//dto.setCustomer_post(rs.getString(6));
				dto.setCustomer_addr(rs.getString(6));
				dto.setCustomer_phone(rs.getString(7));
				
				memeberList.add(dto);
				
				request.setAttribute("memeberList", memeberList);
			}
			while(rs.next());
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login_mypage_member.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login_mypage_member.jsp");
			dispatcher.forward(request, response);   
		}
	} finally {
	try {
		stmt.close();
	} catch (Exception e) {
		System.out.println("member 1: "+e);
	}
	try {
		conn.close();
	} catch (Exception e) {
		System.out.println("member 2: "+e);
	}
	}
%>
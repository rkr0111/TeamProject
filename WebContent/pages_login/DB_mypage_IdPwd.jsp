<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.TeamPro.dto.CustomerInfo_dto"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<% 
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String mypageCategory = "개인정보수정";
	
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
		ResultSet rs = stmt.executeQuery("select customer_id, customer_pwd from light.customerinfo where customer_id='"+id+"';");
		
		if(rs.next()) {
			ArrayList<CustomerInfo_dto> idList = new ArrayList<CustomerInfo_dto>();
			
			do {
				CustomerInfo_dto dto = new CustomerInfo_dto();
				
				dto.setCustomer_id(rs.getString(1));
				dto.setCustomer_pwd(rs.getString(2));
				
				idList.add(dto);
				
				request.setAttribute("idList", idList);
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
		} catch(Exception ignored) {}
		try {
			conn.close();
		} catch(Exception ignored) {}
	}
%>
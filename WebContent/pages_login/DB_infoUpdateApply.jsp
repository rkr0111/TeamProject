<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.TeamPro.dto.CustomerInfo_dto"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	
	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/light?characterEncoding=utf8&serverTimezone=UTC", "orro", "1995");
		if(conn == null) throw new Exception("DB에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from light.customerinfo where customer_id='"+id+"';");
		
		ArrayList<Object> custominfoupdateList = new ArrayList<Object>();
		
		while(rs.next()) {
			CustomerInfo_dto customerinfo_dto = new CustomerInfo_dto();
			customerinfo_dto.setCustomer_id(rs.getString(1)); 
			customerinfo_dto.setCustomer_pwd(rs.getString(2));
			customerinfo_dto.setCustomer_email(rs.getString(3));
			customerinfo_dto.setCustomer_name(rs.getString(4));
			customerinfo_dto.setCustomer_birth(rs.getDate(5));
			customerinfo_dto.setCustomer_addr(rs.getString(6));
			customerinfo_dto.setCustomer_phone(rs.getString(7));
			
			custominfoupdateList.add(customerinfo_dto);
		} 
		RequestDispatcher dispatcher = request.getRequestDispatcher("login_mypage.jsp");
		request.setAttribute("custominfoupdateList", custominfoupdateList);	
		dispatcher.forward(request, response);
	}finally {
		try {
			stmt.close();
		} catch(Exception ignored) {}
		try {
			conn.close();
		} catch(Exception ignored) {}
	}
%>

</body>
</html>
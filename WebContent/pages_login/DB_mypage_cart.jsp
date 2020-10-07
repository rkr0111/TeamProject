<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.TeamPro.dto.Cart_dto"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String mypageCategory = "장바구니";

	if (id== null) {
		throw new Exception("로그인을 해주세요.");
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
		ResultSet rs = stmt.executeQuery("select * from cart where cart_id='"+id+"'; ");
		if(rs.next()) {
	ArrayList<Object> cartList = new ArrayList<Object>();
	
	do {
		Cart_dto dto = new Cart_dto();
		dto.setCart_id(rs.getString(1));
		dto.setCart_name(rs.getString(2));
		dto.setCart_price(rs.getInt(3));
		dto.setCart_count(rs.getInt(4));
						
		cartList.add(dto);
		request.setAttribute("cartList", cartList);	
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>

<%
	String id = (String)session.getAttribute("id");
	String mypageCategory = "장바구니";

	if (id== null) {
		throw new Exception("로그인을 해주세요.");
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
		ResultSet rs = stmt.executeQuery("select * from shopping where shopping_id='"+id+"'; ");
		if(rs!=null) {
			request.setCharacterEncoding("UTF-8");
			ArrayList<Object> shoppingList = new ArrayList<Object>();
			
			while(rs.next()) {
				Product_dto dto = new Product_dto();
				dto.setProduct_name(rs.getString(1));
				dto.setProduct_category(rs.getString(2));
				dto.setProduct_price(rs.getInt(3));
				dto.setProduct_img(rs.getString(4));
								
				shoppingList.add(dto);
			}
			request.setAttribute("shoppingList", shoppingList);			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login_mypage.jsp?mypageCategory="+mypageCategory);
			dispatcher.forward(request, response);
		}else {
			out.println("<script>alert('장바구니에 담으신 상품이 없습니다.');</script>");
			out.println("<script>location.href='DB_mypage_buyhistory.jsp';</script>");
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
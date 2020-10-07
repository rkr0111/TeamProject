<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String mypageCategory = "구매내역";
	
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
		ResultSet rs = stmt.executeQuery("select * from buyhistory where buy_id='"+id+"' order by buy_date desc; ");
		if(rs.next()) {
			ArrayList<Object> buyhistoryList = new ArrayList<Object>();
			
			do {
				Buyhistory_dto dto = new Buyhistory_dto();
				dto.setBuy_id(rs.getString(1));
				dto.setBuy_name(rs.getString(2));
				dto.setBuy_price(rs.getInt(3));
				dto.setBuy_date(rs.getDate(4));
				dto.setBuy_condition(rs.getString(5));
				dto.setBuy_category(rs.getString(6));
				dto.setBuy_img(rs.getString(7));
				dto.setBuy_colors(rs.getString(8));
				dto.setBuy_amount(rs.getInt(9));
				dto.setBuy_totalprice(rs.getInt(10));
				dto.setBuy_num(rs.getString(11));
				
				buyhistoryList.add(dto);
				request.setAttribute("buyhistoryList", buyhistoryList);
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
	} catch (Exception e) {
		System.out.println("buyhistory1 : "+e);
	}
	try {
		conn.close();
	} catch (Exception e) {
		System.out.println("buyhistory2 : "+e);
	}
	}
%>
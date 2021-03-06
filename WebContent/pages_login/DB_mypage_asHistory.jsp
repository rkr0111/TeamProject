<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.TeamPro.dto.Ashistory_dto"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String mypageCategory = "A/S 문의내역";

	if (id== null) {
		throw new Exception("로그인을 해주세요.");
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
		ResultSet rs = stmt.executeQuery("select * from ashistory where as_id='"+id+"';");
		if(rs.next()) {
			ArrayList<Object> asHistoryList = new ArrayList<Object>();
			
			do {
				Ashistory_dto dto = new Ashistory_dto();
				dto.setAs_num(rs.getInt(1));
				dto.setAs_id(rs.getString(2));
				dto.setAs_name(rs.getString(3));
				dto.setAs_subject(rs.getString(4));
				dto.setAs_date(rs.getDate(5));
				dto.setAs_contents(rs.getString(6));
				dto.setAs_condition(rs.getString(7));
								
				asHistoryList.add(dto);
				request.setAttribute("asHistoryList", asHistoryList);
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
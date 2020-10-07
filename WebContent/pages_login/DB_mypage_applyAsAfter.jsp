<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>
<%@page import="com.TeamPro.dto.Ashistory_dto"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String as_name = request.getParameter("applyAS_product");
	String as_subject = request.getParameter("applyAS_title");
	String as_contents = request.getParameter("applyAS_contents");
	
	/* String mypageCategory = "A/S 문의"; */

	Connection conn=null;
	Statement stmt=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://teamlight.cafe24.com/teamlight?characterEncoding=utf8&serverTimezone=UTC", "teamlight", "teamlight1995!");
		if (conn == null) {
			out.println("light 데이터베이스로 연결을 할 수 없습니다.");
		}
		stmt = conn.createStatement();
		String sql = "insert into ashistory values('"+id+"', '"+as_name+"', '"+as_subject+"', sysdate(), '"+as_contents+"', '');";
		int result = stmt.executeUpdate(sql);
		
		if(result > 0) {
			out.println("<script>alert('A/S 문의가 완료되었습니다.');</script>");
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	
	String joinId = request.getParameter("join-id");
	
	String joinPwd = request.getParameter("join-password");
	
	String emailId = request.getParameter("join-email-id");
	String emailAddr = request.getParameter("join-email-choice");
	
	String joinName = request.getParameter("join-name");
	
	String yearNum = request.getParameter("year-number");
	String monthNum = request.getParameter("month-choice");
	String dateNum = request.getParameter("date-choice");
	
	String postAddr = request.getParameter("post-address");
	String firstAddr = request.getParameter("first-address");
	String lastAddr = request.getParameter("last-address");
	String extraAddr = request.getParameter("extra-address");
	
	String firstPhone = request.getParameter("phone-choice");
	String middlePhone = request.getParameter("middle-phonenum");
	String lastPhone = request.getParameter("last-phonenum");
	
	String agreecheck = request.getParameter("agree-check");
	
	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/light?characterEncoding=utf8&serverTimezone=UTC", "orro", "1995");
		if(conn == null) throw new Exception("DB에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		int result = stmt.executeUpdate("insert into customerinfo values('"+joinId+"', '"+joinPwd+"', '"+emailId+"@"+emailAddr+"', '"+joinName+"', '"+yearNum+"-"+monthNum+"-"+dateNum+"', '"+postAddr+"', '"+firstAddr+" "+lastAddr+" "+extraAddr+"', '"+firstPhone+"-"+middlePhone+"-"+lastPhone+"');");
		if(result > 0) {
			System.out.println("개인정보 수정 완료, 마이페이지로 이동");
			out.println("<script>alert('개인정보 수정이 완료되었습니다.');</script>");
			out.println("<script>location.href='login_mypage.jsp'</script>");
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

</body>
</html>
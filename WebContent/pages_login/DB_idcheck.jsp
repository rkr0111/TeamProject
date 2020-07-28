<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%

request.setCharacterEncoding("utf-8");

int cnt = 0;
Connection conn = null;
Statement stmt = null;
ResultSet resultset = null;
String showtext = "";
int flag = 0;

String joinid = (String)request.getParameter("joinid");

try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/light", "orro", "1995");
	if(conn == null) throw new Exception("DB에 연결할 수 없습니다.");
	stmt = conn.createStatement();
	resultset = stmt.executeQuery("select customer_id from customerinfo where customer_id='"+joinid+"'");
	if(resultset.next()) {
		cnt = 1;
	}
}catch(Exception e) {
	e.printStackTrace();
}finally {
	try {
		stmt.close();
	} catch(Exception ignored) {}
	try {
		conn.close();
	} catch(Exception ignored) {}
}

out.println("");
if(joinid == "") {
	flag = 0;
	out.println(flag);
}else {
	if(cnt == 0) {
		flag = 1;
		out.println(flag);
	}else {
		flag = 2;
		out.println(flag);
	}
}

%>
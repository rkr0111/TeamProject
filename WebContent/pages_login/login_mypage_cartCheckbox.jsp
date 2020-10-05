<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
	<title>checkbox</title>
</head>
<body>

<%
	Enumeration<String> e = request.getParameterNames();
	while (e.hasMoreElements()) {
		String name = e.nextElement();
		String [] data = request.getParameterValues(name);
		if(data != null) {
			for(String eachdata : data) {
				out.println(eachdata+"");
			}
			out.println("<p>");
		}
	}
	out.println("end");
%>


</body>
</html>
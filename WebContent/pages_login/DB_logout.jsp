<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	session.getAttribute("id");
	session.invalidate();
	response.sendRedirect("../index.jsp");

%>
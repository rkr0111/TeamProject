<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="java.util.*"%>    

<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB+Product Insert Commit Page</title>
</head>
<body>

	
<%
		TeamPro_dao dao = new TeamPro_dao();
		Product_dto dto = new Product_dto();

		dto.setProduct_name(request.getParameter("p_name"));
		dto.setProduct_category(request.getParameter("p_category"));
		dto.setProduct_price(Integer.parseInt(request.getParameter("p_price")));
		dto.setProduct_color(request.getParameter("p_color"));
		dto.setProduct_file(request.getParameter("p_file"));
		dto.setProduct_img(request.getParameter("p_img"));
		dto.setProduct_contents(request.getParameter("p_contents"));

		SqlSessionFactory sqlfactory = dao.getConn(); //dao 안의 생성자
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.insert("xml_insert", dto);
		sqlsession.commit();

		response.sendRedirect("product_desk.jsp");
%>
	
</body>
</html>
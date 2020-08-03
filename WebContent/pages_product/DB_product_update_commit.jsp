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
<title>DB+Product Update Commit Page</title>
</head>
<body>

<%
	TeamPro_dao dao = new TeamPro_dao();
	Product_dto dto = new Product_dto();
	
	SqlSessionFactory sqlfactory = dao.getConn(); //dao 안의 생성자
	SqlSession sqlsession = sqlfactory.openSession();
	
	dto.setCheck(request.getParameter("udt_check"));
	dto.setProduct_name(request.getParameter("udt_name"));
	dto.setProduct_category(request.getParameter("udt_category"));
	dto.setProduct_price(Integer.parseInt(request.getParameter("udt_price")));
	dto.setProduct_color(request.getParameter("udt_color"));
	dto.setProduct_file(request.getParameter("udt_file"));
	dto.setProduct_img(request.getParameter("udt_img"));
	dto.setProduct_contents(request.getParameter("udt_contents"));
	
	sqlsession.update("xml_update", dto);
	sqlsession.commit();
	response.sendRedirect("product_desk.jsp");
%>

</body>
</html>
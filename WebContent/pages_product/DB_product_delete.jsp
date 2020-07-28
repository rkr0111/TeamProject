<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="Dao.portfolioMybatis_dao"%>
<%@page import="Dto.portfolioMybatis_dto"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");

	String product_name = request.getParameter("product_name");

	portfolioMybatis_dao dao = new portfolioMybatis_dao();
	portfolioMybatis_dto dto = new portfolioMybatis_dto();

	SqlSessionFactory sqlfactory = dao.getConn();
	SqlSession sqlsession = sqlfactory.openSession();

	List<portfolioMybatis_dto> connresultsel = sqlsession.selectList("xml_select");
	
	dto.setProduct_name(product_name);

	sqlsession.delete("xml_delete", dto);
	sqlsession.commit();
	response.sendRedirect("product_desk.jsp");
%>
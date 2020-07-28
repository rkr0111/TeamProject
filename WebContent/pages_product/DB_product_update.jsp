<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="Dao.portfolioMybatis_dao"%>
<%@page import="Dto.portfolioMybatis_dto"%>
<%@page import="java.util.*"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB+Product Update Page</title>
</head>
<style>
	.updatetable th, 
	.updatetable td {
		border: 1px solid #000;
		width : 150px;
	}
</style>
<body>
	<% 	
		request.setCharacterEncoding("utf-8");
		String product_name = request.getParameter("product_name");
		
		portfolioMybatis_dao dao = new portfolioMybatis_dao();
		portfolioMybatis_dto dto = new portfolioMybatis_dto();
	
		SqlSessionFactory sqlfactory = dao.getConn(); //dao 안의 생성자
		SqlSession sqlsession = sqlfactory.openSession();
		
		dto.setCheck(product_name);
		dto.setProduct_name(product_name);
		List<portfolioMybatis_dto> connresultsel = sqlsession.selectList("xml_select", dto);		
	%>

	<h1>Product Update<br/>============</h1>
	<form action="DB_product_update_commit.jsp" method="post">
		<table class="updatetable">
			<tr>	
				<th>이름</th>
				<th>카테고리</th>
				<th>가격</th>
				<th>컬러</th>
				<th>파일</th>
				<th>사진</th>
				<th>내용</th>
			</tr>
			<tr>
				<td><input type="text" name="udt_name" value="<%=connresultsel.get(0).getProduct_name()%>"></td>
				<td><input type="text" name="udt_category" value="<%=connresultsel.get(0).getProduct_category()%>"></td>
				<td><input type="text" name="udt_price" value="<%=connresultsel.get(0).getProduct_price()%>"></td>
				<td><input type="text" name="udt_color" value="<%=connresultsel.get(0).getProduct_color()%>"></td>
				<td><input type="text" name="udt_file" value="<%=connresultsel.get(0).getProduct_file()%>"></td>
				<td><input type="text" name="udt_img" value="<%=connresultsel.get(0).getProduct_img()%>"></td>
				<td><input type="text" name="udt_contents" value="<%=connresultsel.get(0).getProduct_contents()%>"></td>
			</tr>
		</table>
		<input type="hidden" name="udt_check" value="<%=dto.getCheck()%>" />
		<input type="submit" value="수정하기"/>
	</form>
</body>
</html>
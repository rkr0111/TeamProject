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
<title>DB+Product Insert Page</title>
</head>
<body>

	<h1>Product Insert<br>============</h1>
	<form action="DB_product_insert_commit.jsp" method="post">
		<table class="inserttable">
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
				<td><input type="text" name="p_name"></td>
				<td><input type="text" name="p_category"></td>
				<td><input type="text" name="p_price"></td>
				<td><input type="text" name="p_color"></td>
				<td><input type="text" name="p_file"></td>
				<td><input type="text" name="p_img"></td>
				<td><input type="text" name="p_contents"></td>
			</tr>
		</table>
		<input type="submit" value="상품 올리기">
	</form>
	
</body>
</html>

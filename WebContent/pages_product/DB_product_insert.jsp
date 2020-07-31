<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB+Product Insert Page</title>
</head>
<body>

	<h1>Product Insert<br>============</h1>
	<form action="../productInsert.bo" method="post" enctype="multipart/form-data">
		<table class="inserttable">
			<tr>
				<th>이름</th>
				<td><input type="text" name="product_name" required="required"></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><input type="text" name="product_category" required="required"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="product_price" required="required"></td>
			</tr>
			<tr>
				<th>컬러</th>
				<td><input type="text" name="product_color" required="required"></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="product_img" required="required"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="product_contents" required="required"></td>
			</tr>
		</table>
		<input type="submit" value="상품 올리기">
	</form>
	
</body>
</html>

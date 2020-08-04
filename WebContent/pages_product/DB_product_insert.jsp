<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB+Product Insert Page</title>
</head>
<style>
	.inserttable {
		border-collapse: collapse;
		margin-bottom: 30px;
	}
	.inserttable th, 
	.inserttable td {
		border: 1px solid #000;
		padding: 10px 30px;
	}
	.inserttable td input,
	.inserttable td select {
		width: 200px;
	}
</style>
<body>

	<h1>상품 등록하기<br>============</h1>
	<form action="../productInsert.bo" method="post" enctype="multipart/form-data">
		<table class="inserttable">
			<tr>
				<th>상품 이름</th>
				<td><input type="text" name="product_name" required="required"></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="product_category" required="required">
						<option name="desk">desk</option>
						<option name="bedroom">bedroom</option>
						<option name="stand">stand</option>
						<option name="point">point</option>
					</select>
				</td>
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
		<input type="submit" value="상품 등록">
	</form>
	
</body>
</html>

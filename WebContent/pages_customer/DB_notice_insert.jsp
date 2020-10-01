<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB+Product Insert Page</title>
<!-- jQuery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
</style>
<body>

	<h1>공지사항 등록하기<br>============</h1>
	<form action="../customerNoticeInsert.bo" method="post">
		<table class="inserttable">
			<tr>
				<th>제목</th>
				<td><input type="text" name="center_title" required="required" style="width: 500px;"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="center_contents" style="resize: none; width: 500px; height: 200px;" required></textarea></td>
			</tr>
		</table>
		<input type="submit" value="공지사항 등록">
	</form>
	
</body>
</html>

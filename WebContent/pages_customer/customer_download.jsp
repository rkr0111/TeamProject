<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">
	<link rel="stylesheet" type="text/css" href="../css/customer.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>제품설명서 다운로드</title>
</head>
<body>
	<!-- header -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
	%>
	<jsp:include page="../customer_header_beforelogin.jsp" />
	<%}else {%>
	<jsp:include page="../customer_header_afterlogin.jsp" />
	<%}%> <!-- header end -->
	
	<!-- section -->
	<section>
		<h1 class="titleText">CUSTOMER CENTER</h1>
		<!-- customerNav -->
		<div class="menuContainer">
			<ul>
				<li onclick="location.href='customer_notice.jsp';">공지사항</li>
				<li onclick="location.href='customer_download.jsp';" class="bgWhite">제품 설명서</li>
				<li onclick="location.href='customer_offline.jsp';">오프라인 매장</li>
			</ul>
		</div>
		<div class="customerContainer">
			<!-- 제품설명서 다운로드 콘첸츠 -->
			<div class="customerContents download">
				<h2>제품설명서 다운로드</h2>
				<div class="downloadTable">
					<table>
						<tr>
							<th width="200">카테고리</th>
							<th>상품 이름</th>
							<th width="200">파일</th>
						</tr>
						<tr>
							<th rowspan="3">desk</th>
							<td>상품이름 1</td>
							<th><input type="button" name="filedown" class="filedown" /></th>
						</tr>
						<tr>
							<td>상품이름 2</td>
							<th><input type="button" name="filedown" class="filedown" /></th>
						</tr>
						<tr>
							<td>상품이름 3</td>
							<th><input type="button" name="filedown" class="filedown" /></th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section> <!-- section end -->
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="../js/scroll.js"></script>	
	
</body>
</html>
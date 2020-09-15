<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Review_dto"%>
<%@page import="java.util.*"%>

<%
	List<Review_dto> reviewalllist = (List<Review_dto>) request.getAttribute("reviewalllist");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/review.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>인테리어 리뷰</title>
</head>
<body>
	<!-- header -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
	%>
	<jsp:include page="../review_header_beforelogin.jsp" />
	<%}else {%>
	<jsp:include page="../review_header_afterlogin.jsp" />
	<%}%> <!-- header end -->

	<!-- section -->
	<section>
		<h1 class="titleText">INTERIOR REVIEWS</h1>
		<div class="menuContainer">
			<ul>
				<li>Timeline</li>
			</ul>
		</div>
		<div class="interiorContainer">
			<ul class="reviewTimeline">
			<%if(reviewalllist.size() != 0) {
			for(int i=0; i<reviewalllist.size(); i++) {%>
				<li><img src="images/product_img/desk/<%=reviewalllist.get(i).getReview_img()%>"></li>
			<%}}%>
			</ul>			
		</div>
	</section> <!-- section end -->

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="js/scroll.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Review_dto"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="java.util.*"%>

<%
	List<Product_dto> listimg = (List<Product_dto>) request.getAttribute("listimg");
	List<Review_dto> listinfo = (List<Review_dto>) request.getAttribute("listinfo");
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
<script>
	function reviewDetailPage(id, name) {
		location.href="reviewDetailSelect.bo?review_name="+encodeURIComponent(name)+"&review_id="+encodeURIComponent(id);
	}
</script>
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
			<%if(listimg.size() != 0) {
			for(int i=0; i<listimg.size(); i++) {%>
				<li onclick="reviewDetailPage('<%=listinfo.get(i).getReview_id()%>', '<%=listinfo.get(i).getReview_name()%>')">
					<img src="images/product_img/<%=listimg.get(i).getProduct_category()%>/<%=listinfo.get(i).getReview_img()%>">
				</li>
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
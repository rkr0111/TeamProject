<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="com.TeamPro.dto.CustomerInfo_dto"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>마이페이지</title>	
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">
	<link rel="stylesheet" type="text/css" href="../css/login_mypage.css">

	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../login_header_afterlogin.jsp" /> <!-- header end -->
<%
	String id = (String)session.getAttribute("id");
		
	//orderList 클래스에 들어갈 정보
	Buyhistory_dto buyhistoryDto = new Buyhistory_dto();	
	ArrayList<Buyhistory_dto> buyhistoryList = (ArrayList<Buyhistory_dto>) request.getAttribute("buyhistoryList");
	/* ArrayList<Product_dto> productList = (ArrayList<Product_dto>) request.getAttribute("productList");
	ArrayList<CustomerInfo_dto> customerinfoList = (ArrayList<CustomerInfo_dto>) request.getAttribute("customerinfoList");
	ArrayList<CustomerInfo_dto> idList = (ArrayList<CustomerInfo_dto>) request.getAttribute("idList"); */
%>

<!-- 마이페이지의 인덱스페이지는 구매내역 (마이페이지 = 구매내역 페이지) -->
	<section id="wrap">
		<div class="member">
			My Page
		</div>
		
		<nav class="recentNav">
			<ul>
				<li>최근 본 제품</li> 
				<li><a href=""><img src="../images/mypage_img/recent_img/bedroom01_01.jpg"></a></li>
				<li><a href=""><img src="../images/mypage_img/recent_img/bedroom01_02.jpg"></a></li>
			</ul>
		</nav>

		<div class="contents">
			<!-- mypage_contents include -->
			<jsp:include page="login_mypage_contents.jsp" />
		</div>
	</section>

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="../js/scroll.js"></script>
</body>
</html>
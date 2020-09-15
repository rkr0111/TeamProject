<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
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
	//memberInfo 클래스에 들어갈 정보
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String addr = (String)session.getAttribute("addr");
	String phone = (String)session.getAttribute("phone");
	
	//orderList 클래스에 들어갈 정보
	Buyhistory_dto dto = new Buyhistory_dto();	
	ArrayList<Buyhistory_dto> buyhistoryList = (ArrayList<Buyhistory_dto>) request.getAttribute("buyhistoryList"); 
	
	//
	List<Product_dto> productList = (List<Product_dto>) request.getAttribute("productList");
%>

<!-- 마이페이지의 인덱스페이지는 구매내역 (마이페이지 = 구매내역 페이지) -->

	<section id="wrap">
		<div class="member">
			<div>
				<div class="memberId">
					<div><img src="../images/mypage_img/icons/person1.png"></div>
					<ul>
						<li><%=id%> 님</li>	
					</ul>
				</div>
				<div class="memberInfo">
					<div class="info_update"><a href="DB_infoUpdateBefore.jsp">개인정보 수정</a></div>
					<ul>
						<li>
							<p>이름 : </p>
							<p><%=name%></p>
						</li>
						<li>
							<p>주소 : </p>
							<p><%=addr%></p>
						</li>
						<li>
							<p>연락처 : </p>
							<p><%=phone%></p>
						</li>
					</ul>
				</div>
			</div>
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
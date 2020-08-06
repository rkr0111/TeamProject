<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
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
					<div class="info_update">개인정보 수정</div>
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
			<div class="mypageAsideTitle">
				<h3>마이페이지</h3>
				<aside class="mypageAside">
					<ul>
						<li id="orderHistory">
							<a href="DB_mypage.jsp">구매내역
								<p>&gt;</p>
							</a>
						</li>
						<li id="review">
							<a href="">리뷰
								<p>&gt;</p>
							</a>
						</li>
						<li id="cart">
							<a href="">장바구니
								<p>&gt;</p>
							</a>
						</li>
						<li id="question">
							<a href="">1:1 문의
								<p>&gt;</p>
							</a>
						</li>
						<li id="as">
							<a href="">A/S 문의
								<p>&gt;</p>
							</a>
						</li>
					</ul>
				</aside>
			</div>

			<div class="contentsTitle">
				<ul>
					<li>구매 내역</li>
					<li>
						<select name="selectMonth" size="1">
							<option name="selectAll">전체 기간</option>
							<option name="selectOneMonth">1개월</option>
							<option name="selectThreeMonth">3개월</option>
							<option name="selectSixthMonth">6개월</option>
						</select>
					</li>
				</ul>
			</div>

			<div class="contentsOrder">
				<% 
				if(buyhistoryList != null) { 
					for(int i=0; i<buyhistoryList.size(); i++) { 
						
				%>							
				<div class="orderList">
					<p><%out.print(buyhistoryList.get(i).getBuy_date());%></p>
					<ul class="order">
						<li> 
							<div><%out.print(buyhistoryList.get(i).getBuy_name());%></div>
							<ul class="addEtc">
								<li>리뷰하기</li>
								<li>문의하기</li>
							</ul>
						</li>
						<li>
							<div class="orderImgBox"><img src="../images/mypage_img/order_img/point01_03.jpg"></div>
							<ul class="orderInfo">
								<li>
									<p>주문 번호</p>
									<p>111111</p> 
								</li>
								<li>
									<p>결제 금액</p> 
									<p><%out.print(buyhistoryList.get(i).getBuy_price());%></p>
								</li>
								<li>
									<p>주문 상태</p> 
									<p><%out.print(buyhistoryList.get(i).getBuy_condition());%></p>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				<%}}%>				
			</div>
		</div>

	</section>

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="../js/scroll.js"></script>
	<script type="text/javascript" src="../js/login_mypage.js"></script>
</body>
</html>
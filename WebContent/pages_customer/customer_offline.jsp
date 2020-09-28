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
	<title>오프라인 매장</title>
</head>
<body>
	<!-- header -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
	%>
	<jsp:include page="../customer_offline_header_beforelogin.jsp" />
	<%}else {%>
	<jsp:include page="../customer_offline_header_afterlogin.jsp" />
	<%}%> <!-- header end -->
	
	<!-- section -->
	<section>
		<h1 class="titleText">CUSTOMER CENTER</h1>
		<!-- customerNav -->
		<div class="menuContainer">
			<ul>
				<li onclick="location.href='customer_notice.jsp';">공지사항</li>
				<li onclick="location.href='../customerDownload.bo';">제품 설명서</li>
				<li onclick="location.href='customer_offline.jsp';" class="bgWhite">오프라인 매장</li>
			</ul>
		</div>
		<div class="customerContainer">
				<!-- 오프라인 매장 콘텐츠 -->
			<div class="customerContents offline">
				<h2>오프라인 매장</h2>
				<div id="map" class="mapApiContainer mb_30"></div>
				<div  class="showRoomConn">
					<h3 class="fs_20 fw_bold mb_10">쇼핑몰 이름 | 강남점</h3>
					<p class="mb_10">서울시 강남구 역삼동 815-4(강남대로 428) 만이빌딩 5층, 10층</p>
					<p>02-3481-1005</p>
				</div>
			</div>
		</div>
	</section> <!-- section end -->
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="../js/scroll.js"></script>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa3682f31007c1d0ad50235a88cc7e78"></script>
	<script type="text/javascript">
		// 위도, 경도 : 37.500972, 127.026860
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.500972, 127.026860), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.500972, 127.026860); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="com.TeamPro.dto.PageInfo"%>
<%@page import="java.util.*"%>

<%
List<Product_dto> productList = (List<Product_dto>) request.getAttribute("productList");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/mdpick.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>MD Pick</title>
</head>
<script type="text/javascript">
	var weather = "";
	window.onload = function weatherApi() {
		var api = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=b1c0c7525d62991fddcf261a16a8216f";
		var api1 = "http://api.openweathermap.org/data/2.5/weather?q=";
		var apiKey = "&appid=b1c0c7525d62991fddcf261a16a8216f";
		var imgSrc = "images/mdpick_img/";
		$.ajax({
			url: api,
			type: 'get',
			dataType: 'json',
			success: function(obj) {
				var temp = ((obj.main.temp)-273).toFixed(1); // 온도
				weather = obj.weather[0].main; // 날씨
				var city = "서울";
				var imgName = "";
				
				if(weather == "Clouds"){
					weather = "흐림";
					imgName = "clouds";
				}else if (weather == "Thunderstorm") {
					weather = "낙뢰";
					imgName = "thunderstorm";
				}else if (weather == "Rain") {
					weather = "비";
					imgName = "rain";
				}else if (weather == "Drizzle") {
					weather = "이슬비";
					imgName = "drizzle";
				}else if (weather == "Clear") {
					weather = "맑음";
					imgName = "clear";
				}else if (weather == "Fog") {
					weather = "안개";
					imgName = "fog";
				}else if (weather == "Snow") {
					weather = "눈";
					imgName = "snow";
				}			
			}
		});
	}
	
	function productLink(param) {
		location.href="productDetailSelect.bo?product_name="+encodeURIComponent(param);
	}	
</script>

<body>
	<!-- header -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
	%>
	<jsp:include page="../mdpick_header_beforelogin.jsp" />
	<%}else {%>
	<jsp:include page="../mdpick_header_afterlogin.jsp" />
	<%}%> <!-- header end -->

	<!-- section -->
	<section>
		<h1 class="titleText">MD PICK</h1>
		<div class="menuContainer">
			<ul>
				<li class="bgWhite">Today Pick</li>
				<li onclick="location.href='mdWeatherList.bo?product_weather='+encodeURIComponent(weather);" class="mdpick">Weather Pick</li>
			</ul>
		</div>

		<div class="pickContainer">
			<!-- pickContents today -->
			<div class="pickContents today">
				<div class="contentsTitle">
					<h2>오늘의 추천</h2>
					<p>오늘의 추천은 랜덤으로 상품을 소개합니다.</p>
				</div>
				<%if(productList.size() != 0) {%>
				<div class="imgBox"><img src="images/product_img/<%out.print(productList.get(0).getProduct_category());%>/<%out.print(productList.get(0).getProduct_img());%>"></div>
				<div class="contentsItems mt_30">
					<div class="items-inner">
						<div class="textBox">
							<h3 class="mb_15"><%out.print(productList.get(0).getProduct_name());%></h3>
							<p><%out.print(productList.get(0).getProduct_contents());%></p>
						</div>
						<div class="detailBtn mt_30">
							<input type="button" name="detailBtn" value="상품 자세히 보기" onclick="productLink('<%out.print(productList.get(0).getProduct_name());%>')">
						</div>
					</div>
				</div>
				<%}%>
			</div>
		</div>
	</section> <!-- section end -->

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="js/scroll.js"></script>
</body>
</html>
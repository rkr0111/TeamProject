<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="com.TeamPro.dto.PageInfo"%>
<%@page import="java.util.*"%>
<%@page import="org.json.simple.JSONObject"%>

<%
List<Product_dto> productAllList = (List<Product_dto>) request.getAttribute("productAllList");
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
	function productLink(param) {
		location.href="productDetailSelect.bo?product_name="+encodeURIComponent(param);
	}	
</script>

<body>
		<!-- pickContents weather -->
				<div class="contentsTitle">
					<h2>날씨에 맞는 추천</h2>
					<p>오늘의 날씨에 맞는 분위기의 상품을 소개합니다.</p>
				</div>
				<div class="weatherApiCon">
					<ul>
						<li class="weatherImg">
							<img src="" />
						</li>
						<li class="cityText"></li>
						<li class="weatherText"></li>
						<li class="tempText"></li>
					</ul>
				</div>
				<ul class="weatherPickCon">
					<script>
						var weatherText = document.querySelector(".weatherText");
					</script>
					<%
					String listWeather = "";
					for(int i=0; i<productAllList.size(); i++) {
						listWeather += productAllList.get(i).getProduct_weather() + ",";
					}%>
					<script>
						var listWeather = "<%=listWeather%>";
						if(listWeather.indexOf(weatherText)) {
							var wtext = weatherText.innerText;
							console.log("jsp : " + wtext);
							location.href="mdWeatherList.bo?product_weather="+encodeURIComponent(wtext);
						}
					</script>
					<%-- <%
					List<Product_dto> weaterProList = (List<Product_dto>) request.getAttribute("weaterProList");
					System.out.print("jsp : : " + weaterProList);
					for(int i=0; i<weaterProList.size(); i++) {
					%>
					<li>
						<div class="imgBox"><img src="images/product_img/<%out.print(weaterProList.get(i).getProduct_category());%>/<%out.print(weaterProList.get(i).getProduct_img());%>"></div>
						<div class="contentsItems">
							<div class="textBox">
								<h3 class="mb_15"><%out.print(weaterProList.get(i).getProduct_name());%></h3>
								<p><%out.print(weaterProList.get(i).getProduct_contents());%></p>
							</div>
							<div class="detailBtn mt_30">
								<input type="button" name="detailBtn" value="상품 자세히 보기" onclick="productLink('<%out.print(weaterProList.get(i).getProduct_name());%>')">
							</div>
						</div>	
					</li>
					<%}%> --%>
				</ul>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="com.TeamPro.dto.PageInfo"%>
<%@page import="java.util.*"%>
<%@page import="org.json.simple.JSONObject"%>

<%
List<Product_dto> productList = (List<Product_dto>) request.getAttribute("productList");
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
				<li class="bgWhite" onclick="clickPickContents(0)">Today Pick</li>
				<li class="weatherBtn" onclick="clickPickContents(1, weatherText)">Weather Pick</li>
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
			<!-- pickContents weather -->
			<div class="pickContents weather none">
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
					<%-- <%
					for(int i=0; i<productAllList.size(); i++) {
						String listWeather = productAllList.get(i).getProduct_weather();
					%>
					<li>
						<div class="imgBox"><img src="images/product_img/<%out.print(productAllList.get(i).getProduct_category());%>/<%out.print(productAllList.get(i).getProduct_img());%>"></div>
						<div class="contentsItems">
							<div class="textBox">
								<h3 class="mb_15"><%out.print(productAllList.get(i).getProduct_name());%></h3>
								<p><%out.print(productAllList.get(i).getProduct_contents());%></p>
							</div>
							<div class="detailBtn mt_30">
								<input type="button" name="detailBtn" value="상품 자세히 보기" onclick="productLink('<%out.print(productList.get(i).getProduct_name());%>')">
							</div>
						</div>	
					</li>
	
					<script>
						var weatherText = document.querySelector(".weatherText");
						var listWeather = <%=listWeather%>;
						var weatherPickCon = document.querySelector(".weatherPickCon");
						var appendText = "<li>"
										+ "<div class='imgBox'><img src='images/product_img/<%out.print(productAllList.get(i).getProduct_category());%>/<%out.print(productAllList.get(i).getProduct_img());%>'></div>"
										+ "<div class='contentsItems'>"
										+ "<div class='textBox'>"
										+ "<h3 class='mb_15'><%out.print(productAllList.get(i).getProduct_name());%></h3>"
										+ "</div><div class='detailBtn mt_30'>"
										+ "<input type='button' name='detailBtn' value='상품 자세히 보기' onclick='productLink('<%out.print(productList.get(i).getProduct_name());%>')'>"
										+ "</div></div></li>";
						
						if(weatherText == listWeather) {
							for(var i=0; i<lstWeather.length; i++) {
								weatherPickCon.append(appendText);
							}
						}
					</script>
					<%}%> --%>
					<%
					String listWeather = "";
					for(int i=0; i<productAllList.size(); i++) {
						listWeather += productAllList.get(i).getProduct_weather() + ",";
					%>
					<%}
					String[] idx = listWeather.split(",");
					for(int i=0; i<idx.length; i++) {%>
						<script>
							var listWeather[].push(<%=idx[i]%>);
							console.log(listWeather);
						</script>
					<%}%>
					<!-- <script>
					function appendWeatherTex(obj) {
						console.log(obj);
						if(obj == listWeather) {
							console.log(listWeather);
						}else {
							console.log("nono")
						}
					}
					</script> -->
				</ul>
			</div>
		</div>
	</section> <!-- section end -->

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="js/scroll.js"></script>
	<script type="text/javascript" src="js/mdpick.js"></script>
</body>
</html>
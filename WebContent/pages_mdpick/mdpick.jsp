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
				<li onclick="clickPickContents(1)">Weather Pick</li>
			</ul>
		</div>

		<div class="pickContainer">
			<!-- pickContents today -->
			<div class="pickContents today">
				<div class="contentsTitle">
					<h2>오늘의 추천</h2>
					<p>오늘의 추천은 랜덤으로 상품을 소개합니다.</p>
				</div>
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
			</div>
			<!-- pickContents weather -->
			<div class="pickContents weather none">
				<div class="contentsTitle">
					<h2>날씨에 맞는 추천</h2>
					<p>주간 날씨에 맞는 분위기의 상품을 소개합니다.</p>
				</div>
				<div class="weatherApiCon"></div>
				<ul class="weatherPickCon">
					<li>
						<div class="imgBox"><img src="images/product_img/desk/desk01_01.jpg"></div>
						<div class="contentsItems">
							<div class="textBox">
								<h3 class="mb_15">상품 이름</h3>
								<p>상품 소개글 상품 소개글상품 소개글상품 소개글상품 소개글상품 소개글상품 소개글상품 소개글상품 소개글</p>
							</div>
							<div class="detailBtn mt_30">
								<input type="button" name="detailBtn" value="상품 자세히 보기">
							</div>
						</div>	
					</li><li>
						<div class="imgBox"><img src="images/product_img/desk/desk01_01.jpg"></div>
						<div class="contentsItems">
							<div class="textBox">
								<h3 class="mb_15">상품 이름</h3>
								<p>상품 소개글 상품 소개글상품 소개글상품 소개글상품 소개글상품 소개글상품 소개글상품 소개글상품 소개글</p>
							</div>
							<div class="detailBtn mt_30">
								<input type="button" name="detailBtn" value="상품 자세히 보기">
							</div>
						</div>	
					</li>
				</ul>
			</div>
		</div>
	</section> <!-- section end -->

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="js/scroll.js"></script>
	<script type="text/javascript">
		var todayContents = document.querySelector(".pickContents.today");
		var weatherContents = document.querySelector(".pickContents.weather");
		var menuContainerLI = document.querySelectorAll(".menuContainer > ul > li");
	
		function clickPickContents(obj) {
			if(obj == 0) {
				menuContainerLI[0].classList.add("bgWhite");
				menuContainerLI[1].classList.remove("bgWhite");
				todayContents.classList.remove("none");
				weatherContents.classList.add("none");
			}else if(obj == 1) {
				menuContainerLI[0].classList.remove("bgWhite");
				menuContainerLI[1].classList.add("bgWhite");
				todayContents.classList.add("none");
				weatherContents.classList.remove("none");
			}
		}
	</script>

</body>
</html>
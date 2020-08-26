<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="com.TeamPro.dto.PageInfo"%>
<%@page import="java.util.*"%>

<%
List<Product_dto> productAllList = (List<Product_dto>) request.getAttribute("productAllList");
List<Product_dto> weaterProList = (List<Product_dto>) request.getAttribute("weaterProList");
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
				<li onclick="location.href='mdRandomList.bo';">Today Pick</li>
				<li class="mdpick bgWhite">Weather Pick</li>
			</ul>
		</div>

		<div class="pickContainer">
			<!-- pickContents weather -->
			<div class="pickContents weather">
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
					<%for(int i=0; i<weaterProList.size(); i++) {%>
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
					<%}%>
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
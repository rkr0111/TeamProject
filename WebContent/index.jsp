<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.Review_dto"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
	<link rel="stylesheet" type="text/css" href="./css/common.css">
	<link rel="stylesheet" type="text/css" href="./css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="./css/font.css">
	<link rel="stylesheet" type="text/css" href="./css/index.css">
	<link rel="stylesheet" type="text/css" href="./css/flexslider.css" />

	<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>팀 프로젝트 index</title>
</head>
<body>
	<!-- header -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
	%>
	<jsp:include page="index_header_beforelogin.jsp" />
	<%} else {%>
	<jsp:include page="index_header_afterlogin.jsp" />
	<%}%> <!-- header end -->

	<section>
		<!-- topbannerContainer -->
		<div class="topbannerContainer flexslider">
			<ul class="slides">
				<li><img src="./images/banner_img/banner_01.jpg"></li>
				<li><img src="./images/banner_img/banner_02.jpg"></li>
				<li><img src="./images/banner_img/banner_03.jpg"></li>
				<li><img src="./images/banner_img/banner_04.jpg"></li>
			</ul>
		</div>
		<!-- productContainer -->
		<div class="productContainer">
			<h2>Product</h2>
			<div class="product-inner">
				<ul class="productLeftBox mr_30">
					<li class="productContents desk mb_30" data-aos="fade-up" data-aos-delay="50">
						<a href="productList.bo?product_category=desk">
							<div class="bgText NanumGothicCodingRegular">DESK LIGHT</div>
						</a>
					</li>
					<li class="productContents bedroom" data-aos="fade-up" data-aos-delay="50">
						<a href="productList.bo?product_category=bedroom">
							<div class="bgText NanumGothicCodingRegular">BEDROOM LIGHT</div>
						</a>
					</li>
				</ul>
				<ul class="productRightBox">
					<li class="productContents stand mb_30" data-aos="fade-up" data-aos-delay="200">
						<a href="productList.bo?product_category=stand">
							<div class="bgText NanumGothicCodingRegular">STAND LIGHT</div>
						</a>
					</li>
					<li class="productContents point" data-aos="fade-up" data-aos-delay="250">
						<a href="productList.bo?product_category=point">
							<div class="bgText NanumGothicCodingRegular">POINT LIGHT</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- introContainer -->
		<div class="introContainer">
			<div class="intro-inner">
				<div class="introImg" data-aos="fade-right"></div>
				<div class="introText" data-aos="fade-left">
					<h3 class="fs_23 textColor gray_aaa NanumGothicCodingRegular">about</h3>
					<p class="fs_14 lh_2_1 textColor gray_656565">
						홈페이지 설명 홈페이지 설명 홈페이지 설명 홈페이지 설명 홈페이지 설명 홈페이지 설명 홈페이지 설명 홈페이지 설명 홈페이지 설명 홈페이지 설명
					</p>
				</div>
			</div>
		</div>
		<!-- interiorContainer -->
		<div class="interiorContainer">
			<div class="interior-inner">
				<h2>interior</h2>
				<ul>
					<%List<Review_dto> listinfo = (List<Review_dto>) request.getAttribute("listinfo");
					if(listinfo != null) {
					for(int i=0; i<listinfo.size(); i++) {%>
					<li
						onclick="location.href='reviewDetailSelect.bo?review_num=<%=listinfo.get(i).getReview_num()%>';">
						<div class="interiorImgBox">
							<img src="product_file/<%=listinfo.get(i).getReview_img()%>">
						</div>
						<p class="interiorTextBox"><%=listinfo.get(i).getReview_contents()%></p>
					</li>
					<%}}else {
						out.println("<script type='text/javascript'>window.onload=function() {location.href='indexList.bo';}</script>");
					}%>
				</ul>
				<div class="viewMoreBtn"><a href="reviewAllList.bo">view more</a></div>
			</div>
		</div>
		<!-- newsContainer -->
		<div class="newsContainer">
			<div class="news-inner">
				<h2>News</h2>
				<p>공지사항을 확인하세요.</p>
				<div class="newsContents">
					<ul>
						<li><a href="">공지사항 제목입니다. 공지사항 공지사항</a></li>
						<li><a href="">공지사항 제목입니다. 공지사항 공지사항</a></li>
						<li><a href="">공지사항 제목입니다. 공지사항 공지사항</a></li>
						<li><a href="">공지사항 제목입니다. 공지사항 공지사항</a></li>
					</ul>
				</div>
				<div class="viewMoreBtn"><a href="customerNoticeList.bo?center_category=notice">view more</a></div>
			</div>
		</div>
	</section>
	

	<!-- footer -->
	<jsp:include page="footer.jsp" /> <!-- footer end -->
	
  	<!-- script -->
	<script type="text/javascript" src="./js/index-nav.js"></script>
	<script type="text/javascript" src="./js/scroll.js"></script>

  	<script defer src="./js/jquery.flexslider.js"></script>
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>

  	<script type="text/javascript">
    	AOS.init();
    	$(window).load(function() {
	  		$('.flexslider').flexslider({
	    	animation: "slide"
		  	});
		});
	</script>
</body>
</html>
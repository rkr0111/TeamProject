<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
</head>
<body>
	<!-- header -->
	<header id="index">
		<div class="header-inner">
			<div class="menuIcon"><div class="icon"></div></div>
			<div id="logo"><a href="index.jsp"></a></div>
			<ul class="minimenu">
				<li><a href="pages_login/login_login.jsp">LOGIN</a></li>
				<li><a href="pages_login/login_join.jsp">JOIN</a></li>
			</ul>
		</div>
		<nav>
			<div class="nav-inner">
				<div class="exitBtn"></div>
				<ul class="mainmenu">
					<li><a href="pages_product/product_desk.jsp">DESK</a></li>
					<li><a href="pages_product/product_bedroom.jsp">BEDROOM</a></li>
					<li><a href="pages_product/product_stand.jsp">STAND</a></li>
					<li class="btmline"><a href="pages_product/product_point.jsp">POINT</a></li>
					<li><a href="pages_mdpick/mdpick.jsp">MD PICK</a></li>
					<li class="btmline">
						<a href="pages_interior/interior.jsp">INTERIOR</a>
						<ul class="submenu">
							<li><a href="pages_interior/interior.jsp">인테리어 전시</a></li>
						</ul>
					</li>
					<li>
						<a href="pages_download/download.jsp">DOWNLOAD</a>
						<ul class="submenu">
							<li><a href="pages_download/download.jsp">제품설명서</a></li>
						</ul>
					</li>
					<li>
						<a href="pages_customer/customer_center.jsp">CUSTOMER CENTER</a>
						<ul class="submenu">
							<li><a href="pages_customer/customer_center.jsp">공지사항</a></li>
							<li><a href="pages_customer/customer_contact.jsp">1:1 문의</a></li>
							<li><a href="pages_customer/customer_as.jsp">A/S 신청</a></li>
							<li><a href="pages_customer/customer_offline.jsp">오프라인 매장</a></li>
						</ul>
					</li>
				</ul>
				<div class="navImgBox">
					<div></div>
				</div>
			</div>
		</nav>
	</header> <!-- header end -->
</body>
</html>
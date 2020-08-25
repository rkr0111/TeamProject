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
	<header id="page">
		<div class="header-inner">
			<div id="logo"><a href="../index.jsp"></a></div>
			<nav>
				<ul class="mainmenu">
					<li><a href="../productList.bo?product_category=desk">DESK</a></li>
					<li><a href="../productList.bo?product_category=bedroom">BEDROOM</a></li>
					<li><a href="../productList.bo?product_category=stand">STAND</a></li>
					<li><a href="../productList.bo?product_category=point">POINT</a></li>
					<li><a href="../mdRandomList.bo" class="mdpick">MD PICK</a></li>
					<li><a href="../TeamPro/pages_interior/interior.jsp">INTERIOR</a></li>
					<li>
						<a href="customer_notice.jsp">CUSTOMER CENTER</a>
						<ul class="submenu">
							<li><a href="customer_notice.jsp">공지사항</a></li>
							<li><a href="customer_download.jsp">제품설명서</a></li>
							<li><a href="customer_offline.jsp">오프라인 매장</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<ul class="minimenu">
				<li><a href="../pages_login/login_login.jsp">LOGIN</a></li>
				<li><a href="../pages_login/login_join.jsp">JOIN</a></li>
			</ul>
		</div>
	</header> <!-- header end -->
	
  	<!-- script -->
	<script type="text/javascript" src="../js/weatherApi.js"></script>
</body>
</html>
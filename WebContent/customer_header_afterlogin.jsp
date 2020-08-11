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
			<div id="logo"><a href="../TeamPro/index.jsp"></a></div>
			<nav>
				<ul class="mainmenu">
					<li><a href="../productList.bo?product_category=desk">DESK</a></li>
					<li><a href="../productList.bo?product_category=bedroom">BEDROOM</a></li>
					<li><a href="../productList.bo?product_category=stand">STAND</a></li>
					<li><a href="../productList.bo?product_category=point">POINT</a></li>
					<li><a href="../TeamPro/mdRandomList.bo">MD PICK</a></li>
					<li>
						<a href="../TeamPro/pages_interior/interior.jsp">INTERIOR</a>
						<ul class="submenu">
							<li><a href="../TeamPro/pages_interior/interior.jsp">인테리어 전시</a></li>
						</ul>
					</li>
					<li>
						<a href="../TeamPro/pages_download/download.jsp">DOWNLOAD</a>
						<ul class="submenu">
							<li><a href="../TeamPro/pages_download/download.jsp">제품설명서</a></li>
						</ul>
					</li>
					<li>
						<a href="customer_center.jsp">CUSTOMER CENTER</a>
						<ul class="submenu">
							<li><a href="customer_center.jsp">공지사항</a></li>
							<li><a href="customer_contact.jsp">1:1 문의</a></li>
							<li><a href="customer_as.jsp">A/S 신청</a></li>
							<li><a href="customer_offline.jsp">오프라인 매장</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<ul class="minimenu">
				<%String id= (String) session.getAttribute("id");%>
				<li><%out.print(id);%>님 안녕하세요.</li>
				<li><a href="../TeamPro/pages_login/DB_mypage_buyhistory.jsp">MY PAGE</a></li>
				<li><a href="../TeamPro/pages_login/DB_logout.jsp">LOGOUT</a></li>
			</ul>
		</div>
	</header> <!-- header end -->
</body>
</html>
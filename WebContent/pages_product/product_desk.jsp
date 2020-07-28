<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">
	<link rel="stylesheet" type="text/css" href="../css/product_desk.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>탁상용 상품페이지</title>
</head>
<script type="text/javascript">
	function productNameLink(param, flag) {
		if(flag == 0) {
			location.href="DB_product_update.jsp?product_name="+encodeURI(param);
		}else if(flag == 1) {
			location.href="DB_product_delete.jsp?product_name="+encodeURI(param);
		}else if(flag == 2) {
			location.href="product_desk_detail.jsp?product_name="+encodeURIComponent(param);
		}
	}
	
	function partSelect(param) {
		location.href="DB_product_select.jsp?search_product="+encodeURI(param);
	}
	
	
</script>

<body>
	<!-- header -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
	%>
	<jsp:include page="../pages_header_beforelogin.jsp" />
	<%}else {%>
	<jsp:include page="../pages_header_afterlogin.jsp" />
	<%}%> <!-- header end -->

	<!-- section -->
	<section>
		<h1 class="titleText textColor white">탁상용</h1>
		<div class="viewContain">
			<ul>
				<li class="product-count">총 <span class="ml_6">00</span>개의 상품</li>
				<li>
					<select name="viewsort" size="1">
						<option name="date-new" value="신상품순">신상품순</option>
						<option name="puplar" value="인기상품순">인기상품순</option>
						<option name="price-desc" value="낮은가격순">낮은가격순</option>
						<option name="price-asc" value="높은가격순">높은가격순</option>
					</select>
				</li>
			</ul>
		</div>
		<div id="contents">
			<%if(id == null) {%>
			<div style="display: none;"></div>
			<%}else if(!id.equals("admin")) {%>
			<div style="display: none;"></div>
			<%}else if(id.equals("admin")) {%>
			<div class="mb_20">
				<input type="button" value="상품 등록하기" onclick="location.href='DB_product_insert.jsp'" />
			</div>
			<%}%>
			<div class="productContainer">
				<ul class="productList">
					<%
						TeamPro_dao dao = new TeamPro_dao();
											Product_dto dto = new Product_dto();

											SqlSessionFactory sqlfactory = dao.getConn();
											SqlSession sqlsession = sqlfactory.openSession();
											
											List<Product_dto> connresultsel = sqlsession.selectList("xml_select");					
											
											for(int i=0; i<connresultsel.size(); i++) {
												String product_name = connresultsel.get(i).getProduct_name();
					%>
						<li>
							<a onclick="productNameLink('<%=product_name %>', 2)" >
								<div class="imgBox imgBox_1"></div>
								<div class="textBox">
									<ul>
										<%if(id == null) {%>
										<li style="display: none;"></li>
										<%}else if(!id.equals("admin")) {%>
										<li style="display: none;"></li>
										<%}else if(id.equals("admin")) {%>
										<li class="mb_10">
											<input type="button" value="수정하기" onclick="productNameLink('<%=product_name %>', 0)" />
											<input type="button" value="삭제하기" onclick="productNameLink('<%=product_name %>', 1)" />
										</li>
										<%}%>
										<li class="fs_20 fw_bold textColor gray_656565"><%out.print(product_name);%></li>
										<li class="priceBox fs_18">\<%out.print(connresultsel.get(i).getProduct_price());%></li>
										<li class="proContentsBox fs_14"><%out.print(connresultsel.get(i).getProduct_contents());%></li>
									</ul>
								</div>
							</a>
						</li>
					<%}%>
				</ul>
				<div class="pagenation">
					<ul>
						<li class="firstBtn"><a href="">&lt;</a></li>
						<li><a href="">1</a></li>
						<li><a href="">2</a></li>
						<li class="lastBtn"><a href="">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section> <!-- section end -->

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="../js/scroll.js"></script>	
	
</body>
</html>
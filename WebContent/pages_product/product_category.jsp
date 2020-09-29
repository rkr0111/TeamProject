<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="com.TeamPro.dto.PageInfo"%>
<%@page import="java.util.*"%>

<%
	List<Product_dto> productList = (List<Product_dto>) request.getAttribute("productList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/product_category.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>상품페이지</title>
</head>
<script type="text/javascript">
	function productNameLink(param, flag, category) {
		if(flag == 0) {
			location.href="pages_product/DB_product_update.jsp?product_name="+encodeURIComponent(param);
		}else if(flag == 1) {
			location.href="productDelete.bo?product_name="+encodeURIComponent(param)+"&product_category="+category;
		}else if(flag == 2) {
			location.href="productDetailSelect.bo?product_name="+encodeURIComponent(param);
		}
	}
</script>

<body>
	<!-- header -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
	%>
	<jsp:include page="../product_header_beforelogin.jsp" />
	<%}else {%>
	<jsp:include page="../product_header_afterlogin.jsp" />
	<%}%> <!-- header end -->

	<!-- section -->
	<section>
		<%if(productList.size() != 0) {%>
		<h1 class="titleText <%out.print(productList.get(0).getProduct_category());%> textColor white">
		<%out.print(productList.get(0).getProduct_category());%>
		</h1>
		<div class="viewContain">
			<ul>
				<li class="product-count">총 <span class="ml_6"><%=pageInfo.getListCount()%></span>개의 상품</li>
				<li>
					<select name="viewsort" size="1" onchange="listSorted('<%=productList.get(0).getProduct_category()%>')">
						<option name="selected-sort">정렬선택</option>
						<option name="sort-new" value="sort-new">신상품순</option>
						<option name="sort-asc" value="sort-asc">낮은가격순</option>
						<option name="sort-desc" value="sort-desc">높은가격순</option>
					</select>
				</li>
			</ul>
		</div>
		<%}%>
		<div id="contents">
			<%if(id == null) {%>
			<div style="display: none;"></div>
			<%}else if(!id.equals("admin")) {%>
			<div style="display: none;"></div>
			<%}else if(id.equals("admin")) {%>
			<div class="mb_20">
				<input type="button" value="상품 등록하기" onclick="location.href='pages_product/DB_product_insert.jsp'" />
			</div>
			<%}%>
			<div class="productContainer">
				<ul class="productList">
					<%
					for(int i=0; i<productList.size(); i++) {
					String product_name = productList.get(i).getProduct_name();
					%>
						<li>
							<a class="imgContainer" onclick="productNameLink('<%=product_name %>', 2, '')" >
								<img src="images/product_img/<%out.print(productList.get(i).getProduct_category());%>/<%out.print(productList.get(i).getProduct_img());%>"/>
							</a>
							<div class="textBox">
								<ul>
									<%if(id == null) {%>
									<li style="display: none;"></li>
									<%}else if(!id.equals("admin")) {%>
									<li style="display: none;"></li>
									<%}else if(id.equals("admin")) {%>
									<li class="mb_10">
										<input type="button" value="수정하기" onclick="productNameLink('<%=product_name %>', 0, '')" />
										<input type="button" value="삭제하기" onclick="productNameLink('<%=product_name %>', 1, '<%out.print(productList.get(i).getProduct_category());%>')" />
									</li>
									<%}%>
									<li class="fs_20 fw_bold textColor gray_656565"><%out.print(product_name);%></li>
									<li class="priceBox fs_18"><%out.print(productList.get(i).getProduct_price());%>원</li>
									<li class="proContentsBox fs_14"><%out.print(productList.get(i).getProduct_contents());%></li>
								</ul>
							</div>
						</li>
					<%}%>
				</ul>
				<div id="pageList" class="pagenation">
					<ul>
					<%if(productList.size() != 0) {%>
						<%if(nowPage<=1){%>
						<li class="firstBtn"><a href="#">&lt;</a></li>
						<%}else{%>
						<li class="firstBtn"><a href="productList.bo?product_category=<%out.print(productList.get(0).getProduct_category());%>&page=<%=nowPage-1%>">&lt;</a></li>
						<%}%>
						<%for(int a=startPage;a<=endPage;a++){
						if(a==nowPage){%>
						<li><a href="#" class="fw_bold"><%=a%></a></li>
						<%}else{ %>
						<li><a href="productList.bo?product_category=<%out.print(productList.get(0).getProduct_category());%>&page=<%=a%>"><%=a%></a></li>
						<%}%>
						<%}%>
						<%if(nowPage>=maxPage){ %>
						<li class="lastBtn"><a href="#">&gt;</a></li>
						<%}else{%>
						<li class="lastBtn"><a href="productList.bo?product_category=<%out.print(productList.get(0).getProduct_category());%>&page=<%=nowPage+1%>">&gt;</a></li>
						<%}}%>
					</ul>
				</div>
			</div>
		</div>
	</section> <!-- section end -->

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="js/scroll.js"></script>
	<script type="text/javascript" src="js/product_category.js"></script>
	
</body>
</html>
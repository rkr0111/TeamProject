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
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/product_desk_detail.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>탁상용 상품페이지 | 상세페이지</title>
</head>

<%
	request.setCharacterEncoding("utf-8");
	List<Product_dto> isDetailSuccess = (List<Product_dto>) request.getAttribute("isDetailSuccess");
%>

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
		<!-- headerProductContainer -->
		<div class="headerProductContainer">
			<div class="productContainer">
				<img src="images/product_img/<%out.print(isDetailSuccess.get(0).getProduct_category());%>/<%out.print(isDetailSuccess.get(0).getProduct_img());%>">
			</div>
			<div class="productInfoContainer">
				<ul>
					<li class="fs_20 fw_bold"><%out.print(isDetailSuccess.get(0).getProduct_name());%></li>
					<li class="fs_14 mt_10 mb_25 textColor gray_9c9c9c"><%out.print(isDetailSuccess.get(0).getProduct_contents());%></li>
				</ul>
				<div class="productPrice">
					<span class="labelText">가격</span>
					<span class="fs_18">\<%out.print(isDetailSuccess.get(0).getProduct_price());%></span>
				</div>
				<div class="amountContents pt_20 mt_20 mb_10">
					<span class="labelText">개수</span>
					<ul class="amount">
						<li><a href="#" class="btn_minus">-</a></li>
						<li><input type="text" name="showamount" value="1" /></li>
						<li><a href="#" class="btn_plus">+</a></li>
					</ul>
				</div>
				<div class="colorSelectContents">
					<span class="labelText">컬러</span>
					<select size="1">
						<option>검정</option>
						<option>파랑</option>
						<option>노랑</option>
					</select>
				</div>
				<div class="totalChoiceContainer hidden mt_20">
					<ul class="totalChoice">
						<li><%out.print(isDetailSuccess.get(0).getProduct_name());%></li>
						<li class="product_color">검정</li>
						<li class="product_cnt">1개</li>
					</ul>
				</div>
				<div class="totalPrice t_align_right fs_23 fw_bold textColor ff9d2d pt_20 mb_10">\</div>
				<div class="t_align_right fs_14 textColor gray_9c9c9c">100,000원 이상 구매시 무료배송</div>
				<ul class="customerBtn mt_20">
					<li class="mr_10"><input type="button" name="cart_btn" value="장바구니"></li>
					<li><input type="button" name="buy_btn" value="바로구매"></li>
				</ul>
			</div>
		</div> <!-- headerProductContainer end -->
		<!-- detailContainer -->
		<div class="detailContainer">
			<div class="detailNav">
				<ul class="detailNav-inner">
					<li>상품 상세</li>
					<li>배송/교환·환불 안내</li>
				</ul>
			</div>
			<!-- 상품 상세 -->
			<div class="detailImg">
				<img src="images/product_img/<%out.print(isDetailSuccess.get(0).getProduct_category());%>/<%out.print(isDetailSuccess.get(0).getProduct_img());%>">
			</div>
			<!-- 배송/교환·환불 안내 -->
			<div class="detailDelInfo">
				<h2 class="fs_18 fw_bold">배송/교환·환불 안내</h2>
				<div>
					<h3 class="fs_14 fw_bold mb_10">배송 안내</h3>
					<ul class="infoList">
						<li>전국 배송 가능합니다.</li>
						<li>입금 확인 후 2~4일 가량 소요되며, 지역별 택배업체 사정에 따라 약간의 차이가 있을 수 있습니다.</li>
						<li>연휴/공휴일 포함 주문 또는 일부 도서지역/사서함 배송 주문은 2~3일 가량 추가 소요될 수 있습니다.</li>
						<li>할인 적용 후 최종 결제금액 100,000원 이상 구매시 무료배송 됩니다.</li>
						<li>일부 상품의 경우, 구매수량 단위로 배송비가 부과될 수 있습니다.</li>
					</ul>
				</div>
				<div>
					<h3 class="fs_14 fw_bold mb_10">교환·환불 안내</h3>
					<ul class="infoList">
						<li>주문 내용을 변경하고 싶은 경우에는 상품 전체를 취소하고 새로 주문하셔야 합니다.</li>
						<li>단순 변심, 착오 구매에 따른 교환/반품은 상품을 공급받은 날부터 7일 이내에 가능합니다. (배송비 고객 부담)</li>
						<li>일부 제품의 경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환 및 반품이 불가능합니다.</li>
						<li>교환 및 반품 신청에는 사유에 따라 배송비 2,500~5,000원이 부과됩니다. 이 때 무료배송 혜택을 받은 주문일 경우 왕복 금액을, 배송비를 부담하신 경우 편도 금액을 산정하여 환불 금액에서 차감될 수 있습니다.</li>
					</ul>
				</div>
			</div>
		</div> <!-- detailContainer end -->
	</section> <!-- section end -->

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="../js/scroll.js"></script>
	<script type="text/javascript" src="../js/product_detail_selectbox.js"></script>	
	
</body>
</html>
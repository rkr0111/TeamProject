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
	<link rel="stylesheet" type="text/css" href="css/product_category_detail.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>상품 상세페이지</title>
</head>

<%
List<Product_dto> isDetailSuccess = (List<Product_dto>) request.getAttribute("isDetailSuccess");
int product_price = isDetailSuccess.get(0).getProduct_price();
String product_name = isDetailSuccess.get(0).getProduct_name();
String product_category = isDetailSuccess.get(0).getProduct_category();
String product_img = isDetailSuccess.get(0).getProduct_img();
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
			<form method="post" action="buyCustomerinfo.bo" name="form">
				<div class="productContainer">
					<img src="images/product_img/<%=product_category%>/<%=product_img%>">
				</div>
				<div class="productInfoContainer">
					<ul>
						<li class="fs_20 fw_bold"><%=product_name%></li>
						<li class="fs_14 mt_10 mb_25 textColor gray_9c9c9c"><%out.print(isDetailSuccess.get(0).getProduct_contents());%></li>
					</ul>
					<div class="productPrice">
						<span class="labelText">가격</span>
						<span class="fs_18"><%=product_price%>원</span>
					</div>
					<div class="colorSelectContents mt_20 pt_20">
						<span class="labelText">컬러</span>
						<select size="1" onchange="optionSelected()">
							<option>컬러 선택</option>
							<%
							String[] idx = isDetailSuccess.get(0).getProduct_color().split(",");
							for(int i=0; i<idx.length; i++) {
							%>
								<option name="color-<%=i%>"><%=idx[i]%></option>
							<%}%>
						</select>
					</div>
		
					<div class="totalChoiceContainer">
						<%for(int i=0; i<idx.length; i++) {%>
						<ul class="totalChoice" style="display: none;">
							<li><%=product_name%></li>
							<li class="product_color"><input type="text" name="product_colors" value="" readonly /></li>
							<li class="product_cnt">
								<ul class="amount">
									<li class="btn_minus" onclick="amountCountBtn(<%=i%>, 0)">-</li>
									<li><input type="number" name="showamount" value="0" readonly /></li>
									<li class="btn_plus" onclick="amountCountBtn(<%=i%>, 1)">+</li>
								</ul>
							</li>
							<li class="removeBtn" onclick="removeBtn(<%=i%>)"></li>
						</ul>
						<%}%>
					</div>
					<div class="totalPrice t_align_right fs_23 fw_bold textColor ff9d2d pt_20 mb_10">
						<input type="text" name="product_total" value="0" readonly class="textColor ff9d2d t_align_right fw_bold fs_23 NanumGothicRegular" />원
					</div>
					<div class="t_align_right fs_14 textColor gray_9c9c9c">100,000원 이상 구매시 무료배송</div>	
					
					
					<ul class="customerBtn mt_20">
						<%if(id == null) {%>
						<li class="mr_10"><input type="button" name="cart_btn" value="장바구니" onclick="location.href='pages_login/login_login.jsp';"></li>
						<li><input type="button" name="buy_btn" value="바로구매" onclick="location.href='pages_login/login_login.jsp';"></li>
						<%} else {%>
						<li class="mr_10"><input type="button" name="cart_btn" value="장바구니" /></li>
						<li>
							<!-- type="hidden" start -->
							<input type="hidden" name="product_name" value="<%=product_name%>" />
							<input type="hidden" name="product_price" value="<%=product_price%>" />
							<input type="hidden" name="product_category" value="<%=product_category%>" />
							<input type="hidden" name="product_img" value="<%=product_img%>" />
							<!-- type="hidden" end -->
							<input type="submit" name="buy_btn" value="바로구매" class="submit">
						</li>
						<%}%>
					</ul>
				</div>
			</form>
		</div> <!-- headerProductContainer end -->
		<!-- detailContainer -->
		<div class="detailContainer">
			<div class="detailNav">
				<ul class="detailNav-inner">
					<li onclick="detailNavClicked(0)">상품 상세</li>
					<li onclick="detailNavClicked(1)">배송/교환·환불 안내</li>
				</ul>
			</div>
			<!-- 상품 상세 -->
			<div class="detailImg">
				<img src="images/product_img/<%=product_category%>/<%=product_img%>">
				<%
				String[] imgidx = isDetailSuccess.get(0).getProduct_detailimg().split(",");
				for(int i=0; i<imgidx.length; i++) {
				if(!imgidx[i].equals("null")) {
				%>
				<img src="images/product_img/<%=isDetailSuccess.get(0).getProduct_category()%>/<%=imgidx[i]%>">
				<%}}%>
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
	<script type="text/javascript" src="js/scroll.js"></script>
	<script type="text/javascript" src="js/product_category_detail.js"></script>
	
	<script>
		var product_price = <%=product_price%>;
		var idx = <%=idx.length%>;
		var totalChoice = document.querySelectorAll(".totalChoice");
		var totalPrice = document.querySelector(".totalPrice");
		var showamount = document.querySelectorAll("input[name='showamount']");
		
		var colorSelect = document.querySelector(".colorSelectContents > select");
		var colorOpt = document.querySelectorAll(".colorSelectContents > select option[name^='color-']");
		var colorOptFirst = document.querySelectorAll(".colorSelectContents > select > option:first-of-type");
		var product_color = document.querySelectorAll(".product_color");

		var product_colors = document.querySelectorAll("input[name='product_colors']");
		var product_total = document.querySelector("input[name='product_total']");
		
		var cart_btn = document.querySelector("input[name='cart_btn']");
		
		// addComma
		function addComma(num) {
		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
		  return num.toString().replace(regexp, ',');
		}

		// amount count
		function amountCountBtn(obj, cnt) {
			if(cnt == 0) {
				if(showamount[obj].value > 0) (showamount[obj].value--)-1;
			}else if(cnt == 1) {
				(showamount[obj].value++)+1;
			}
			
			var results = 0;
			for(var i=0; i<totalChoice.length; i++) {
				results += product_price * showamount[i].value;
			}
			product_total.value = results;
		}
		
		// select option click event
		function optionSelected() {
			for(var i=0; i<colorOpt.length; i++) {
				if(colorOpt[i].selected && !colorOptFirst.selected) {
					totalChoice[i].style.display = "flex";
					totalChoice[i].classList.add("flex");
					product_colors[i].value = colorOpt[i].value;
				}
			}
		}

		// 장바구니
		cart_btn.addEventListener("click", function() {
			var param = "";
			var buy_colors = "";
			var buy_amounts = "";
			var i=0;
			var selected = document.querySelectorAll(".totalChoice.flex");
			for(i=0;i<selected.length;i++) {
				buy_colors += product_colors[i].value + ",";
				buy_amounts += showamount[i].value + ",";
			}
			param = "?buy_id=" + "<%=id%>"
					+ "&buy_name=" + "<%=product_name%>"
					+ "&buy_category=" + "<%=product_category%>"
					+ "&buy_img=" + "<%=product_img%>"
					+ "&buy_totalprice=" + product_total.value
					+ "&buy_price=" + <%=product_price%>
					+ "&buy_colors=" + buy_colors
					+ "&buy_amount=" + buy_amounts;
			location.href="cartInsert.bo"+param;
		});
	</script>
	
</body>
</html>
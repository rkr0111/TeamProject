<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="java.util.*"%>

<%
String product_color = request.getParameter("product_color");
System.out.println("product_color : " + product_color);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">
	<link rel="stylesheet" type="text/css" href="../css/product_buynow.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>주문 및 결제 페이지</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="../product_header_afterlogin.jsp" />

	<!-- section -->
	<section>
		<form method="post" action="">
			<!-- 주문내역 -->
			<div class="orderProductContainer">
				<h2>주문 내역</h2>
				<div class="orderProContents">
					<div class="orderProList">
						<div class="product_img"><img src="" /></div>
						<ul>
							<li class="product_name">product_name</li>
							<li>
								<span class="product_color mr_10">product_color</span>
								<span class="product_count mr_10">product_count</span>
								<span class="product_price">product_price</span>
							</li>
						</ul>
					</div>
					<div class="orderProList">
						<div class="product_img"><img src="" /></div>
						<ul>
							<li class="product_name">product_name</li>
							<li>
								<span class="product_color mr_10">product_color</span>
								<span class="product_count mr_10">product_count</span>
								<span class="product_price">product_price</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<!-- 배송지 정보 입력 -->
			<div class="orderInfoContainer">
				<h2>배송지 정보</h2>
				<div class="orderInfoContents">
					<table>
						<tr>
							<th>주문자명</th>
							<td><input type="text" name="order_name" readonly /></td>
						</tr>
						<tr>
							<th>핸드폰번호</th>
							<td><input type="text" name="order_phone" readonly /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="order_email" readonly /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="order_post" readonly /><br/>
								<input type="text" name="order_addr" readonly />
							</td>
						</tr>
						<tr>
							<th>배송메시지</th>
							<td><textarea name="order_message"></textarea></td>
						</tr>
					</table>
					<p>※ 배송 정보가 다를 경우 마이페이지에서 수정해주세요.</p>
				</div>
			</div>
			<!-- 결제 예정 금액 -->
			<div class="orderPriceContainer">
				<h2>결제 예정 금액</h2>
				<div class="orderResultPrice">
					<table>
						<tr>
							<th>총 주문 금액</th>
							<th>배송비</th>
							<th>총 결제예정 금액</th>
						</tr>
						<tr>
							<td>1212원</td>
							<td>2500원</td>
							<td>1212원</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="orderBtn"><input type="submit" name="submit" value="주문 및 결제" /></div>
		</form>
	</section> <!-- section end -->

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="../js/scroll.js"></script>	
</body>
</html>
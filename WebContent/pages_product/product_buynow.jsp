<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="com.TeamPro.dto.CustomerInfo_dto"%>
<%@page import="java.util.*"%>

<%
List<Buyhistory_dto> buyList = (List<Buyhistory_dto>)request.getAttribute("buyList");
List<CustomerInfo_dto> customerList = (List<CustomerInfo_dto>)request.getAttribute("customerList");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/product_buynow.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>주문 및 결제 페이지</title>
</head>
<script type="text/javascript">
	function doNotReload(){
	    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
	        event.keyCode = 0;
	        event.cancelBubble = true;
	        event.returnValue = false;
	    } 
	}
	document.onkeydown = doNotReload;
</script>

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
					<%for(int i=0; i<buyList.size(); i++) {%>
					<div class="orderProList">
						<div class="product_img"><img src="images/product_img/<%=buyList.get(i).getBuy_category()%>/<%=buyList.get(i).getBuy_img()%>" /></div>
						<ul>
							<li class="product_name"><%=buyList.get(i).getBuy_name()%></li>
							<li>
								<span class="product_color mr_10"><%=buyList.get(i).getBuy_colors()%></span>
								<span class="product_count mr_10"><%=buyList.get(i).getBuy_amount()%></span>
								<span class="product_price"><%=buyList.get(i).getBuy_price()%></span>
							</li>
						</ul>
					</div>
					<%}%>
				</div>
			</div>
			
			<!-- 배송지 정보 입력 -->
			<div class="orderInfoContainer">
				<h2>배송지 정보</h2>
				<div class="orderInfoContents">
					<table>
						<tr>
							<th>주문자명</th>
							<td><input type="text" name="order_name" value="<%=customerList.get(0).getCustomer_name()%>" readonly /></td>
						</tr>
						<tr>
							<th>핸드폰번호</th>
							<td><input type="text" name="order_phone" value="<%=customerList.get(0).getCustomer_phone()%>" readonly /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="order_email" value="<%=customerList.get(0).getCustomer_email()%>" readonly /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="order_post" value="<%=customerList.get(0).getCustomer_post()%>" readonly /><br/>
								<input type="text" name="order_addr" value="<%=customerList.get(0).getCustomer_addr()%>" readonly />
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
							<td>
								<%int total = 0;
								for(int i=0; i<buyList.size(); i++) {
									total = buyList.get(i).getBuy_price() * buyList.get(i).getBuy_amount();
								}%>
								<%=total%>원
							</td>
							<td>2500원</td>
							<td>
								<%=total + 2500%>원
							</td>
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
	<script type="text/javascript" src="js/scroll.js"></script>	
</body>
</html>
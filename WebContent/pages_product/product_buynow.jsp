<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="com.TeamPro.dto.CustomerInfo_dto"%>
<%@page import="java.util.*"%>

<%

List<CustomerInfo_dto> customerinfoList = (List<CustomerInfo_dto>)request.getAttribute("customerinfoList");

String[] product_colors = request.getParameterValues("product_colors");
String[] showamount = request.getParameterValues("showamount");

String product_name = request.getParameter("product_name");
int product_price = Integer.parseInt(request.getParameter("product_price"));
String product_category = request.getParameter("product_category");
String product_img = request.getParameter("product_img");
int product_total = Integer.parseInt(request.getParameter("product_total"));

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

<body>
	<!-- header -->
	<jsp:include page="../product_header_afterlogin.jsp" />

	<!-- section -->
	<section>
		<form method="post" action="buyHistoryInsert.bo?buy_category=<%=product_category%>&buy_img=<%=product_img%>">
			<!-- 주문내역 -->
			<div class="orderProductContainer">
				<h2>주문 내역</h2>
				<div class="orderProContents">
					<%for(int i=0; i<product_colors.length; i++) {
					if(product_colors[i] != "" && Integer.parseInt(showamount[i]) != 0) {%>
					<div class="orderProList">
						<div class="product_img"><img src="images/product_img/<%=product_category%>/<%=product_img%>" /></div>
						<ul>
							<li class="product_name"><input type="text" name="product_name" class="borderNone" style="width:150px;" value="<%=product_name%>" readonly /></li>
							<li>
								<span class="product_color mr_10"><input type="text" name="product_color" class="borderNone t_align_left" style="width:45px;" value="<%=product_colors[i]%>" readonly /></span>
								<span class="product_count mr_10"><input type="text" name="product_count" class="borderNone t_align_center" style="width:30px;" value="<%=showamount[i]%>" readonly />개</span>
								<span class="product_price"><input type="text" name="product_price" class="borderNone t_align_right" style="width:50px;" value="<%=product_price * Integer.parseInt(showamount[i])%>" readonly />원</span>
							</li>
						</ul>
					</div>
					<%}}%>
				</div>
			</div>
			
			<!-- 배송지 정보 입력 -->
			<div class="orderInfoContainer">
				<h2>배송지 정보</h2>
				<div class="orderInfoContents">
					<table>
						<tr>
							<th>주문자명</th>
							<td><input type="text" name="order_name" value="<%=customerinfoList.get(0).getCustomer_name()%>" readonly /></td>
						</tr>
						<tr>
							<th>핸드폰번호</th>
							<td><input type="text" name="order_phone" value="<%=customerinfoList.get(0).getCustomer_phone()%>" readonly /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="order_email" value="<%=customerinfoList.get(0).getCustomer_email()%>" readonly /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="order_post" value="<%=customerinfoList.get(0).getCustomer_post()%>" readonly /><br/>
								<input type="text" name="order_addr" value="<%=customerinfoList.get(0).getCustomer_addr()%>" readonly />
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
								for(int i=0; i<showamount.length; i++) {
									if(Integer.parseInt(showamount[i]) != 0) {
										total += product_price * Integer.parseInt(showamount[i]);
									}
								}%>
								<%=total%>원
							</td>
							<td>
								<%int shippingfee = 0;
								if(total < 100000) {
									shippingfee = 2500;
								}else {
									shippingfee = 0;
								}%>
								<%=shippingfee%>원
							</td>
							<td>
								<%=total + shippingfee%>원
								<input type="hidden" name="product_total" value="<%=total + shippingfee%>" />
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
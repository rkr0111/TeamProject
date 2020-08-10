<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

<%
	//orderList 클래스에 들어갈 정보
	/* Buyhistory_dto buy_dto = new Buyhistory_dto();	
	Product_dto pro_dto = new Product_dto(); */
	
	ArrayList<Buyhistory_dto> buyhistoryList = (ArrayList<Buyhistory_dto>) request.getAttribute("buyhistoryList");
	ArrayList<Product_dto> shoppingList = (ArrayList<Product_dto>) request.getAttribute("shoppingList");
	ArrayList<Buyhistory_dto> reviewList = (ArrayList<Buyhistory_dto>) request.getAttribute("reviewList");
	ArrayList<Buyhistory_dto> asList = (ArrayList<Buyhistory_dto>) request.getAttribute("asList");
	
	//
	List<Product_dto> productList = (List<Product_dto>) request.getAttribute("productList");
	
	//
	String mypageCategory = request.getParameter("mypageCategory");
%>

	<div class="contentsTitle">
		<ul>
			<li><%out.print(mypageCategory); %></li>
			<li>
				<select name="selectMonth" size="1">
					<option name="selectAll">전체 기간</option>
					<option name="selectOneMonth">1개월</option>
					<option name="selectThreeMonth">3개월</option>
					<option name="selectSixthMonth">6개월</option>
				</select>
			</li>
		</ul>
	</div>

<!-- buyhistory -->	
	<% if(mypageCategory.equals("구매내역")) { %>
	<div class="contentsOrder">
		<% if(buyhistoryList != null) { 
			for(int i=0; i<buyhistoryList.size(); i++) { %>			
		<div class="orderList">
			<p><%out.print(buyhistoryList.get(i).getBuy_date());%></p>
			<ul class="order">
				<li> 
					<div><%out.print(buyhistoryList.get(i).getBuy_name());%></div>
					<ul class="addEtc">
						<li>리뷰하기</li>
						<li>문의하기</li>
					</ul>
				</li>
				<li>
					<div class="orderImgBox"><img src="../images/mypage_img/order_img/point01_03.jpg"></div>
					<ul class="orderInfo">
						<li>
							<p>주문 번호</p>
							<p>111111</p> 
						</li>
						<li>
							<p>결제 금액</p> 
							<p><%out.print(buyhistoryList.get(i).getBuy_price());%></p>
						</li>
						<li>
							<p>주문 상태</p> 
							<p><%out.print(buyhistoryList.get(i).getBuy_condition());%></p>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<%}}else {%>
			<p>구매하신 내역이 없습니다.</p>
		<%}%>			
	</div>
	<%}else if(mypageCategory.equals("장바구니")) { %>
		<div class="contentsOrder">
		<% if(shoppingList != null) { 
			for(int i=0; i<shoppingList.size(); i++) { %>			
		<div class="orderList">
			<p><%out.print(shoppingList.get(i).getBuy_date());%></p>
			<ul class="order">
				<li> 
					<div><%out.print(shoppingList.get(i).getBuy_name());%></div>
					<ul class="addEtc">
						<li>리뷰하기</li>
						<li>문의하기</li>
					</ul>
				</li>
				<li>
					<div class="orderImgBox"><img src="../images/mypage_img/order_img/point01_03.jpg"></div>
					<ul class="orderInfo">
						<li>
							<p>주문 번호</p>
							<p>111111</p> 
						</li>
						<li>
							<p>결제 금액</p> 
							<p><%out.print(shoppingList.get(i).getBuy_price());%></p>
						</li>
						<li>
							<p>주문 상태</p> 
							<p><%out.print(shoppingList.get(i).getBuy_condition());%></p>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<%}}else {%>
			<p>장바구니에 담은 상품이 없습니다.</p>
		<%}%>			
	</div>
	<%}%>
	
	
	
<!-- review -->
	<%-- <div class="contentsOrder">
		<% 
		if(shoppingList != null) { 
			for(int i=0; i<shoppingList.size(); i++) { 
		%>			
		<div class="orderList">
			<p><%out.print(shoppingList.get(i).getBuy_date());%></p>
			<ul class="order">
				<li> 
					<div><%out.print(shoppingList.get(i).getBuy_name());%></div>
					<ul class="addEtc">
						<li>리뷰하기</li>
						<li>문의하기</li>
					</ul>
				</li>
				<li>
					<div class="orderImgBox"><img src="../images/mypage_img/order_img/point01_03.jpg"></div>
					<ul class="orderInfo">
						<li>
							<p>주문 번호</p>
							<p>111111</p> 
						</li>
						<li>
							<p>결제 금액</p> 
							<p><%out.print(shoppingList.get(i).getBuy_price());%></p>
						</li>
						<li>
							<p>주문 상태</p> 
							<p><%out.print(shoppingList.get(i).getBuy_condition());%></p>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<%}}else if(shoppingList==null) {%>
			<p>장바구니에 담긴 상품이 없습니다.</p>
		<%}%>			
	</div> --%>
	
	
</body>
</html>
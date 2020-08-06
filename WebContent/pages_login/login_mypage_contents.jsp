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
	Buyhistory_dto dto = new Buyhistory_dto();	
	ArrayList<Buyhistory_dto> buyhistoryList = (ArrayList<Buyhistory_dto>) request.getAttribute("buyhistoryList");
	
	//
	List<Product_dto> productList = (List<Product_dto>) request.getAttribute("productList");
%>

	<div class="contentsTitle">
		<ul>
			<li>구매 내역</li>
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

	<div class="contentsOrder">
		<% 
		if(buyhistoryList != null) { 
			for(int i=0; i<buyhistoryList.size(); i++) { 
		%>							
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
		<%}}%>				
	</div>
	
	
	
	<%-- <div class="contentsTitle">
		<ul>
			<li>구매 내역</li>
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

	<div class="contentsOrder">
		<% 
		if(buyhistoryList != null) { 
			for(int i=0; i<buyhistoryList.size(); i++) { 
		%>							
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
		<%}}%>				
	</div> --%>
</body>
</html>
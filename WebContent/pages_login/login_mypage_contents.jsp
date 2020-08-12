<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="com.TeamPro.dto.Shopping_dto"%>
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
	ArrayList<Buyhistory_dto> reviewList = (ArrayList<Buyhistory_dto>) request.getAttribute("reviewList");
	ArrayList<Shopping_dto> shoppingList = (ArrayList<Shopping_dto>) request.getAttribute("shoppingList");
	ArrayList<Buyhistory_dto> asList = (ArrayList<Buyhistory_dto>) request.getAttribute("asList");
	
	//List<Product_dto> productList = (List<Product_dto>) request.getAttribute("productList");
	
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
	<%if(mypageCategory.equals("구매내역")) { %>
	<div class="contentsOrder">
		<%if(buyhistoryList != null) { 
			for(int i=0; i<buyhistoryList.size(); i++) {%>			
		<div class="orderList">
			<p><%out.print(buyhistoryList.get(i).getBuy_date());%></p>
			<ul class="order">
				<li> 
					<div><%out.print(buyhistoryList.get(i).getBuy_name());%></div>
					<ul class="addEtc">
						<li>리뷰 작성하기</li>
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
			<p>구매하신 내역이 없습니다.</p><%
		}%>			
	</div>
	
<!-- review -->
	<%}else if(mypageCategory.equals("작성한 리뷰")) { %>
	<div class="contentsOrder">
		<%if(reviewList != null) { 
			for(int i=0; i<reviewList.size(); i++) {%>		
		<div class="orderList">
			<p><%out.print(reviewList.get(i).getBuy_date());%></p>
			<ul class="order">
				<li> 
					<div><%out.print(reviewList.get(i).getBuy_name());%></div>
				</li>
				<li>
					<div class="orderImgBox"><img src="../images/mypage_img/order_img/point01_03.jpg"></div>
					<ul class="reviewContain">
						<li>
							조만간 리뷰를 작성해서 내용을 갖고 오도록 하겠습니다. 내용은 jsp로 get해서 갖고 올겁니다. comming soon
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<%}}else {%>
			<p>작성하신 리뷰가 없습니다.</p><%
		}%>			
	</div>
	
<!-- shopping -->		
	<%}else if(mypageCategory.equals("장바구니")) { %>
	<div class="contentsOrder">
		<% if(shoppingList != null) { 
			for(int i=0; i<shoppingList.size(); i++) { %>			
		<div class="orderList">
			<%-- 전체 선택, 선택 삭제 등 checkbox 만들기--%>
			<ul class="order">
				<li> 
					<div>
						<input type="checkbox" name="shoppingcheck" value="shoppingcheck">&nbsp;<%out.print(shoppingList.get(i).getShopping_name());%>
					</div>
				</li>
				<li>
					<div class="orderImgBox"><img src="../images/mypage_img/order_img/point01_03.jpg"></div>
					<ul class="shoppingInfo">
						<li>
							<ul><%out.print(shoppingList.get(i).getShopping_price());%> 원</ul>
							<ul class="amount">
								<li class="btn_minus" onclick="amountCountBtn(<%=i%>, 0)">-</li>
								<li><input type="number" name="showamount" value="0" readonly /></li>
								<li class="btn_plus" onclick="amountCountBtn(<%=i%>, 1)">+</li>
							</ul>
						</li>
						<li class="shoppingBtn">	
							<ul>
								<li class="mr_10"><input type="button" name="shoppingDetail" value="상세보기" onclick="shoppingDetail();"></li>
							</ul>
						</li>
						<li>
							<ul>
								<li class="mr_10"><input type="button" name="shoppingOrder" value="구매하기" onclick="shoppingOrder();"></li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<%}}else {%>
			<p>장바구니에 담은 상품이 없습니다.</p>
		<%}%>			
	</div>
	
<!-- as -->
	<%}else if(mypageCategory.equals("A/S 문의")) { %>
	<div class="contentsOrder">
		<% if(asList != null) { 
			for(int i=0; i<asList.size(); i++) { %>			
		<div class="orderList">
			<ul class="order">
				<li> 
					<div>
						<p><%out.print(asList.get(i).getBuy_name());%></p>
					</div>
				</li>
				<li>
					<div class="orderImgBox"><img src="../images/mypage_img/order_img/point01_03.jpg"></div>
					<ul class="shoppingInfo">
						<li>
							<ul></ul>
							<ul><%out.print(asList.get(i).getBefore_buyDate());%></ul>
						</li>
						<li class="shoppingBtn">	
							<ul>
								<li class="mr_10"><input type="button" name="asApply" value="asApply" onclick="asApply();"></li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<%}}else {%>
			<p>A/S 문의 내역이 없습니다.</p>
		<%}%>			
	</div>
	<%}%>
</body>
</html>
		
			<%-- <p><%out.print(asList.get(i).getBuy_date());%></p>
			<ul class="order">
				<li> 
					<div><%out.print(asList.get(i).getBuy_name());%></div>
					<ul class="addEtc">
						<li>리뷰하기</li>
						<li>문의하기</li>
					</ul>
				</li>
				<li>
					<div class="orderImgBox"><img src="../images/mypage_img/order_img/point01_03.jpg"></div>
					<ul class="orderInfo">
						<li>
							<p>결제 금액</p> 
							<p><%out.print(asList.get(i).getBuy_date());%></p>
						</li>
						<li>
							<p>주문 상태</p> 
							<p><%out.print(asList.get(i).getBefore_buyDate());%></p>
						</li>
					</ul>
				</li>
			</ul>
		</div> --%>
		
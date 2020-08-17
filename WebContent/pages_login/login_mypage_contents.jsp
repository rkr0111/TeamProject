<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="com.TeamPro.dto.Cart_dto"%>
<%@page import="com.TeamPro.dto.Interior_dto"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<title></title>
</head>
<body>

<%
	ArrayList<Buyhistory_dto> buyhistoryList = (ArrayList<Buyhistory_dto>) request.getAttribute("buyhistoryList");
	ArrayList<Interior_dto> reviewList = (ArrayList<Interior_dto>) request.getAttribute("reviewList");
	ArrayList<Cart_dto> cartList = (ArrayList<Cart_dto>) request.getAttribute("cartList");
	ArrayList<Buyhistory_dto> asList = (ArrayList<Buyhistory_dto>) request.getAttribute("asList");

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
	<div class="mypageAsideTitle">
		<h3>마이페이지</h3>
		<aside class="mypageAside">
			<ul>
				<li id="orderHistory" class="bg">						
					<a href="DB_mypage_buyhistory.jsp">구매내역
						<p>&gt;</p>
					</a>
				</li>
				<li id="review">
					<a href="DB_mypage_review.jsp">작성한 리뷰
						<p>&gt;</p>
					</a>
				</li>
				<li id="cart">
					<a href="DB_mypage_cart.jsp">장바구니
						<p>&gt;</p>
					</a>
				</li>
				<li id="question">
					<a href="">1:1 문의
						<p>&gt;</p>
					</a>
				</li>
				<li id="as">
					<a href="DB_mypage_as.jsp">A/S 문의
						<p>&gt;</p>
					</a>
				</li>
			</ul>
		</aside>
	</div>
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
	<div class="mypageAsideTitle">
		<h3>마이페이지</h3>
		<aside class="mypageAside">
			<ul>
				<li id="orderHistory">						
					<a href="DB_mypage_buyhistory.jsp">구매내역
						<p>&gt;</p>
					</a>
				</li>
				<li id="review" class="bg">
					<a href="DB_mypage_review.jsp">작성한 리뷰
						<p>&gt;</p>
					</a>
				</li>
				<li id="cart">
					<a href="DB_mypage_cart.jsp">장바구니
						<p>&gt;</p>
					</a>
				</li>
				<li id="question">
					<a href="">1:1 문의
						<p>&gt;</p>
					</a>
				</li>
				<li id="as">
					<a href="DB_mypage_as.jsp">A/S 문의
						<p>&gt;</p>
					</a>
				</li>
			</ul>
		</aside>
	</div>
	<div class="contentsOrder">
		<%if(reviewList != null) { 
			for(int i=0; i<reviewList.size(); i++) {%>		
		<div class="orderList">
			<p><%out.print(reviewList.get(i).getInterior_date());%></p>
			<ul class="order">
				<li> 
					<div><%out.print(reviewList.get(i).getInterior_name());%></div>
				</li>
				<li>
					<div class="orderImgBox">
						<img src="../images/product_img/<%out.print(reviewList.get(i).getInterior_category()); %>/<%out.print(reviewList.get(i).getInterior_img());%>">
					</div>
					<ul class="reviewContain">
						<li>
							<%out.print(reviewList.get(i).getInterior_contents());%>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<%}}else {%>
			<p>작성하신 리뷰가 없습니다.</p><%
		}%>			
	</div>
	
<!-- cart -->		
	<%}else if(mypageCategory.equals("장바구니")) { %>
	<div class="mypageAsideTitle">
		<h3>마이페이지</h3>
		<aside class="mypageAside">
			<ul>
				<li id="orderHistory">						
					<a href="DB_mypage_buyhistory.jsp">구매내역
						<p>&gt;</p>
					</a>
				</li>
				<li id="review">
					<a href="DB_mypage_review.jsp">작성한 리뷰
						<p>&gt;</p>
					</a>
				</li>
				<li id="cart" class="bg">
					<a href="DB_mypage_cart.jsp">장바구니
						<p>&gt;</p>
					</a>
				</li>
				<li id="question">
					<a href="">1:1 문의
						<p>&gt;</p>
					</a>
				</li>
				<li id="as">
					<a href="DB_mypage_as.jsp">A/S 문의
						<p>&gt;</p>
					</a>
				</li>
			</ul>
		</aside>
	</div>
	<div class="contentsOrder">
		<div class="allCheckbox">
			<ul>
				<li><input type="checkbox" name="cartAllCheck">&nbsp;전체선택</li>
				<li><input type="checkbox" name="cartAllOrder">&nbsp;전체구매</li>
			</ul>
		</div>
		<% if(cartList != null) { 
			for(int i=0; i<cartList.size(); i++) { %>			
		<div class="cartList">
			<ul class="cart">
				<li> 
					<div>
						<input type="checkbox" name="cartcheck">&nbsp;<%out.print(cartList.get(i).getCart_name());%>
					</div>
				</li>
				<li>
					<div class="orderImgBox"><img src="../images/mypage_img/order_img/point01_03.jpg"></div>
					<ul class="cartInfo">
						<li>
							<ul><%out.print(cartList.get(i).getCart_price());%> 원</ul>
							<ul class="amount">
								<li class="btn_minus" onclick="amountCountBtn(<%=i%>, 0)">-</li>
								<li><input type="number" name="showamount" value="0" readonly /></li>
								<li class="btn_plus" onclick="amountCountBtn(<%=i%>, 1)">+</li>
							</ul>
						</li>
						<li class="cartBtnDetail">	
							<ul>
								<li><input type="button" name="cartDetail" value="상세보기" onclick="cartDetail();"></li>
							</ul>
						</li>
						<li class="cartBtnOrder">
							<ul>
								<li><input type="button" name="cartOrder" value="구매하기" onclick="cartOrder();"></li>
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
	<div class="mypageAsideTitle">
		<h3>마이페이지</h3>
		<aside class="mypageAside">
			<ul>
				<li id="orderHistory">						
					<a href="DB_mypage_buyhistory.jsp">구매내역
						<p>&gt;</p>
					</a>
				</li>
				<li id="review">
					<a href="DB_mypage_review.jsp">작성한 리뷰
						<p>&gt;</p>
					</a>
				</li>
				<li id="cart">
					<a href="DB_mypage_cart.jsp">장바구니
						<p>&gt;</p>
					</a>
				</li>
				<li id="question">
					<a href="">1:1 문의
						<p>&gt;</p>
					</a>
				</li>
				<li id="as" class="bg">
					<a href="DB_mypage_as.jsp">A/S 문의
						<p>&gt;</p>
					</a>
				</li>
			</ul>
		</aside>
	</div>
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
					<ul class="asInfo">
						<li>
							<p>구매 날짜</p>
							<p><%out.print(asList.get(i).getBuy_date());%></p>
						</li>					
						<li>
							<p>A/S 가능 기간</p>
							<p><%out.print(asList.get(i).getBefore_buyDate());%></p>
						</li>
						<li class="asBtn">	
							<ul>
								<li><input type="button" name="asApply" value="A/S 신청하기" onclick="asApply();"></li>
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
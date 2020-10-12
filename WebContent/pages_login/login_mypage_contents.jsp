<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="com.TeamPro.dto.Cart_dto"%>
<%@page import="com.TeamPro.dto.Ashistory_dto"%>
<%@page import="com.TeamPro.dto.CustomerInfo_dto"%>
<%@page import="java.util.*"%>
<!-- 
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title></title>	
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">
	<link rel="stylesheet" type="text/css" href="../css/login_mypage.css">

	jQuery cdn
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title></title>

</head> -->
<body>

<%
	String id = (String)session.getAttribute("id");
	ArrayList<Buyhistory_dto> buyhistoryList = (ArrayList<Buyhistory_dto>) request.getAttribute("buyhistoryList");
	ArrayList<Buyhistory_dto> reviewList = (ArrayList<Buyhistory_dto>) request.getAttribute("reviewList");
	ArrayList<Cart_dto> cartList = (ArrayList<Cart_dto>) request.getAttribute("cartList");
	ArrayList<Buyhistory_dto> asBeforeList = (ArrayList<Buyhistory_dto>) request.getAttribute("asBeforeList");
	ArrayList<Ashistory_dto> asHistoryList = (ArrayList<Ashistory_dto>) request.getAttribute("asHistoryList");
	ArrayList<CustomerInfo_dto> idList = (ArrayList<CustomerInfo_dto>) request.getAttribute("idList");

	String mypageCategory = request.getParameter("mypageCategory");
	
	String cart_name = null;
	String cart_category = null;
	String cart_img = null;
	String cart_color = null;
%>

	<div class="contentsTitle">
		<ul>
			<li><%out.print(mypageCategory); %></li>
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
					<a href="DB_mypage_review.jsp">리뷰작성
						<p>&gt;</p>
					</a>
				</li>
				<li id="cart">
					<a href="DB_mypage_cart.jsp">장바구니
						<p>&gt;</p>
					</a>
				</li>
				<li id="asApply">
					<a href="DB_mypage_applyAsBefore.jsp">A/S 문의하기
						<p>&gt;</p>
					</a>
				</li>
				<li id="asHistory">
					<a href="DB_mypage_asHistory.jsp">A/S 문의내역
						<p>&gt;</p>
					</a>
				</li>
				<li id="memberInfo">
					<a href="DB_mypage_IdPwd.jsp">개인정보수정
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
			<p><%=buyhistoryList.get(i).getBuy_date()%></p>
			<ul class="order">
				<li>
					<div><%=buyhistoryList.get(i).getBuy_name()%></div>
					<ul class="addEtc">
						<a href="DB_mypage_review.jsp"><li>리뷰작성</li></a>
						<a href=""><li>문의하기</li></a>
					</ul>
				</li>
				<li>
					<div class="orderImgBox"><img src="../images/product_img/<%=buyhistoryList.get(i).getBuy_category()%>/<%=buyhistoryList.get(i).getBuy_img()%>"></div>
					<ul class="orderInfo">
						<li>
							<p>주문 번호</p>
							<p><%=buyhistoryList.get(i).getBuy_num()%></p> 
						</li>
						<li>
							<p>결제 금액</p> 
							<p><%=buyhistoryList.get(i).getBuy_price()%></p>
						</li>
						<li>
							<p>주문 상태</p> 
							<p><%=buyhistoryList.get(i).getBuy_condition()%></p>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<%}}else {%>
			<p>구매하신 내역이 없습니다.</p>
		<%}%>			
	</div>
	
<!-- review -->
	<%}else if(mypageCategory.equals("리뷰작성")) { %>
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
					<a href="DB_mypage_review.jsp">리뷰작성
						<p>&gt;</p>
					</a>
				</li>
				<li id="cart">
					<a href="DB_mypage_cart.jsp">장바구니
						<p>&gt;</p>
					</a>
				</li>
				<li id="asApply">
					<a href="DB_mypage_applyAsBefore.jsp">A/S 문의하기
						<p>&gt;</p>
					</a>
				</li>
				<li id="asHistory">
					<a href="DB_mypage_asHistory.jsp">A/S 문의내역
						<p>&gt;</p>
					</a>
				</li>
				<li id="memberInfo">
					<a href="DB_mypage_IdPwd.jsp">개인정보수정
						<p>&gt;</p>
					</a>
				</li>
			</ul>
		</aside>
	</div>
	<div class="contentsOrder">
		<%if(reviewList != null) { %>
		<div class="checkReview">
			<h1><span class="round"></span>리뷰 작성 전 확인사항</h1>
			<ul>
				<li class="number">1. 리뷰 작성을 하시면 Interior 메뉴에 자동으로 업로드됩니다.</li>
				<li class="innerNumber">- 다른 고객분들과 의사소통이 가능합니다.</li>
				<li class="number">2. 작성하신 리뷰의 삭제는 불가능합니다.</li>
				<li class="number">3. 작성하신 리뷰의 삭제는 고객센터로 문의주십시오.</li>
			</ul>
		</div>

		<div class="applyReview">
			<h1><span class="round"></span>리뷰 게시글 작성</h1>
			<form action="../reviewContentsInsert.bo" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th>제품 이름</th>
						<td>
							<select name="applyReview_findName">
								<option name="applyReview_product">제품을 선택해주세요.</option>
								<%for(int i=0; i<reviewList.size(); i++) {%>
								<option name="review_name" value="<%out.print(reviewList.get(i).getBuy_name());%>"><%out.print(reviewList.get(i).getBuy_name()); }%></option>
							</select>
						</td>
					</tr>
					<tr>
						<th>사진 업로드</th>
						<td><input type="file" name="review_img"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="review_contents" rows="5" cols="50" style="resize: none;" required></textarea></td>
					</tr>
				</table>

				<%for(int i=0; i<reviewList.size(); i++) {%>
				<input type="hidden" name="review_img" value="<%=reviewList.get(i).getBuy_img()%>" />
				<%} %>
				<input class="applyReview_btn" type="submit" name="applyReview_btn" value="올리기">
			</form>
		</div>
		<%} else {%>
			<p>구매내역이 없어서 리뷰를 작성하실 수 없습니다.</p><%
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
					<a href="DB_mypage_review.jsp">리뷰작성
						<p>&gt;</p>
					</a>
				</li>
				<li id="cart" class="bg">
					<a href="DB_mypage_cart.jsp">장바구니
						<p>&gt;</p>
					</a>
				</li>
				<li id="asApply">
					<a href="DB_mypage_applyAsBefore.jsp">A/S 문의하기
						<p>&gt;</p>
					</a>
				</li>
				<li id="asHistory">
					<a href="DB_mypage_asHistory.jsp">A/S 문의내역
						<p>&gt;</p>
					</a>
				</li>
				<li id="memberInfo">
					<a href="DB_mypage_IdPwd.jsp">개인정보수정
						<p>&gt;</p>
					</a>
				</li>
			</ul>
		</aside>
	</div>
	<div class="contentsOrder">
		<div class="allCheckbox">
			<ul>
				<li><input type="checkbox" name="allcartCheck" onclick="checkAll()">&nbsp;전체 선택</li>
				<li><input type="checkbox" name="removeAllcartCheck" onclick="removecheckAll()">&nbsp;선택 해제</li>
			</ul>
		</div>
		<% if(cartList != null) { 
			for(int i=0; i<cartList.size(); i++) { 
			cart_name = cartList.get(i).getCart_name();
			cart_category = cartList.get(i).getCart_category();
			cart_img = cartList.get(i).getCart_img();
			cart_color = cartList.get(i).getCart_colors();%>
		<div class="cartList">
			<ul class="cart">
				<li> 
					<div>
						<input type="checkbox" name="cartcheck" value="<%=cart_name%>" onclick="checkSingle(<%=i%>)">
						<span class="cartName"><%=cart_name%></span>
					</div>
				</li>
				<li>
					<div class="orderImgBox">
						<img src="../images/product_img/<%=cart_category%>/<%=cart_img%>">
						<input type="hidden" name="cart_category" value="<%=cart_category%>" />
						<input type="hidden" name="cart_img" value="<%=cart_img%>" />
						<input type="hidden" name="cart_color" value="<%=cart_color%>" />
					</div>
					<ul class="cartInfo">
						<li>
							<ul>
								<span class="cart_price"><%=cartList.get(i).getCart_price()%></span>원
								<input type="hidden" name="cart_price" value="<%=cartList.get(i).getCart_price()%>" />
							</ul>
							<ul class="amount">
								<li class="btn_minus" onclick="amountCountBtn(<%=i%>, 0)">-</li>
								<li><input type="number" name="showamount" value="<%=cartList.get(i).getCart_count()%>" readonly ></li>
								<li class="btn_plus" onclick="amountCountBtn(<%=i%>, 1)">+</li>
							</ul>
						</li>
						<li class="cartBtnDetail">	
							<ul>
								<li><input type="button" name="cartDetail" value="상세보기" onclick="cartBtnDetail('<%=cart_name%>')" />	</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<%}%>
		<div class="cartBtnContents">
			<ul class="cartBtn">
				<li><input class="cartDelete_btn" type="button" name="cartDelete_btn" value="선택제품 삭제하기" onclick="cartDelete_btn()" /></li>
				<li><input class="cartOrder_btn" type="button" name="cartOrder_btn" value="선택제품 구매하기" onclick="cartOrder_btn()" /></li>
			</ul>
		</div>
		<%}else {%>
			<p>장바구니에 담은 상품이 없습니다.</p>
		<%}%>			
	</div>
	
<!-- A/S 문의하기 -->
	<%}else if(mypageCategory.equals("A/S 문의하기")) { %>
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
					<a href="DB_mypage_review.jsp">리뷰작성
						<p>&gt;</p>
					</a>
				</li>
				<li id="cart">
					<a href="DB_mypage_cart.jsp">장바구니
						<p>&gt;</p>
					</a>
				</li>
				<li id="asApply" class="bg"> 
					<a href="DB_mypage_applyAsBefore.jsp">A/S 문의하기
						<p>&gt;</p>
					</a>
				</li>
				<li id="asHistory">
					<a href="DB_mypage_asHistory.jsp">A/S 문의내역
						<p>&gt;</p>
					</a>
				</li>
				<li id="memberInfo">
					<a href="DB_mypage_IdPwd.jsp">개인정보수정
						<p>&gt;</p>
					</a>
				</li>
			</ul>
		</aside>
	</div>
	<div class="contentsOrder">
		<%if(asBeforeList != null) { %>
			<jsp:include page="login_mypage_applyAS.jsp" />
		<%} else {%>
			구매내역이 없으시므로 A/S 신청을 하실 수 없습니다.
		<%}%>			
	</div>
		
<!-- A/S 문의내역 -->
	<%}else if(mypageCategory.equals("A/S 문의내역")) { %>
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
					<a href="DB_mypage_review.jsp">리뷰작성
						<p>&gt;</p>
					</a>
				</li>
				<li id="cart">
					<a href="DB_mypage_cart.jsp">장바구니
						<p>&gt;</p>
					</a>
				</li>
				<li id="asApply">
					<a href="DB_mypage_applyAsBefore.jsp">A/S 문의하기
						<p>&gt;</p>
					</a>
				</li>
				<li id="asHistory" class="bg">
					<a href="DB_mypage_asHistory.jsp">A/S 문의내역
						<p>&gt;</p>
					</a>
				</li>
				<li id="memberInfo">
					<a href="DB_mypage_IdPwd.jsp">개인정보수정
						<p>&gt;</p>
					</a>
				</li>
			</ul>
		</aside>
	</div>
	<div class="contentsOrder">
	<% if(asHistoryList != null) { %>	
		<div class="contentsAS">
			<table>
				<tr>    
					<th>번호</th>
					<th>신청제목</th>
					<th>신청일</th>
					<th>처리결과</th>
				</tr>
				<% for(int i=0; i<asHistoryList.size(); i++) { %>	
				<tr>
					<td><%out.println(asHistoryList.get(i).getAs_id());%></td>
					<td><%out.println(asHistoryList.get(i).getAs_subject()); %></td>
					<td><%out.println(asHistoryList.get(i).getAs_date()); %></td>
					<td><%out.println(asHistoryList.get(i).getAs_condition()); %></td>
				</tr> 
				<%} %>
			</table> 
		<!-- 	<div class="asWrite">
				<input class="asWrite_btn" type="button" name="asWrite_btn" value="글쓰기" >
			</div> -->
		</div>
		<%} else {%>
			<p>A/S 문의 내역이 없습니다.</p>
		<%} %>
	</div>
	
<!-- 개인정보수정 -->
	<%}else if(mypageCategory.equals("개인정보수정")) { %>
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
					<a href="DB_mypage_review.jsp">리뷰작성
						<p>&gt;</p>
					</a>
				</li>
				<li id="cart">
					<a href="DB_mypage_cart.jsp">장바구니
						<p>&gt;</p>
					</a>
				</li>
				<li id="asApply">
					<a href="DB_mypage_applyAsBefore.jsp">A/S 문의하기
						<p>&gt;</p>
					</a>
				</li>
				<li id="asHistory">
					<a href="DB_mypage_asHistory.jsp">A/S 문의내역
						<p>&gt;</p>
					</a>
				</li>
				<li id="memberInfo"  class="bg">
					<a href="DB_mypage_IdPwd.jsp">개인정보수정
						<p>&gt;</p>
					</a>
				</li>
			</ul>
		</aside>
	</div>
	<div class="contentsOrder">
		<%if(idList != null) { %>
			<jsp:include page="login_mypage_infoUpdate.jsp" /> 
		<%} else {%>
			잘못된 접근입니다. 로그인을 다시 해주세요.
		<%}}%>		
	</div>
	
<script type="text/javascript">
	//상세페이지 
	function cartBtnDetail(param) {
		location.href="../productDetailSelect.bo?product_name="+encodeURIComponent(param);
	}

	// 장바구니
	var cartcheck = document.querySelectorAll("input[name='cartcheck']");
	var allcartCheck = document.querySelector("input[name='allcartCheck']");
	var removeAllcartCheck = document.querySelector("input[name='removeAllcartCheck']");
	var showamount = document.querySelectorAll("input[name='showamount']");
	var input_cart_price = document.querySelectorAll("input[name='cart_price']");
	var input_cart_category = document.querySelectorAll("input[name='cart_category']");
	var input_cart_img = document.querySelectorAll("input[name='cart_img']");
	var input_cart_color = document.querySelectorAll("input[name='cart_color']");
	// 장바구니 - 전체 선택
	function checkAll() {
		removeAllcartCheck.checked = false;
		for(var i=0; i<cartcheck.length; i++) {
			cartcheck[i].checked = true;
			cartcheck[i].classList.add("checked");
		}
	}
	// 장바구니 - 선택 해제
	function removecheckAll() {
		allcartCheck.checked = false;
		for(var i=0; i<cartcheck.length; i++) {
			cartcheck[i].checked = false;
			cartcheck[i].classList.remove("checked");
		}
	}
	// 장바구니 - 개별 선택
	function checkSingle(obj) {
		cartcheck[obj].classList.toggle("checked");
	}
	// 장바구니 - 삭제하기
	function cartDelete_btn() {
		var param = "";
		var cart_name = "";
		var cart_count = "";
		var cart_price = "";
		for(var i=0; i<cartcheck.length; i++) {
			if(cartcheck[i].className == "checked") {
				cart_name += cartcheck[i].value + ",";
				cart_count += showamount[i].value + ",";
				cart_price += input_cart_price[i].value + ",";
			}
		}
		param = "?cart_id=" + "<%=id%>"
				+ "&cart_name=" + cart_name
				+ "&cart_count=" + cart_count
				+ "&cart_price=" + cart_price;
		
		location.href="../cartDelete.bo"+param;
	}
	// 장바구니 - 구매하기
	function cartOrder_btn() {
		var param = "";
		var buy_totalprice = "";
		var buy_category = "";
		var buy_img = "";
		var buy_name = "";
		var buy_price = "";
		var buy_colors = "";
		var buy_amount = "";
		for(var i=0; i<cartcheck.length; i++) {
			if(cartcheck[i].className == "checked") {
				buy_totalprice += (input_cart_price[i].value * showamount[i].value) + ",";
				buy_category += input_cart_category[i].value + ",";
				buy_img += input_cart_img[i].value + ",";
				buy_name += cartcheck[i].value + ",";
				buy_price += input_cart_price[i].value + ",";
				buy_colors += input_cart_color[i].value + ",";
				buy_amount += showamount[i].value + ",";
			}
		}
		param = "?buy_id=" + "<%=id%>"
				+ "&buy_name=" + buy_name
				+ "&buy_totalprice=" + buy_totalprice
				+ "&buy_category=" + buy_category
				+ "&buy_img=" + buy_img
				+ "&buy_price=" + buy_price
				+ "&buy_colors=" + buy_colors
				+ "&buy_amount=" + buy_amount;
				
		location.href="../cartOrderInsert.bo"+param;
	}
</script>
	
</body>
</html>
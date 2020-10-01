<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.CustomerCenter_dto"%>
<%@page import="com.TeamPro.dto.PageInfo"%>
<%@page import="java.util.*"%>

<%
List<CustomerCenter_dto> centerlist = (List<CustomerCenter_dto>) request.getAttribute("centerlist");
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
int listCount=pageInfo.getListCount();
int nowPage=pageInfo.getPage();
int maxPage=pageInfo.getMaxPage();
int startPage=pageInfo.getStartPage();
int endPage=pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/customer.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>공지사항</title>
</head>
<body>
	<!-- header -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
	%>
	<jsp:include page="../customer_header_beforelogin.jsp" />
	<%}else {%>
	<jsp:include page="../customer_header_afterlogin.jsp" />
	<%}%> <!-- header end -->
	
	<!-- section -->
	<section>
		<h1 class="titleText">CUSTOMER CENTER</h1>
		<!-- customerNav -->
		<div class="menuContainer">
			<ul>
				<li onclick="location.href='customerNoticeList.bo?center_category=notice';" class="bgWhite">공지사항</li>
				<li onclick="location.href='customerDownload.bo';">제품 설명서</li>
				<li onclick="location.href='../TeamPro/pages_customer/customer_offline.jsp';">오프라인 매장</li>
			</ul>
		</div>
		<div class="customerContainer">
			<!-- 공지사항 콘텐츠 -->
			<div class="customerContents notice">
				<h2>공지사항</h2>
				<%if(id == null) {%>
				<div style="display: none;"></div>
				<%}else if(!id.equals("admin")) {%>
				<div style="display: none;"></div>
				<%}else if(id.equals("admin")) {%>
				<div class="mb_20">
					<input type="button" value="공지사항 등록하기" onclick="location.href='pages_customer/DB_notice_insert.jsp'" />
				</div>
				<%}%>
				<div class="noticeConn">
					<div class="noticeInner notice_header">
						<div class="notice_num">번호</div>
						<div class="notice_title">제목</div>
						<div class="notice_person">작성일</div>
					</div>
					<ul class="notice_list">
						<%if(centerlist.size() != 0) {
						for(int i=0; i<centerlist.size(); i++) {%>
						<li>
							<div class="noticeInner notice_item">
								<div class="notice_num"><%=centerlist.get(i).getCenter_no()%></div>
								<div class="notice_title" onclick="showContents(<%=i%>)"><%=centerlist.get(i).getCenter_title()%></div>
								<div class="notice_person"><%=centerlist.get(i).getCenter_date()%></div>
							</div>
							<div class="notice_contents none"><%=centerlist.get(i).getCenter_contents()%></div>
						</li>
						<%}}%>
					</ul>
				</div>
				
				<!-- 페이징은 product_category.jsp에서 쓴적 있음 참고참고! -->
				<div id="pageList" class="pagenation">
					<ul>
					<%if(centerlist.size() != 0) {%>
						<%if(nowPage<=1){%>
						<li class="firstBtn"><a href="#">&lt;</a></li>
						<%}else{%>
						<li class="firstBtn"><a href="customerNoticeList.bo?center_category=<%out.print(centerlist.get(0).getCenter_category());%>&page=<%=nowPage-1%>">&lt;</a></li>
						<%}%>
						<%for(int a=startPage;a<=endPage;a++){
						if(a==nowPage){%>
						<li><a href="#" class="fw_bold"><%=a%></a></li>
						<%}else{ %>
						<li><a href="customerNoticeList.bo?center_category=<%out.print(centerlist.get(0).getCenter_category());%>&page=<%=a%>"><%=a%></a></li>
						<%}%>
						<%}%>
						<%if(nowPage>=maxPage){ %>
						<li class="lastBtn"><a href="#">&gt;</a></li>
						<%}else{%>
						<li class="lastBtn"><a href="customerNoticeList.bo?center_category=<%out.print(centerlist.get(0).getCenter_category());%>&page=<%=nowPage+1%>">&gt;</a></li>
						<%}}%>
					</ul>
				</div>
			</div>
		</div>
	</section> <!-- section end -->
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="js/scroll.js"></script>
	<script type="text/javascript" src="js/customer_notice.js"></script>
	
</body>
</html>
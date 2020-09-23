<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dto.CustomerInfo_dto"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>마이페이지</title>	
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">
	<link rel="stylesheet" type="text/css" href="../css/login_mypage.css">

	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title></title>
</head>
<body>

<%
	String id = (String)session.getAttribute("id");
	ArrayList<CustomerInfo_dto> memeberList = (ArrayList<CustomerInfo_dto>)request.getAttribute("memeberList");
%>

	<div>
		<div class="memberId">
			<div><img src="../images/mypage_img/icons/person1.png"></div>
			<ul>
				<li><%=id %> 님</li>	
			</ul>
		</div>
		<div class="memberInfo">
			<div class="info_update"><a href="DB_infoUpdateBefore.jsp">개인정보 수정</a></div>
			<ul>
				<li>
					<p>이름 : </p>
					<p><%=memeberList.get(0).getCustomer_name() %></p>
				</li>
				<li>
					<p>주소 : </p>
					<p><%=memeberList.get(0).getCustomer_addr() %></p>
				</li>
				<li>
					<p>연락처 : </p>
					<p><%=memeberList.get(0).getCustomer_phone() %></p>
				</li>
			</ul>
		</div>
	</div>
		
</body>
</html>


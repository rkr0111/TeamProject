<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">
	<link rel="stylesheet" type="text/css" href="../css/login_login.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title> 로그인 </title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../login_header_beforelogin.jsp" /> <!-- header end -->

	<section> <!-- section -->
		<form class="loginformContainer" action="./DB_login.jsp" method="post">
			<h1 class="titleText">로그인</h3>
			<div class="loginContainer">
				<ul class="inputInfo">
					<li><input type="text" name="id" placeholder="아이디"></li>
					<li><input type="password" name="passwd" placeholder="비밀번호"></li>
				</ul>

				<ul class="findinfo">
					<li><a href="login_findId.jsp">아이디 찾기</a></li>
					<li><a href="login_findpwd.jsp">비밀번호 찾기</a></li>
					<li><a href="login_join.jsp">회원가입</a></li>
				</ul>

				<!-- 로그인하기 버튼 -->
				<div class="btnContainer">
					<input class="button textColor gray_4c4c4c" type="submit" name="submit" value="로그인">
				</div>

			</div>
		</form>
	</section> <!-- section end -->

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="../js/scroll.js"></script>
	<script type="text/javascript" src="../js/login_join.js"></script>
</body>
</html>
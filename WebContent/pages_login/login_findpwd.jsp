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
	<link rel="stylesheet" type="text/css" href="../css/login_findpwd.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title> 비밀번호 찾기 </title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../login_header_beforelogin.jsp" /> <!-- header end -->

	<section> <!-- section -->
		<form class="findPwdformContainer" action="DB_findpwd.jsp" method="post">
			<h1 class="titleText">비밀번호 찾기</h3>
			<div class="findPwdContainer">
				<ul>
					<li>가입하신 정보를 통해</li>
					<li>비밀번호를 찾으실 수 있습니다.</li>
				</ul>

				<ul class="findPwdInputInfo">
					<li><input type="text" name="inputname" placeholder="이름을 입력해주세요."></li>
					<li><input type="text" name="inputid" placeholder="아이디를 입력해주세요."></li>
				</ul>
				<ul class="findPwdPhone">
					<li><input type="text" name="phone-choice" placeholder=""></li>
					<li>-</li>
					<li><input type="text" name="middle-phonenum" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></li>
					<li>-</li>
					<li><input type="text" name="last-phonenum" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></li>
				</ul>
				<!-- 비밀번호 찾기 버튼 -->
				<div class="btnContainer">
					<input class="button textColor gray_4c4c4c" type="submit" name="submit" value="비밀번호 찾기">
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.TeamPro.dto.CustomerInfo_dto"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">
	<link rel="stylesheet" type="text/css" href="../css/login_infoUpdate.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<title>개인정보 수정</title>
</head>
<body>

<%
	String id = (String)session.getAttribute("id");	
	ArrayList<CustomerInfo_dto> memberList = (ArrayList<CustomerInfo_dto>) request.getAttribute("memberList");
	CustomerInfo_dto customerinfo_dto = new CustomerInfo_dto();
%>
	<!-- header -->
	<jsp:include page="../login_header_afterlogin.jsp" /> <!-- header end -->

	<section>
		<form name="join-form" method="post" action="./DB_infoUpdateAfter.jsp">
			<!-- 개인정보 수정 폼 -->
			<div class="joinformContainer">
				<h1 class="titleText">개인정보 수정</h1>
				<div class="joinTableContainer joinform">
					<table>
						<tr>
							<th>아이디<span class="textColor orange ml_5">*</span></th>
							<td>
								<ul>
									<li>
										<label for="join-id">아이디</label>
										<% out.print(memberList.get(0).getCustomer_id()); %>
									</li>
								</ul>
								<div class="checkVisible id fs_11"></div>
							</td>
						</tr>
						<tr>
							<th>비밀번호<span class="textColor orange ml_5">*</span></th>
							<td class="tdPwd">
								<ul>
									<li class="fs_11 textColor gray_656565 mb_5">비밀번호 <span class="textColor orange">(영문,숫자,특수문자포함 8~15자리)</span></li>
									<li>
										<label for="join-password">비밀번호</label>
										<input class="inputText" type="password" name="join-password" placeholder="비밀번호" maxlength="15" oninput="pwdChecked()">
									</li>
								</ul>
								<ul>
									<li class="fs_11 textColor gray_656565 mb_5">비밀번호 확인</li>
									<li>
										<label for="join-passwordcheck">비밀번호 확인</label>
										<input class="inputText" type="password" name="join-passwordcheck" placeholder="비밀번호 확인" maxlength="15" oninput="pwdChecked()">
									</li>
								</ul>
								<div class="checkVisible pwd fs_11"></div>
							</td>
						</tr>
						<tr>
							<th>이메일<span class="textColor orange ml_5">*</span></th>
							<td>
								<ul>
									<li>
										<label for="join-email-id">이메일</label>
										<input class="inputText" type="text" name="join-email-id"  onKeyup="this.value=this.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'')">
									</li>
									<li>@</li>
									<li>
										<select name="join-email-choice" size="1">
											<option name="email-view">이메일주소</option>
											<option name="select-naver" value="naver.com">naver.com</option>
											<option name="select-daum" value="daum.net">daum.net</option>
											<option name="select-google" value="google.com">google.com</option>
										</select>
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th>이름<span class="textColor orange ml_5">*</span></th>
							<td>
								<label for="join-name">이름</label>
								
							</td>
						</tr>
						<tr>
							<th>생년월일<span class="textColor orange ml_5">*</span></th>
							<td>
								<ul>
									<li>
										
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th>주소<span class="textColor orange ml_5">*</span></th>
							<td>
								<ul>
									<li>
										<input id="sample6_postcode" class="addressBox" type="text" name="post-address" readonly>
									</li>
									<li><input class="button checkBtn adrBtn textColor gray_656565" type="button" name="check-address" value="우편번호" onclick="sample6_execDaumPostcode()"></li>
								</ul>
								<ul>
									<li class="mb_5">
										<label for="first-address"></label>
										<input id="sample6_address" class="inputText" type="text" name="first-address" >
									</li> 
									<li>
										<label for="last-address">상세주소</label>
										<input id="sample6_detailAddress" class="inputText" type="text" name="last-address" >
									</li>
									<li>
										<label for="extra-address">참고항목</label>
										<input id="sample6_extraAddress" class="inputText" type="text" name="extra-address" >
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th>휴대폰번호<span class="textColor orange ml_5">*</span></th>
							<td>
								<ul>
									<li>
										<select name="phone-choice" size="1">
											<option name="phone-view">휴대폰 앞자리</option>
											<option name="phone-010" value="010">010</option>
											<option name="phone-011" value="011">011</option>
											<option name="phone-018" value="018">018</option>
										</select>
									</li>
									<li>-</li>
									<li>
										<label for="middle-phonenum"></label>
										<input class="inputText" type="text" name="middle-phonenum"  maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									</li>
									<li>-</li>
									<li>
										<label for="last-phonenum"></label>
										<input class="inputText" type="text" name="last-phonenum"  maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									</li>
								</ul>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<!-- 수정하기 버튼 -->
			<div class="btnContainer">
				<input class="button textColor gray_4c4c4c" type="submit" name="submit" value="수정하기" >
			</div>
		</form>
	</section>

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="../js/index-nav.js"></script>
	<script type="text/javascript" src="../js/scroll.js"></script>
	<script type="text/javascript" src="../js/login_infoUpdate.js"></script>
	<script type="text/javascript" src="../js/login_postcode.js"></script>
</body>
</html>
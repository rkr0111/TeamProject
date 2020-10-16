<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="com.TeamPro.dto.CustomerInfo_dto"%>
<%@page import="java.util.*"%>

<%
	ArrayList<CustomerInfo_dto> idList = (ArrayList<CustomerInfo_dto>) request.getAttribute("idList");
%>
	<div class="contentMember">
		<ul>
			<li>정보 확인을 위해 비밀번호를 입력해주세요.</li>
			<li><input type="password" name="checkPwd" id="checkPwd" /></li>
		</ul>
		<%request.setAttribute("idList", idList);%> 
		<input type="button" value="확인" class="memberInfoBtn" onclick="checkBtn()" />
	</div>
	
<script type="text/javascript">
	//개인정보수정 -> 비밀번호 확인 후 수정페이지로 이동
	function checkBtn() {
		var checkPwd = document.getElementById("checkPwd");
		if(checkPwd.value=="<% out.print(idList.get(0).getCustomer_pwd()); %>") {
			location.href="DB_mypage_infoUpdateBefore.jsp";
		}else {
			alert("비밀번호가 틀렸습니다.");
		}
	}
</script>
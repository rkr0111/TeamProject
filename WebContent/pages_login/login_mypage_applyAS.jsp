<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="com.TeamPro.dto.Buyhistory_dto"%>
<%@page import="java.util.*"%>

<%	
	ArrayList<Buyhistory_dto> asBeforeList = (ArrayList<Buyhistory_dto>) request.getAttribute("asBeforeList");
	String mypageCategory = request.getParameter("mypageCategory");
%>
	<div class="checkAS">
		<h1><span class="round"></span>온라인 A/S 신청 전 확인사항</h1>
		<ul>
			<li class="number">1. 자주하는 질문에서 문제점을 먼저 확인해 주시기 바랍니다.</li>
			<li class="number">2. 보증기간 중에 발생한 제품 결함에 대해서는 무상으로 수리해 드립니다.</li>
			<li class="innerNumber">- 보증기간: 1년(구입년도 구입일 포함)</li>
			<li class="number">3.다음과 같은 경우에는 보증기간 중이라도 유상입니다.</li>
			<li class="innerNumber">- 사용자 과실(조명 깨짐 등)</li>
			<li class="innerNumber">- 부주의나 무리한 사용으로 인한 고장</li>
		</ul>
	</div>
	
	<div class="applyAS">
		<h1><span class="round"></span>A/S 신청 상품정보 입력</h1>
		<form action="DB_mypage_applyAsAfter.jsp" method="post">
			<table>
				<tr>
					<th>제품 이름</th>
					<td>
						<select name="applyAS_findName">
							<option name="applyAS_product">제품을 선택해주세요.</option>
							<%for(int i=0; i<asBeforeList.size(); i++) {%>
							<option name="applyAS_product" value="<%out.print(asBeforeList.get(i).getBuy_name());%>"><%out.print(asBeforeList.get(i).getBuy_name()); %></option>
						</select>
					</td>
				</tr>
				<tr>
					<th>상품 구매일</th>
					<td><%out.println(asBeforeList.get(i).getBuy_date()); }%></td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<select name="applyAS_title">
							<option name="title0">제목을 선택해주세요.</option>
							<option name="title1">조명이 깨졌어요.</option>
							<option name="title2">불이 안 들어와요.</option>
							<option name="title3">결함이 있습니다.</option>
							<option name="title4">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>상세 내용</th>
					<td><textarea name="applyAS_contents" rows="5" cols="50"></textarea></td>
				</tr>
			</table>
	
			<input class="applyAS_btn" type="submit" name="applyAS_btn" value="A/S 신청하기">
		</form>
	</div>
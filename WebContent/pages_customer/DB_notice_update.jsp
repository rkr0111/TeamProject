<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.CustomerCenter_dto"%>
<%@page import="java.util.*"%>  
<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB+Product Insert Page</title>
<!-- jQuery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<style>
	.inserttable {
		border-collapse: collapse;
		margin-bottom: 30px;
	}
	.inserttable th, 
	.inserttable td {
		border: 1px solid #000;
		padding: 10px 30px;
	}
</style>
<body>
	<%	
		TeamPro_dao dao = new TeamPro_dao();
		CustomerCenter_dto dto = new CustomerCenter_dto();
		
		SqlSessionFactory sqlfactory = dao.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		int center_no = Integer.parseInt(request.getParameter("center_no"));
		dto.setCenter_no(center_no);
		
		List<CustomerCenter_dto> noticelist= sqlsession.selectList("xml_select_customerNoticeUpdate", dto);
		sqlsession.close();
	%>

	<h1>공지사항 수정하기<br>============</h1>
	<form action="../customerNoticeUpdate.bo?center_no=<%=center_no%>" method="post">
		<table class="inserttable">
			<tr>
				<th>제목</th>
				<td><input type="text" name="center_title" required="required" style="width: 500px;" value="<%=noticelist.get(0).getCenter_title()%>"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="center_contents" style="resize: none; width: 500px; height: 200px;" required><%=noticelist.get(0).getCenter_contents()%></textarea></td>
			</tr>
		</table>
		<input type="submit" value="수정하기">
	</form>
	
</body>
</html>

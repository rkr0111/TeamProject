<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="java.util.*"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Desk Update Page</title>
</head>
<style>
	.updatetable {
		border-collapse: collapse;
		margin-bottom: 30px;
	}
	.updatetable th, 
	.updatetable td {
		border: 1px solid #000;
		padding: 10px 30px;
	}
	.updatetable td p {
		margin: 0;
	    font-size: 13px;
    	color: #aaa;
	}
	.updatetable td select {
		width: 178px;
		height: 21px;
	}
	.colorBoxUL {
	    margin: 0;
	    padding: 0;
	    list-style-type: none;
	}
</style>
<body>
	<%
		request.setCharacterEncoding("utf-8");		
		TeamPro_dao dao = new TeamPro_dao();
		Product_dto dto = new Product_dto();
		
		SqlSessionFactory sqlfactory = dao.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		String check = request.getParameter("product_name");
		dto.setCheck(check);
		
		dto.setProduct_name(request.getParameter("product_name"));
		List<Product_dto> connresultsel= sqlsession.selectList("xml_select_name", dto);
		sqlsession.close();
		
		String[] idx = connresultsel.get(0).getProduct_color().split(",");
		String[] imgidx = connresultsel.get(0).getProduct_detailimg().split(",");
	%>

	<h1>상품 수정하기<br/>============</h1>
	<form action="../productUpdate.bo" method="post" enctype="multipart/form-data">
		<table class="updatetable">
			<tr>	
				<th>이름</th>
				<td><input type="text" name="udt_name" value="<%=connresultsel.get(0).getProduct_name()%>"></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<p>현재 카테고리명입니다.</p>
					<input type="text" name="udt_category" value="<%=connresultsel.get(0).getProduct_category()%>" readonly>
					<p style="margin-top: 10px;">변경할 카테고리를 선택하세요.</p>
					<select name="product_category" required="required">
						<option name="desk">desk</option>
						<option name="bedroom">bedroom</option>
						<option name="stand">stand</option>
						<option name="point">point</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<p>숫자만 입력해주세요.</p>
					<input type="text" name="udt_price" value="<%=connresultsel.get(0).getProduct_price()%>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				</td>
			</tr>
			<tr>
				<th>컬러</th>
				<td>
					<p>영문으로 입력해주세요.</p>
					<ul class="colorBoxUL">
						<%for(int i=0; i<idx.length; i++) {%>
						<li><input type="text" name="udt_color" value="<%=idx[i]%>" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');"></li>
						<%}%>
						<li><input type="text" name="udt_color" value="" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');"></li>
						<li><input type="text" name="udt_color" value="" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');"></li>
					</ul>
				</td>
			</tr>
			<tr>
				<th>파일</th>
				<td>
					<p>현재 파일</p>
					<input type="text" name="udt_file" value="<%=connresultsel.get(0).getProduct_file()%>" readonly>
					<p style="margin-top: 10px;">변경할 파일을 선택하세요.</p>
					<input type="file" name="udt_change_file1">
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<p>현재 썸네일</p>
					<input type="text" name="udt_img" value="<%=connresultsel.get(0).getProduct_img()%>" readonly>
					<p>변경할 사진을 선택하세요.</p>
					<input type="file" name="udt_change_file2">
					<p style="margin-top: 10px;">상세 이미지</p>
					<%for(int i=0; i<imgidx.length; i++) {%>
					<input type="text" name="udt_detailimg<%=i+1%>" value="<%=imgidx[i]%>" readonly>
					<p>변경할 사진을 선택하세요.</p>
					<input type="file" name="udt_change_file<%=i+3%>"><br/>
					<%}%>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="udt_contents" style="resize: none; width: 500px; height: 150px;" required><%=connresultsel.get(0).getProduct_contents()%></textarea></td>
			</tr>
		</table>
		<input type="hidden" name="udt_check" value="<%=dto.getCheck()%>" />
		<input type="submit" value="수정하기"/>
	</form>
</body>
</html>
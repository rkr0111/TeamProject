<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	.inserttable td input:not(input[name="add_colorbox"]) { width: 200px; }
	.inserttable td select { width: 178px; }
	.inserttable td p {
		margin: 0 0 5px 0;
	    font-size: 13px;
    	color: #aaa;
	}
	ul {
	    margin: 0;
	    padding: 0;
	    list-style-type: none;
	}
</style>
<body>

	<h1>상품 등록하기<br>============</h1>
	<form action="DB_product_insertAction.jsp" method="post" enctype="multipart/form-data">
		<table class="inserttable">
			<tr>
				<th>상품 이름</th>
				<td><input type="text" name="product_name" required="required"></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
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
					<input type="number" name="product_price" required="required"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				</td>
			</tr>
			<tr>
				<th>컬러</th>
				<td>
					<p>영문으로 입력해주세요.</p>
					<ul class="colorBoxUL">
						<li><input type="text" name="product_color" required="required" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');" class="colorInput"></li>
						<li><input type="text" name="product_color" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');" class="colorInput"></li>
						<li><input type="text" name="product_color" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');" class="colorInput"></li>
						<li><input type="text" name="product_color" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');" class="colorInput"></li>
						<li><input type="text" name="product_color" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');" class="colorInput"></li>
					</ul>
				</td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" name="product_file1" required="required"></td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<div>
					<p>썸네일</p>
						<input type="file" name="product_file2" required="required">
					</div>
					<div style="margin-top: 10px;">
						<p>상세 이미지</p>
						<ul>
							<li><input type="file" name="product_file3"></li>
							<li><input type="file" name="product_file4"></li>
							<li><input type="file" name="product_file5"></li>
						</ul>
					</div>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="product_contents" style="resize: none; width: 500px; height: 150px;" required></textarea></td>
			</tr>
			<tr>
				<th>날씨</th>
				<td>
					<p>해당 상품이 어떤 날씨에 어울리는지 선택해주세요.</p>
					<select name="product_weather" required="required">
						<option name="clouds">흐림</option>
						<option name="thunderstorm">낙뢰</option>
						<option name="rain">비</option>
						<option name="drizzle">이슬비</option>
						<option name="clear">맑음</option>
						<option name="fog">안개</option>
						<option name="snow">눈</option>
					</select>
				</td>
			</tr>
		</table>
		<input type="submit" value="상품 등록">
	</form>

</body>
</html>

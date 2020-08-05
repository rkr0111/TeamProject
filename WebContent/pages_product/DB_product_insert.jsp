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
		margin: 0;
	    font-size: 13px;
    	color: #aaa;
	}
</style>
<body>

	<h1>상품 등록하기<br>============</h1>
	<form action="../productInsert.bo" method="post" enctype="multipart/form-data">
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
					<input type="text" name="product_price" required="required"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				</td>
			</tr>
			<tr>
				<th>컬러</th>
				<td class="colorBoxTD">
					<p>컬러는 영문으로 입력해주세요. <input type="button" name="add_colorbox" value="추가" onclick="addColorBox()"></p>
					<input type="text" name="product_color" required="required" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');" class="colorInput0">
					<br/>
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="product_img" required="required"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="product_contents" required="required"></td>
			</tr>
		</table>
		<input type="submit" value="상품 등록">
	</form>

<!-- script -->
<script type="text/javascript">
	var colorBoxTD = document.querySelector(".colorBoxTD");
	var cnt = 1;
	
	function addColorBox() {
		var addInputBox = document.createElement("div");
		var addInput = document.createElement("input");
		var addRemoveInput = document.createElement("input");

		addInputBox.setAttribute("id", "inputBox");
		addInputBox.setAttribute("class", cnt);
		
		addInput.type = "text";
		addInput.name = "prodcut_color";
		addInput.setAttribute("onKeyup", "this.value=this.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');");
		addInput.setAttribute("class", "colorInput" + (cnt++));
		
		addRemoveInput.type = "button";
		addRemoveInput.name = "colorboxremove";
		addRemoveInput.value = "삭제";
		addRemoveInput.setAttribute("onclick", "removeColorBox()");
		addRemoveInput.setAttribute("id", "colorboxremove");
		addRemoveInput.setAttribute("class", (cnt-1));
		
		colorBoxTD.append(addInputBox);
		addInputBox.append(addInput);
		addInputBox.append(addRemoveInput);
	}
	
	function removeColorBox() {
		var inputBox = document.querySelectorAll("#inputBox");
		var removebtncnt = document.querySelectorAll("#colorboxremove");
		var inputcnt = document.querySelectorAll("input[class^='colorInput']");

		console.log(inputBox.length);
		var i = 0;
		for(var i=0; i<inputBox.length; i++) {
			console.log(inputBox[i].getAttribute("class"));
		}
	}
</script>
	
</body>
</html>


// 

// join javascript

//

// 변수 선언
var submitBtn = document.querySelector("input[type=submit]");
var inputText = document.querySelectorAll("input.inputText");
var inputTextPwd = document.querySelectorAll("input[type='password']");
var inputLabel = document.querySelectorAll("label");
var selectBox = document.querySelectorAll("select");
var selectFirstOpt = document.querySelectorAll("select > option:first-of-type");
var checkbox = document.querySelector("input[type='checkbox']");

// ==================================================

// input, select, checkbox null 여부 확인

// ==================================================

// submit 버튼 클릭
function submitClick() {
	if(inputTextChecked() === 0 || selectboxChecked() === 0) {
		return false;
	}else {
		return true;
	}
}

// input text 입력 여부 확인
function inputTextChecked() {
	var flag = 0;
	var numSearch = (inputTextPwd[0].value).search(/[0-9]/g);
	var engSearch = (inputTextPwd[0].value).search(/[a-z]/ig);
	var speSearch = (inputTextPwd[0].value).search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	for(var i=0; i<inputText.length; i++) {
		if(inputText[i].value == "") {
			alert(inputLabel[i].innerText + "(을/를) 입력하지 않았습니다.");
			inputText[i].focus();
			flag = 0;
			break;
		}else if(inputTextPwd[0].value != inputTextPwd[1].value) {
			alert("비밀번호가 맞지 않습니다.");
			inputTextPwd[1].focus();
			flag = 0;
			break;
		}else if(inputTextPwd[0].value.length < 8 || inputTextPwd[0].value.length > 16) {
			alert("비밀번호를 8자리~15자리 이내로 입력해주세요.");
			inputTextPwd[0].focus();
			flag = 0;
			break;
		}else if((inputTextPwd[0].value).search(/\s/) != -1) {
			alert("비밀번호는 공백 없이 입력해주세요.");
			inputTextPwd[0].focus();
			flag = 0;
			break;
		}else if(numSearch < 0 || engSearch < 0 || speSearch < 0) {
			alert("비밀번호는 영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
			inputTextPwd[0].focus();
			flag = 0;
			break;
		}else flag = 1;
	}
	return flag;
}

// select box 선택 여부
function selectboxChecked() {
	var flag = 0;
	for(var i=0; i<selectBox.length; i++) {
		if(!selectBox[i].options.selected && selectFirstOpt[i].selected) {
			alert(selectFirstOpt[i].value + "(을/를) 선택하지 않았습니다.");
			flag = 0;
			break;
		}else {
			flag = 1;
		}
	}
	return flag;
}

// ==================================================

// 비밀번호 일치 여부 ajax

// ==================================================

function pwdChecked() {
	var pwd = inputTextPwd[0].value;
	var pwdCheck = inputTextPwd[1].value;
	$(".checkVisible.pwd").empty();

	if(pwd == "" || pwdCheck == "" || pwd != pwdCheck) {
		$(".checkVisible.pwd").append("비밀번호가 맞지 않습니다.");
		$(".checkVisible.pwd").css("color", "#ff0000");
	}else {
		$(".checkVisible.pwd").append("비밀번호가 일치합니다.");
		$(".checkVisible.pwd").css("color", "#0000ff");
	}
}

//

//

//

var detailNavLI = document.querySelectorAll(".detailNav-inner > li");
var detailImg = document.querySelector(".detailImg");
var detailDelInfo = document.querySelector(".detailDelInfo");

var btn_minus = document.querySelector(".btn_minus");
var btn_plus = document.querySelector(".btn_plus");
var showamount = document.querySelectorAll("input[name='showamount']");

var colorSelect = document.querySelector(".colorSelectContents > select");
var colorOpt = document.querySelectorAll(".colorSelectContents > select option[name^='color-']");
var colorOptFirst = document.querySelectorAll(".colorSelectContents > select > option:first-of-type");
var totalChoiceContainer = document.querySelector(".totalChoiceContainer");
var totalChoice = document.querySelectorAll(".totalChoice");
var product_color = document.querySelectorAll(".product_color");
var product_cnt = document.querySelectorAll(".product_cnt");
var removeBtn = document.querySelectorAll(".removeBtn");


// detailNav 클릭시 해당 위치 이동
function detailNavClicked(obj) {
	var contentsPos = "";
	if(obj == 0) {
		contentsPos = detailImg.getBoundingClientRect();
	}else {
		contentsPos = detailDelInfo.getBoundingClientRect();
	}
	window.scrollBy({
        behavior: 'smooth',
        left: 0,
        top: contentsPos.top
    });
}


// select option click event
function optionSelected() {
	var cnt = 0;
	for(var i=0; i<colorOpt.length; i++) {
		if(colorOpt[i].selected && !colorOptFirst.selected) {
			if(i == cnt) {
				totalChoice[i].style.display = "flex";
				product_color[i].innerText = colorOpt[i].value;
			}
		}
		cnt++;
	}
}

// removeBtn click event
for(var i=0; i<removeBtn.length; i++) {
	function removeBtn(obj) {
		showamount[obj].value = 0;
		totalChoice[obj].style.display = "none";
		
		var results = 0;
		for(var i=0; i<totalChoice.length; i++) {
			results += product_price * showamount[i].value;
		}
		totalPrice.innerText = results + "원";
	}
}
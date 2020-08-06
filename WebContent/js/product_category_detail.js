
//

//

//

var detailNavLI = document.querySelectorAll(".detailNav-inner > li");
var detailImg = document.querySelector(".detailImg");
var detailDelInfo = document.querySelector(".detailDelInfo");

var btn_minus = document.querySelector(".btn_minus");
var btn_plus = document.querySelector(".btn_plus");
var showamount = document.querySelector("input[name='showamount']");

var colorSelect = document.querySelector(".colorSelectContents > select");
var colorOpt = document.querySelectorAll(".colorSelectContents > select option");
var colorOptFirst = document.querySelectorAll(".colorSelectContents > select > option:first-of-type");
var totalChoiceContainer = document.querySelector(".totalChoiceContainer");
var totalChoice = document.querySelector(".totalChoice");
var product_color = document.querySelector(".product_color");
var product_cnt = document.querySelector(".product_cnt");


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
	totalChoiceContainer.classList.remove("hidden");
	var i=0;
	while( i<colorOpt.length ){
		if(colorOpt[i].selected && !colorOptFirst.selected) {
			product_color.innerText = colorOpt[i].value;
		}
		break;
	}
}
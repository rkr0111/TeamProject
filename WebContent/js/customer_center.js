
//

// md pick page js

//

var customerNav = document.querySelectorAll(".customerNav > ul > li");
var customerContents = document.querySelectorAll(".customerContents > div");



//버튼 클릭시 화면 전환
function changeView(obj) {
	if(obj == 0) {
		customerNav[0].classList.add("visible");
		customerNav[1].classList.remove("visible");
		customerContents[0].classList.remove("none");
		customerContents[1].classList.add("none");
	}else if(obj == 1) {
		customerNav[1].classList.add("visible");
		customerNav[0].classList.remove("visible");
		customerContents[1].classList.remove("none");
		customerContents[0].classList.add("none");
	}
}



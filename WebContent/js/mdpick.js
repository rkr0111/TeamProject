
//

// md pick page js

//

var todayContents = document.querySelector(".pickContents.today");
var weatherContents = document.querySelector(".pickContents.weather");
var menuContainerLI = document.querySelectorAll(".menuContainer > ul > li");


// 버튼 클릭시 화면 전환
function clickPickContents(obj) {
	if(obj == 0) {
		menuContainerLI[0].classList.add("bgWhite");
		menuContainerLI[1].classList.remove("bgWhite");
		todayContents.classList.remove("none");
		weatherContents.classList.add("none");
	}else if(obj == 1) {
		menuContainerLI[0].classList.remove("bgWhite");
		menuContainerLI[1].classList.add("bgWhite");
		todayContents.classList.add("none");
		weatherContents.classList.remove("none");
	}
}
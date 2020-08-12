
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

// 날씨 api ajax
var date = new Date();
var year = date.getFullYear();
var month = date.getMonth()+1
var day = date.getDate();
if(month < 10){
    month = "0"+month;
}
if(day < 10){
    day = "0"+day;
}
var today = year+month+day;

window.onload = function() {
	$.ajax({
		url: 'weatherParsing.do',
		type: 'get',
		data: {"today" : today},
		dataType: 'json',
		success: function(obj) {
			console.log("success: " + obj);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			alert("Status: " + textStatus + ", Error: " + errorThrown);
		}
	});
}
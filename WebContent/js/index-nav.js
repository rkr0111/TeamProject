
//

// header-menu.js

//

var menuIcon = $(".menuIcon");
var nav = $("nav");
var exitBtn = $("nav .exitBtn");

var page_menuIcon = $("header#page .menuIcon");
var page_nav = $("header#page nav");
var page_exitBtn = $("header#page .exitBtn");

$(function() {
	// index header nav
	menuIcon.click(function() {
		nav.addClass("visible");
	});
	exitBtn.click(function() {
		nav.removeClass("visible");
	});

	// index가 아닌 페이지에서의 반응형 header nav
	page_menuIcon.click(function() {
		page_nav.css({visibility : "visible"});
		page_exitBtn.css({visibility : "visible"});
		page_menuIcon.css({visibility : "hidden"});
	});
	page_exitBtn.click(function() {
		page_nav.css({visibility : "hidden"});
		page_exitBtn.css({visibility : "hidden"});
		page_menuIcon.css({visibility : "visible"});
	});
});
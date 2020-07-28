
//

// scroll.js

//

var page_menuIcon = $("header#page .menuIcon");
var page_nav = $("header#page nav");
var page_exitBtn = $("header#page .exitBtn");

$(function() {
	var lastScrollTop = 0, delta = 15;

	$(window).scroll(function(e) {
		var st = $(this).scrollTop();
	var window_width = $(this).width();
	console.log(window_width)

		if(Math.abs(lastScrollTop - st) <= delta) return;

		if( (st > lastScrollTop) && (lastScrollTop > 0) ) {
			$("header").addClass("hidden");
			$("header#index").css("background-color", "#ceb598");
			// index가 아닌 페이지에서의 반응형 header nav
			if(window_width < 768) {
				page_nav.css("visibility", "hidden");
				page_menuIcon.css("visibility", "visible");
				page_exitBtn.css("visibility", "hidden");
			}else {
				page_nav.css("visibility", "visible");
			}
		}else if( st < 20 ) {
			$("header").css("background-color", "transparent");
		}
		else {
			$("header").removeClass("hidden");
		}
		lastScrollTop = st;
	});
});
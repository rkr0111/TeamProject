/*mouseover-----------------------------------*/


$('#review').click(function(e) {
	var clicked = $(e.mypageAside > ul > li);
    clicked.css("background-color", "red");
});

/*$('#ordetHistory').click(function() {
	  $("mypageAside li:nth-of-type(1)").css("background-color", "#e8e8e8");
	});
$("#review").click(function() {
	  $("mypageAside > li").css("background-color", "red");
	});
$('#cart').click(function() {
	  $("mypageAside li:nth-of-type(3)").css("background-color", "#e8e8e8");
	});
$('#question').click(function() {
	  $("mypageAside li:nth-of-type(4)").css("background-color", "#e8e8e8");
	});
$('#as').click(function() {
	  $("mypageAside li:nth-of-type(5)").css("background-color", "#e8e8e8");
	});


*/


//orderHistory
$(function() {
	$("#orderHistory").on("mouseover", function() {
		$("").attr("href", "");
	});
});
// review
$(function() {
	$("#review").on("mouseover", function() {
		$("").attr("href", "");
	});
});
// cart
$(function() {
	$("#cart").on("mouseover", function() {
		$("").attr("href", "");
	});
});
// question
$(function() {
	$("#question").on("mouseover", function() {
		$("").attr("href", "");
	});
});
// as
$(function() {
	$("#as").on("mouseover", function() {
		$("").attr("href", "");
	});
});

//

// customer_notice.js

//

var notice_contents = document.querySelectorAll(".notice_contents");

function showContents(cnt) {
	notice_contents[cnt].classList.toggle("none");
}

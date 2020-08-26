// 

// interior javascript

// 

var likeBtn = document.querySelector(".likeBtn");
var commentBtn = document.querySelector(".commentBtn");
var replyBtn = document.querySelector(".replyBtn");

var commentsInput = document.querySelector(".commentsInput");
var replyInput = document.querySelector(".replyInput");


likeBtn.addEventListener("click", function() {
	likeBtn.classList.toggle("likeColor");
});


commentBtn.addEventListener("click", function() {
	commentsInput.classList.toggle("none");
});


replyBtn.addEventListener("click", function() {
	replyInput.classList.toggle("none");
});
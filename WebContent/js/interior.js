// 

// interior javascript

// 


// 좋아요 아이콘 클릭시 이벤트 함수
function likeClicked(obj) {
	obj.classList.toggle("likeColor");
}


// 댓글 아이콘 클릭시 이벤트 함수
function showCommentInput(obj) {
	var commentsbox = obj.parentNode.nextElementSibling.querySelector(".commentsInput");
	var commentsinput = commentsbox.querySelector("input[name='comments-text']");
	commentsbox.classList.toggle("none");
	commentsinput.value = "";
}


// 대댓글 창 보이기 이벤트 함수
function showReplyInput(obj) {
	var replybox = obj.nextElementSibling;
	var replyinput = replybox.querySelector("input[name='reply-text']");
	replybox.classList.toggle("none");
	replyinput.value = "";
}
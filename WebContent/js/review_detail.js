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

// 댓글 함수 (comment)
function inputCmt(obj, id, reviewnum) {
	var commentsbox = obj.parentNode;
	var cmtText = commentsbox.querySelector("input[name='comments-text']");
	
	var param = "comment_id=" + id
				+ "&comment_text=" + cmtText.value
				+ "&reviewboard_num=" + reviewnum;
	
	$.ajax({
		type: "post",
		url: "reviewComment.bo",
		data: param,
		success: function() {
			location.href="reviewDetailSelect.bo?review_num="+reviewnum;
		},
		error: function(e) {
			alet(e.responseText);
		}
	});
}

// 대댓글 함수 (reply)
function inputReply(obj, id, reviewnum, commentnum) {
	var commentsbox = obj.parentNode;
	var replyText = commentsbox.querySelector("input[name='reply-text']");
	
	var param = "reply_id=" + id
				+ "&reply_text=" + replyText.value
				+ "&reviewboard_num=" + reviewnum
				+ "&comment_num=" + commentnum;
				
	$.ajax({
		type: "post",
		url: "reviewReply.bo",
		data: param,
		success: function() {
			location.href="reviewDetailSelect.bo?review_num="+reviewnum;
		},
		error: function(e) {
			alet(e.responseText);
		}
	});
}


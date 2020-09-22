// 

// interior javascript

// 

// 댓글 창 나타내기
function showCommentInput(obj) {
	var commentsbox = obj.parentNode.nextElementSibling.querySelector(".commentsInput");
	var commentsinput = commentsbox.querySelector("input[name='comments-text']");
	commentsbox.classList.toggle("none");
	commentsinput.value = "";
}


// 대댓글 창 나타내기
function showReplyInput(obj) {
	var replybox = obj.nextElementSibling;
	var replyinput = replybox.querySelector("input[name='reply-text']");
	replybox.classList.toggle("none");
	replyinput.value = "";
}


// 댓글 Ajax (comment)
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


// 대댓글 Ajax (reply)
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
			alert(e.responseText);
		}
	});
}


// 좋아요 Ajax
function likeClicked(obj, id, reviewnum) {
	var param = "reivew_id=" + id
				+ "&review_num=" + reviewnum;
					
	$.ajax({
		type: "GET",
		url: "reivewLikeUpdate.bo",
		data: param,
		dataType: "html",
		success: function(data) {
			var findel = $(data).find("input[name='like_check']");
			var likecount = $(".likecount");
			var rscount = 0;
			
			if(findel.val() == 0) {
				obj.classList.remove("likeColor");
				rscount = parseInt(likecount.text()) - 1;
				likecount.text(rscount);
			}else if(findel.val() == 1) {
				obj.classList.add("likeColor");
				rscount = parseInt(likecount.text()) + 1;
				likecount.text(rscount);
			}
		},
		error: function(e) {
			alert(e);
		}
	});
}



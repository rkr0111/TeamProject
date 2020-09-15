<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="com.TeamPro.dto.PageInfo"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/allStyle.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/review_detail.css">
	<!-- jQuery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<title>인테리어 리뷰</title>
</head>
<body>
	<!-- header -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
	%>
	<jsp:include page="../review_header_beforelogin.jsp" />
	<%}else {%>
	<jsp:include page="../review_header_afterlogin.jsp" />
	<%}%> <!-- header end -->
	
	<!-- section -->
	<section>
		<h1 class="titleText">INTERIOR REVIEWS</h1>
		<div class="menuContainer">
			<ul>
				<li>Timeline</li>
			</ul>
		</div>
		<div class="interiorContainer">
			<ul class="reviewTimeline">
				<li>
					<div class="reviewImg mb_15"><img src="../images/product_img/desk/desk06_04.jpg" /></div>

					<ul class="btnContainer mb_15">
						<li class="likeBtn" onclick="likeClicked(this)"></li>
						<li class="commentBtn" onclick="showCommentInput(this)"></li>
					</ul>

					<div class="reviewTextContents">
						<div class="contentsText mb_10">
							<p class="fw_bold reviewId pr_10">user_id</p>
							<p class="conText">인테리어 리뷰 텍스트 예시 테스트 인테리어 리뷰 텍스트 예시 테스트 인테리어 리뷰 텍스트 예시 테스트 인테리어 리뷰 텍스트 예시 테스트 인테리어 리뷰 텍스트 예시 테스트 인테리어 리뷰 텍스트 예시 테스트</p>
						</div>

						<div class="commentsInput none mb_20">
							<input type="text" name="comments-text" value="" placeholder="댓글 입력..." />
							<input type="button" name="comments-insert" value="입력" />
						</div>

						<div class="contentsComments">
							<div class="comments">
								<p class="fw_bold reviewId pr_10">user_id</p>
								<P>인테리어 리뷰 댓글댓글</P>
							</div>
							<div class="reply">
								<p class="fw_bold reviewId pr_10">user_id</p>
								<P>인테리어 리뷰 대댓글입니다.</P>
							</div>
							<div class="reply">
								<p class="fw_bold reviewId pr_10">user_id</p>
								<P>인테리어 리뷰 대댓글입니다.</P>
							</div>

							<p class="replyBtn" onclick="showReplyInput(this)">댓글쓰기</p>
							<div class="replyInput none">
								<input type="text" name="reply-text" value="" placeholder="댓글 입력..." />
								<input type="button" name="reply-insert" value="입력" />
							</div>
						</div>

						<div class="contentsComments">
							<div class="comments">
								<p class="fw_bold reviewId pr_10">user_id</p>
								<P>인테리어 리뷰 댓글댓글</P>
							</div>
							<div class="reply">
								<p class="fw_bold reviewId pr_10">user_id</p>
								<P>인테리어 리뷰 대댓글입니다.</P>
							</div>

							<p class="replyBtn" onclick="showReplyInput(this)">댓글쓰기</p>
							<div class="replyInput none">
								<input type="text" name="reply-text" value="" placeholder="댓글 입력..." />
								<input type="button" name="reply-insert" value="입력" />
							</div>
						</div>
					</div>
				</li>

				<li>
					<div class="reviewImg mb_15"><img src="../images/product_img/desk/desk06_04.jpg" /></div>

					<ul class="btnContainer mb_15">
						<li class="likeBtn" onclick="likeClicked(this)"></li>
						<li class="commentBtn" onclick="showCommentInput(this)"></li>
					</ul>

					<div class="reviewTextContents">
						<div class="contentsText mb_10">
							<p class="fw_bold reviewId pr_10">user_id</p>
							<p class="conText">인테리어 리뷰 텍스트 예시 테스트 인테리어 리뷰 텍스트 예시 테스트 인테리어 리뷰 텍스트 예시 테스트 인테리어 리뷰 텍스트 예시 테스트 인테리어 리뷰 텍스트 예시 테스트 인테리어 리뷰 텍스트 예시 테스트</p>
						</div>

						<div class="commentsInput none mb_20">
							<input type="text" name="comments-text" value="" placeholder="댓글 입력..." />
							<input type="button" name="comments-insert" value="입력" />
						</div>

						<div class="contentsComments">
							<div class="comments">
								<p class="fw_bold reviewId pr_10">user_id</p>
								<P>인테리어 리뷰 댓글댓글</P>
							</div>
							<div class="reply">
								<p class="fw_bold reviewId pr_10">user_id</p>
								<P>인테리어 리뷰 대댓글입니다.</P>
							</div>
							<div class="reply">
								<p class="fw_bold reviewId pr_10">user_id</p>
								<P>인테리어 리뷰 대댓글입니다.</P>
							</div>

							<p class="replyBtn" onclick="showReplyInput(this)">댓글쓰기</p>
							<div class="replyInput none">
								<input type="text" name="reply-text" value="" placeholder="댓글 입력..." />
								<input type="button" name="reply-insert" value="입력" />
							</div>
						</div>

						<div class="contentsComments">
							<div class="comments">
								<p class="fw_bold reviewId pr_10">user_id</p>
								<P>인테리어 리뷰 댓글댓글</P>
							</div>
							<div class="reply">
								<p class="fw_bold reviewId pr_10">user_id</p>
								<P>인테리어 리뷰 대댓글입니다.</P>
							</div>

							<p class="replyBtn" onclick="showReplyInput(this)">댓글쓰기</p>
							<div class="replyInput none">
								<input type="text" name="reply-text" value="" placeholder="댓글 입력..." />
								<input type="button" name="reply-insert" value="입력" />
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>		
	</section> <!-- section end -->

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="js/scroll.js"></script>
	<script type="text/javascript" src="js/interior.js"></script>
</body>
</html>
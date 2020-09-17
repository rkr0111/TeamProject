<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="com.TeamPro.dao.TeamPro_dao"%>
<%@page import="com.TeamPro.dto.Review_dto"%>
<%@page import="com.TeamPro.dto.Product_dto"%>
<%@page import="com.TeamPro.dto.ReviewComment_dto"%>
<%@page import="com.TeamPro.dto.ReviewReply_dto"%>
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

<%
List<Review_dto> listinfo = (List<Review_dto>) request.getAttribute("listinfo");
List<Product_dto> listimg = (List<Product_dto>) request.getAttribute("listimg");
List<ReviewComment_dto> listcomment = (List<ReviewComment_dto>) request.getAttribute("listcomment");
List<ReviewReply_dto> listreply = (List<ReviewReply_dto>) request.getAttribute("listreply");
%>

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
					<div class="reviewImg mb_15"><img src="images/product_img/<%=listimg.get(0).getProduct_category()%>/<%=listinfo.get(0).getReview_img()%>" /></div>

					<ul class="btnContainer mb_15">
						<%if(id != null) {%>
						<li class="likeBtn" onclick="likeClicked(this, '<%=id%>', <%=listinfo.get(0).getReview_num()%>)"></li>
						<li class="commentBtn" onclick="showCommentInput(this)"></li>
						<%}else {%>
						<li class="likeBtn" onclick="location.href='pages_login/login_login.jsp';"></li>
						<li class="commentBtn" onclick="location.href='pages_login/login_login.jsp';"></li>
						<%}%>
					</ul>

					<div class="reviewTextContents">
						<div class="contentsText mb_10">
							<p class="fw_bold reviewId pr_10"><%=listinfo.get(0).getReview_id()%></p>
							<p class="conText"><%=listinfo.get(0).getReview_contents()%></p>
						</div>

						<div class="commentsInput none mb_20">
							<input type="text" name="comments-text" value="" placeholder="댓글 입력..." />
							<input type="button" name="comments-insert" value="입력" onclick="inputCmt(this, '<%=id%>', <%=listinfo.get(0).getReview_num()%>)" />
						</div>

						<%if(listcomment.size() != 0) {
						for(int i=0; i<listcomment.size(); i++) {%>
						<div class="contentsComments">
							<div class="comments">
								<p class="cmtId fw_bold reviewId pr_10"><%=listcomment.get(i).getComment_id()%></p>
								<P class="cmtText"><%=listcomment.get(i).getComment_text()%></P>
							</div>
							<%if(listreply.size() != 0) {
							for(int j=0; j<listreply.size(); j++) {
							if(listcomment.get(i).getComment_num() == listreply.get(j).getComment_num()) {%>
							<div class="reply">
								<p class="fw_bold reviewId pr_10"><%=listreply.get(j).getReply_id()%></p>
								<P class="replyText <%=j%>"><%=listreply.get(j).getReply_text()%></P>
							</div>
							<%}}}%>
							<%if(id != null) {%>
							<p class="replyBtn" onclick="showReplyInput(this)">댓글쓰기</p>
							<%}else {%>
							<p class="replyBtn" onclick="location.href='pages_login/login_login.jsp';">댓글쓰기</p>
							<%}%>
							<div class="replyInput none">
								<input type="text" name="reply-text" value="" placeholder="댓글 입력..." />
								<input type="button" name="reply-insert" value="입력" onclick="inputReply(this, '<%=id%>', <%=listinfo.get(0).getReview_num()%>, <%=listcomment.get(i).getComment_num()%>)" />
							</div>
						</div>
						<%}}%>
					</div>
				</li>
			</ul>
		</div>		
	</section> <!-- section end -->

	<!-- footer -->
	<jsp:include page="../footer.jsp" /> <!-- footer end -->

	<!-- script -->
	<script type="text/javascript" src="js/scroll.js"></script>
	<script type="text/javascript" src="js/review_detail.js"></script>
</body>
</html>
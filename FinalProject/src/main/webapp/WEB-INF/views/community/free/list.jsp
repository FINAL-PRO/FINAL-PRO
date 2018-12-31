<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동커</title>
<c:import url="../../common/header.jsp" />
<style>
#container2 {
	margin: 8px auto;
}

#container2 .article {
	font-size: 0;
	background-color: #fff;
	text-decoration: none;
}

#container2 .article>p.profile>img.picture {
	display: inline-block;
	margin-right: 6px;
	width: 20px;
	height: 20px;
	vertical-align: top;
}

#container2 .article>p.profile>span.nickname {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: #292929;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#container2 .article>p.profile>span.title {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: #292929;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#container2 .article>p.profile>span.count {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: #292929;
	font-size: 12px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.time {
	float: right;
	display: inline-block;
	line-height: 20px;
	color: #a6a6a6;
	font-size: 12px;
}

#container2 .article>p.text {
	margin-top: 8px;
	line-height: 18px;
	color: #292929;
	font-size: 14px;
}

.content {
	margin-top: 8px;
	line-height: 18px;
	color: #292929;
	font-size: 14px;
}

#container2 .article>p.status {
	float: left;
	margin-top: 8px;
}

#container2 .article>p.status>span {
	display: inline-block;
	margin-right: 8px;
	padding-left: 19px;
	line-height: 18px;
	color: #a6a6a6;
	font-size: 12px;
	background-repeat: no-repeat;
	background-size: 16px 16px;
}

#container2 .article>p.attach {
	float: right;
	margin-top: 8px;
}

#container2 .article>p.attach>span.attachcount {
	display: inline-block;
	padding-left: 19px;
	line-height: 18px;
	color: #ffa81f;
	font-size: 12px;
	background: transparent
		url('/images/community.board.article.attachcount.png') no-repeat;
	background-size: 16px 16px;
}

#container2 div.articlelist>ol.group>li>a.article {
	display: block;
	padding: 12px 12px;
	border-bottom: 1px solid #f2f2f2;
	height: 140px;
}

#container2 div.articlelist>ol.group>li>a.article:hover {
	background-color: #f8f8f8;
}

.articlelist {
	padding-top: 15px;
}

.group {
	list-style: none;
	padding: 20px;
}

hr {
	border: 0.3px solid lightgrey;
}

.category {
	float: left;
	padding-left: 20px;
}

.free_btn {
	float: right;
	padding-right: 20px;
}
</style>
</head>
<body>
	<div id="container">
		<c:import url="../../common/menubar.jsp" />
		<div class="wrap_inner">
			<main id="container">
			<section>
				<div class="section-left">
					<!-- 내용없음 -->
				</div>

				<div class="section-center">
					<div class="dc-content">
						<div class="dc-content-title">
							<h1>제목</h1>
						</div>
						<div class="dc-content-box">
							<div id="container2">
								<div class="free_top">
									<div class="category">
										<select>
											<option value="서버넘길값">최신 순 정렬</option>
											<option value="서버넘길값">좋아요 순 정렬</option>
											<option value="서버넘길값">댓글 많은 순 정렬</option>
										</select>
									</div>
									<div class="free_btn">
										<input type="button" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/community/free/freeInsertForm.do'" />
									</div>
								</div>
								<div class="articlelist">
									<ol class="group">
										<p>총 ${totalContents}건의 게시물이 있습니다.</p>
										
										<c:forEach items="${list}" var="b">
											<li class="groupin" id="${b.no}"><a class="article"
												href="${pageContext.request.contextPath}/community/free/freeView.do?no=${b.no}">
													<p class="time">
														<fmt:formatDate value="${b.writeDate}" pattern="yyyy-MM-dd HH:mm:ss" />
													</p>
													<p class="profile">
														<span class="title">${b.title}</span> <img class="picture" src="https://cf-epi.campuspick.com/0.png" /> 
														<span class="nickname">${b.memberName}</span> 
														<span class="count">조회수: ${b.viewCount}</span>
													</p> <span class="content">${b.content}</span>
													<p class="status">
														<span class="votecount">좋아요: ${b.likeCount}</span> 
														<span class="commentcount">댓글: ${b.commentCount}</span>
													</p>
													<p class="attach">
														<span class="attachcount">이미지</span>
													</p>
											</a></li>
										</c:forEach>
									</ol>
									<c:out value="${pageBar}" escapeXml="false" />
								</div>
							</div>

						</div>
					</div>
				</div>

				<div class="section-right">
					<c:import url="../../common/rightSection.jsp" />
				</div>
			</section>
			</main>
		</div>
		<c:import url="../../common/footer.jsp" />
</body>
</html>
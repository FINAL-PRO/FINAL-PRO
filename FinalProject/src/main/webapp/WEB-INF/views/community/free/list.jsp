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

.article>p.profile>img.picture {
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-botton: 5px;
}

.title {
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

.nickname {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: lightgray;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-right: 8px;
	margin-left: 8px;
}

.count {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: lightgray;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-right: 8px;
	margin-left: 8px;
	float: right;
}

.time {
	float: right;
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: lightgray;
	font-size: 14px;
	font-weight: bold;
	margin-left: 8px;
}
 
.picture {
  vertical-align: top;
}

.status span {
	display: inline-block;
	margin-right: 8px;
	line-height: 18px;
	color: #a6a6a6;
	font-size: 12px;
	font-weight: bold;
} 

.content {
	display: inline-block;
	color: #292929;
	font-size: 12px;
	width:80%;
	padding:0.5px;
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
	background-repeat: no-repeat;
	background-size: 16px 16px;
}

.bcontent{
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
	background-repeat: no-repeat;
	background-size: 16px 16px;
}

p.attach {
	display: inline-block;
	float: right;
	margin-top: 8px;
}

.attachcount {
	display: inline-block;
	line-height: 18px;
	color: #ffa81f;
	font-size: 12px;
	background-size: 16px 16px;
}

a.article {
	display: block;
	padding: 5px 5px;
	border-bottom: 1px solid #f2f2f2;
}

#container2 div.articlelist>ol.group>li>a.article:hover {
	background-color: #f8f8f8;
}

.articlelist {
	padding-top: 15px;
}

.group {
	list-style: none;
	padding-left: 20px;
}

hr {
	border: 0.3px solid lightgrey;
}

.category1 {
	float: left;
	padding-left: 20px;
}

.free_btn {
	float: right;
	padding-right: 5px;
}

.profile{
	display: inline-block;
	width: 100%;
}

.picture{
	margin-left: 20px;
}

.free_btn2{
	background: rgb(171, 187, 129);
    color: white;
    cursor: pointer;
}

.totalCount{
	font-size:13px; 
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
							<h1>자유게시판</h1>
						</div>
						<div class="dc-content-box">
							<div id="container2">
								<div class="free_top">
									<div class="category1">
										<select id="tList"> 
											<option value="" selected disabled hidden>정렬</option>
											<option value="1">최신 순 정렬</option>
											<option value="2">댓글 많은 순 정렬</option>
											<option value="3">좋아요 순 정렬</option>
										</select>
									</div>
									<script>
									
									
									$("#tList").change(function(){
										var tList = $(this).val();
										console.log("tlist:"+tList);
										location.href="${pageContext.request.contextPath}/community/free/list.do?tList="+tList;
									});
									
									</script>
									<c:if test="${!empty member}">
									<div class="free_btn">
										<input type="button" class="btn free_btn2 btn-sm" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/community/free/freeInsertForm.do'" />
									</div>
									</c:if>
								</div>
								<div class="articlelist">
									<ol class="group"><br>
										<p class="totalCount">총 ${totalContents}건의 게시물이 있습니다.</p>
										<c:forEach items="${list}" var="b">
											<li class="groupin" id="${b.no}">
											<a class="article" href="${pageContext.request.contextPath}/community/free/freeView.do?bno=${b.no}">
													<p class="profile">
														<span class="title">${b.title}</span> 
														<c:choose>
															<c:when test="${!empty b.profile}">
																<img class="picture" src="/dc/resources/upload/profile/${b.profile}" /> 
															</c:when>
															<c:otherwise>
																<img class="picture" src="/dc/resources/upload/profile/profileDefaultImg.png" /> 
															</c:otherwise>
														</c:choose>
														<span class="nickname">${b.memberName}</span> 
														<span class="count">조회수: ${b.viewCount}</span>
														<span class="time">
															<fmt:formatDate value="${b.writeDate}" pattern="yyyy-MM-dd" />
														</span>
													</p>
													<c:choose>
														<c:when test="${b.imageCheck eq 0}">
															<span class="content">${b.content}</span>
														</c:when>
														<c:otherwise>
															<span class="content"><p>(이미지)</p></span>
														</c:otherwise>
													</c:choose>
													<p class="status">
														<span class="votecount">좋아요: <span style="color:rgb(244, 126, 96);">${b.likeCount}</span></span> 
														<span class="commentcount">댓글: <span style="color:rgb(244, 126, 96);">${b.commentCount}</span></span> 
														<c:choose>
															<c:when test="${b.imageCheck eq 0}">
																<span class="attachcount"></span>
															</c:when>
															<c:otherwise>
																<span class="attachcount"><img src="/dc/resources/images/images.png" style="height: 17px; width: 17px;"></span>
															</c:otherwise>
														</c:choose>
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
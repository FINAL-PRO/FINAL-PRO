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

.category {
	float: left;
	padding-top: 10px;
	padding-left: 20px;
}

.food_btn {
	padding-top: 10px;
	float: right;
	padding-right: 20px;
}

.review {
	float: left;
}
 
.article{
	list-style: none;
}

.title {
	color: rgb(85, 85, 85);
	line-height: 1.4em;
	overflow: hidden;
	font-size: 1.4rem;
	vertical-align: middle;
	display: inline-block;
}

.title a {
	text-decoration: none;
	color: rgb(85, 85, 85);
}

.title a h3 {
	font-size: inherit;
	display: inline;
}

.point {
	line-height: 1.2em;
}

.address {
	color: lightslategray;
	display: inline-block;
	padding-left: 10px;
}

.short_review {
	display: inline-block;
}

.nickname {
	display: inline;
	padding-left: 20px;
	font-size: 0.8rem;
	color: rgb(85, 85, 85);
}

.time {
	display: inline;
	padding-left: 20px;
	font-size: 0.8rem;
	color: rgb(85, 85, 85);
}

.count {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: #292929;
	font-size: 12px;
}

.review_more{
	display: inline-block;
}

.thumb_review{
	display: inline-block;
	height: 200px; 
	width: 200px; 
	border: 1px solid green;
}

.thumb_review .center{
	height: 199px; 
	width: 200px; 
}

.board_review{
	display: inline-block;
	padding-left: 30px; 
	padding-top: 10px; 
	padding-right: 100px; 
	padding-bottom: 20px; 
	height: 200px; 
	width: 80%;
	border: 1px solid navy; 
	font-size: 0.8rem;
}

.article{
	border: 1px solid red;
	height: 200px; 
	display: flex;
	background:white;
  	opacity: 1.0;
}

.article:hover{
	opacity: 0.7;
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
							<h1>맛집게시판</h1>
						</div>
						<div class="dc-content-box">
							<div id="container2">
								<div class="food_top">
									<div class="category">
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
										location.href="${pageContext.request.contextPath}/community/food/list.do?tList="+tList;
									});
									
									</script>
									<div class="food_btn">
										<input type="button" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/community/food/foodInsertForm.do'" />
									</div>
								</div>
								<div class="articlelist">
									<ol class="group"><br><br>
										<p>총 ${totalContents}건의 게시물이 있습니다.</p>
										
										<c:forEach items="${flist}" var="b">
											<li class="groupin" id="${b.no}">
											<div class="article" onclick="location.href='${pageContext.request.contextPath}/community/food/foodView.do?bno=${b.no}';">
											
												<div class="thumb_review">
									            	<img class="center" src="https://mp-seoul-image-production-s3.mangoplate.com/646949_1523505282361983.jpg">
									          	</div>
												<div class="board_review">
										            <span class="title"> <h3>${b.title}</h3></span>
										            <p class="nickname">${b.memberName}</p>
													<p class="time">
														<fmt:formatDate value="${b.writeDate}" pattern="yyyy-MM-dd" />
													</p>
										            <br>
										            <strong class="point"><span>4.4</span></strong>
										            <p class="address">서울시 역삼동 삼역빌딩 102-78</p>
										            <br><br>
										            <c:choose>
														<c:when test="${b.imageCheck eq 0}">
															<span class="short_review">${b.content}</span>
														</c:when>
														<c:otherwise>
															<span class="content"><p>(이미지)</p></span>
														</c:otherwise>
													</c:choose>
										            <br><br>
										            <div class="count">조회수: ${b.viewCount}</div>&nbsp;&nbsp;
										            <div class="count">댓글: ${b.commentCount}</div>&nbsp;&nbsp;
										            <div class="count">좋아요: ${b.likeCount}</div>
												</div>
										
											</div><br /></li>
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
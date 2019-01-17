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

.category1 {
	float: left;
	padding-left: 20px;
}

.group {
	list-style: none;
	padding-left: 20px;
}

.food_btn {
	padding-top: 10px;
	float: right;
	padding-right: 5px;
}

.review {
	float: left;
}
 
.article{
	list-style: none;
}

.title {
	color: #000000;
	line-height: 1.4em;
	overflow: hidden;
	font-size: 16px;
	vertical-align: middle;
	display: inline-block;
	font-weight: bold;
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
	display: inline;
	padding-left: 10px;
	font-weight: bold;
	font-size: 14px;
}

.address {
	display: inline-block;
	padding-left: 10px;
	font-weight: bold;
	font-size: 14px;
}

.short_review {
	display: inline-block;
}

.nickname {
	display: inline-block;
	font-size: 1rem;
	color: rgb(85, 85, 85);
	padding-left: 5px;
	font-weight: bold;
}

.categoryName{
	display: inline;
	color:rgb(244, 126, 96);
	font-size: 0.8rem;
	font-weight: bold;
}
.time {
	display: inline;
	padding-left: 10px;
	font-size: 0.8rem;
	font-weight: bold;
}

.count {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	font-size: 12px;
	font-weight: bold;
}

.thumb_review{
	display: inline-block;
	height: 180px; 
	width: 200px; 
}

.thumb_review .center{
	height: 180px; 
	width: 200px; 
}

.board_review{
	display: inline-block;
	padding-left: 30px; 
	padding-top: 10px; 
	padding-right: 30px; 
	padding-bottom: 10px; 
	height: 180px; 
	width: 80%;
	font-size: 0.8rem;
}

.table_review{
	padding-top: 10px; 
	padding-right: 30px; 
	padding-bottom: 20px; 
}

.article{
	height: 180px; 
	display: flex;
	background:white;
  	opacity: 1.0;
}

.article:hover{
	opacity: 0.7;
	cursor: pointer;
}

p.profile>img.picture {
	width: 20px;
	height: 20px;
	display: inline-block;
}

.profile{
	display: inline-block;
}

.food_btn2{
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
							<span class="dc-title-text">맛집게시판</span>
						</div>
						<div class="dc-content-box">
							<div id="container2">
								<div class="food_top">
									<div class="category1">
										<select class="form-control input-sm" id="tList"> 
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
										<input class="btn food_btn2 btn-sm" type="button" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/community/food/foodInsertForm.do'" />
									</div>
								</div>
								<div class="articlelist">
									<ol class="group"><br><br>
										<p class="totalCount">총 ${totalContents}건의 게시물이 있습니다.</p>
										
										<c:forEach items="${flist}" var="b">
											<li class="groupin" id="${b.no}">
											<div class="article" onclick="location.href='${pageContext.request.contextPath}/community/food/foodView.do?bno=${b.no}';">
												<div class="thumb_review">
									            	<img id="center" class="center" src="${b.thumbnail}">
									            
									          	</div>
												<div class="board_review">
										            <span class="title"> <h3>${b.title}</h3></span>
										            <p class="profile">
											            <c:choose>
															<c:when test="${!empty b.profile}">
																<img class="picture" src="/dc/resources/upload/profile/${b.profile}" /> 
															</c:when>
															<c:otherwise>
																<img class="picture" src="/dc/resources/upload/profile/profileDefaultImg.png" /> 
															</c:otherwise>
														</c:choose>
										            <p class="nickname">${b.memberName}</p>
													<p class="time">
														<fmt:formatDate value="${b.writeDate}" pattern="yyyy-MM-dd" />
													</p>
										            <br>
										           	<p class="categoryName">${b.category}</p>
										            <p class="point">${b.point}/5</p>
										            <p class="address">${b.address}</p>
										            <br>
										            <div class="table_review">
										            <c:choose>
														<c:when test="${b.imageCheck eq 0}">
															<span class="short_review">${b.content}</span>
														</c:when>
														<c:otherwise>
															<span class="content"><p>(이미지)</p></span>
														</c:otherwise>
													</c:choose>
													</div>
										            <div class="count">조회수: <span style="color:rgb(244, 126, 96);">${b.viewCount}</span></div>&nbsp;&nbsp;
										            <div class="count">댓글: <span style="color:rgb(244, 126, 96);">${b.commentCount}</span></div>&nbsp;&nbsp;
										            <div class="count">좋아요: <span style="color:rgb(244, 126, 96);">${b.likeCount}</span></div>
												</div>
											</div>
											<div style="margin-top: 10px; margin-bottom: 10px; border: solid 0.5px gray"></div>												
											</li>
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
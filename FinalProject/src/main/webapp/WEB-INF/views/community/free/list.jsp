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

#container2 .barticle {
	font-size: 0;
	background-color: #fff;
	text-decoration: none;
}

.article>p.bprofile>img.bpicture {
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-botton: 5px;
}

.btitle {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: #292929;
	font-size: 15px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.bnickname {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: gray;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-right: 8px;
	margin-left: 8px;
}

.bcount {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: gray;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-right: 8px;
	margin-left: 8px;
	float: right;
}

.btime {
	float: right;
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: gray;
	font-size: 14px;
	font-weight: bold;
	margin-left: 8px;
}
 
.bpicture {
  vertical-align: top;
}

.bstatus span {
	display: inline-block;
	margin-right: 8px;
	line-height: 18px;
	color: gray;
	font-size: 14px;
	font-weight: bold;
} 

.bcontent {
	display: inline-block;
	color: #292929;
	font-size: 14px;
	width:80%;
	height: 28px;
	padding:0.5px;
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
}

.bcontent p{
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
	width:80%;
  	height: 28px;
}

p.battach {
	display: inline-block;
	float: right;
	margin-top: 8px;
}

.battachcount {
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

.bprofile{
	display: inline-block;
	width: 100%;
}

.bpicture{
	margin-left: 20px;
}

.free_btn2{
	background: rgb(171, 187, 129);
    color: white;
    cursor: pointer;
}

.btotalCount{
	font-size:14px; 
	font-weight: bold;
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
							<span class="dc-title-text">자유게시판</span>
						</div>
						<div class="dc-content-box">
							<div id="container2">
								<div class="free_top">
									<div class="form-inline">
										<div style="width:50%">
											<select class="form-control" id="tList"> 
												<option value="" selected disabled hidden>정렬</option>
												<option value="1">최신 순 정렬</option>
												<option value="2">댓글 많은 순 정렬</option>
												<option value="3">좋아요 순 정렬</option>
											</select>
										</div>
										
										<div style="width:50%">
											<c:if test="${!empty member}">
												<div class="free_btn">
													<input type="button" class="btn dc-btn dc-btn-right" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/community/free/freeInsertForm.do'" />
												</div>
											</c:if>
										</div>
									</div>
									<script>
									
									$("#tList").change(function(){
										var tList = $(this).val();
										console.log("tlist:"+tList);
										location.href="${pageContext.request.contextPath}/community/free/list.do?tList="+tList;
									});
									
									</script>

								</div>
								<div class="articlelist">
									<ol class="group"><br><br>
										<p class="btotalCount">총 <span style="color:rgb(244, 126, 96);">${totalContents}</span>건의 게시물이 있습니다.</p>
										<c:forEach items="${list}" var="b">
											<li class="groupin" id="${b.no}">
											<a class="article" href="${pageContext.request.contextPath}/community/free/freeView.do?bno=${b.no}">
													<p class="bprofile">
														<span class="btitle">${b.title}</span> 
														<c:choose>
															<c:when test="${!empty b.profile}">
																<img class="bpicture" src="/dc/resources/upload/profile/${b.profile}" /> 
															</c:when>
															<c:otherwise>
																<img class="bpicture" src="/dc/resources/upload/profile/profileDefaultImg.png" /> 
															</c:otherwise>
														</c:choose>
														<span class="bnickname">${b.memberName}</span> 
														<span class="bcount">조회수: ${b.viewCount}</span>
														<span class="btime">
															<fmt:formatDate value="${b.writeDate}" pattern="yyyy-MM-dd" />
														</span>
													</p>
													<c:choose>
														<c:when test="${b.imageCheck eq 0}">
															<div class="bcontent">${b.content}</div>
														</c:when>
														<c:otherwise>
															<span class="bcontent"><p>(이미지)</p></span>
														</c:otherwise>
													</c:choose>
													<p class="bstatus">
														<span class="bvotecount">좋아요: <span style="color:rgb(244, 126, 96);">${b.likeCount}</span></span> 
														<span class="bcommentcount">댓글: <span style="color:rgb(244, 126, 96);">${b.commentCount}</span></span> 
														<c:choose>
															<c:when test="${b.imageCheck eq 0}">
																<span class="battachcount"></span>
															</c:when>
															<c:otherwise>
																<span class="battachcount"><img src="/dc/resources/images/images.png" style="height: 17px; width: 17px;"></span>
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
		</div>
</body>
</html>
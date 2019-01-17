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

.article {
	font-size: 0;
	background-color: #fff;
	text-decoration: none;
}

.picture {
	display: inline-block;
	width: 20px;
	height: 20px;
	vertical-align: top;
	float: left;
}

.nickname {
	display: inline-block;
	line-height: 20px;
	color: #292929;
	font-size: 12px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	float: left;
}

.title {
	display: inline-block;
	line-height: 20px;
	color: #292929;
	font-size: 15px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
}

.count{
	display: inline-block;
	line-height: 20px;
	color: #292929;
	font-size: 12px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	float: right;
}

.time {
	float: right;
	display: inline-block;
	line-height: 20px;
	color: #292929;
	font-size: 12px;
	font-weight: bold;
	margin-left: 10px;
}

.text {
	margin-top: 8px;
	padding: 10px;
	line-height: 500px;
	color: #292929;
	font-size: 14px;
	word-wrap: break-word;
}

.comment {
	padding: 5px;
	line-height: 20px;
	color: #292929;
	font-size: 14px;
}

.status {
	float: right;
	padding: 10px;
}

.status span {
	display: inline-block;
	margin-right: 8px;
	line-height: 18px;
	color: #292929;
	font-size: 12px;
	background-repeat: no-repeat;
	background-size: 16px 16px;
} 


.attach {
	float: right;
	margin-top: 8px;
}

.article {
	display: block;
	padding: 12px 12px;
	border-bottom: 1px solid #f2f2f2;
	height: 140px;
}

.group {
	list-style: none;
	padding-top: 20px;
	padding-left: 5px;
	padding-right: 5px;
}

.commentgroup {
	padding: 20px;
}

.commnetlist {
	padding: 20px;
}

.commentwriteboard {
	padding: 15px 35px 10px 20px;
}

.commentwrite {
	width: 100%;
}

.comment_textarea {
	margin-right: 10px;
	margin-left: 10px;
}

hr {
	border: 0.3px solid rgb(178, 182, 187);
}

.category {
	float: left;
	padding-left: 20px;
}

.btn_comment {
	margin-top: 4px;
	float: right;
}

.both {
	margin-top: 0px;
	margin-bottom: 0px;
	height: 1px;
}

.commentbox{
	border: 1px solid yellow;
}

.likecount{
	margin: 5px;
}

.likecount2{
	border:none;
	width: 10px;
	color:rgb(244, 126, 96);
}

#btn_board_edit{
	background: rgb(171, 187, 129);
    color: white;
    cursor: pointer;
	
}

#btn_board_delete{
	background: rgb(171, 187, 129);
    color: white;
    cursor: pointer;
}

#btn_back{
	background: rgb(171, 187, 129);
    color: white;
    cursor: pointer;
    margin-top: 5px;
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
								<div class="articlelist">
									<form name="boardFrm" method="post">
										<input type="hidden" id="bno" name="bno" value="${boardList.no}"/>
										<input type="hidden" id="mno" name="mno" value="${member.no}"/>
									</form>
									<div class="group">
										<p class="title">${boardList.title}</p>
										<div style="border: solid 0.5px gray"></div>
										<p class="profile">
											<c:choose>
												<c:when test="${!empty boardList.profile}">
													<img class="picture" src="/dc/resources/upload/profile/${boardList.profile}" /> 
												</c:when>
												<c:otherwise>
													<img class="picture" src="/dc/resources/upload/profile/profileDefaultImg.png" /> 
												</c:otherwise>
											</c:choose>
											<span class="nickname">${boardList.memberName}</span> 
											<span class="time">
												<fmt:formatDate value="${boardList.writeDate}" pattern="yyyy-MM-dd" />
											</span>
											<span class="count">조회수: ${boardList.viewCount}</span>
										</p>
										<p class="text">${boardList.content}</p>
										<div style="border: solid 0.5px lightgray"></div>
										<div class="status">
											<c:if test="${!empty member and member.no eq boardList.memberNo}">
											<button class="btn btn_board_edit btn-sm" id="btn_board_edit">수정</button>
											<button class="btn btn_board_delete btn-sm" id="btn_board_delete">삭제</button>
											</c:if>
											<c:if test="${!empty member and member.no ne boardList.memberNo}">
											<input type="button" class="btn_report" id="btn_report" value="신고하기" onclick="javascript:btn_report();"/>
											</c:if>
											<span class="likecount">
											<a href="#" class="likefunc">
												<img src="/dc/resources/images/dislike.png" id="like_img" style="height: 17px; width: 17px;">
												: <input type="text" value="${boardList.likeCount}" class="likecount2" readonly/>
											</a></span>
											<input type="hidden" value="1" class="likecount3"/>
											<span class="commentcount">댓글: <span style="color:rgb(244, 126, 96);">${boardList.commentCount}</span></span>
										</div>

										<script>
										var bno = $('[name=bno]').val();
										var mno = $('[name=mno]').val();
											
										$(document).ready(function(){
											
											$.ajax({
												type: "post",
									   			url: "${pageContext.request.contextPath}/like/likeImages.do",
									   			data: { bno: bno,
									   					mno: mno },
									   			success: function(result){
									   				
													var like_img = "";
													
													console.log("result: "+result);
													
									   				if(result == 1){
									   					like_img = "/dc/resources/images/like.png";
									   				} else {
									   					like_img = "/dc/resources/images/dislike.png";
									   				}
													
													$('#like_img').attr('src', like_img); 
													$('#myModal').hide();
									   			}
											
											});
										}) 
											
										
										$('.likefunc').on('click', function(){	
											
											var likecount2 = parseInt($('.likecount2').val());
											var likecount3 = parseInt($('.likecount3').val());
											
											var likecount = likecount2 + likecount3;
											
											$.ajax({
												type: "post",
									   			url: "${pageContext.request.contextPath}/like/likecheck.do",
									   			data: { bno: bno,
									   					mno: mno },
									   			success: function(result){
												
									   				var like_img = "";

									   				if(result == 2){
									   					like_img = "/dc/resources/images/dislike.png";
									   					var likecount = likecount2 - likecount3;
									   				} else{
									   					like_img = "/dc/resources/images/like.png";
									   					var likecount = likecount2 + likecount3;
									   				}
									   				
									   				console.log("resultfunc: "+result)
									   			 											   				
								   					$('.likecount2').attr('value', likecount); 
									   				$('#like_img').attr('src', like_img);

									   			}
									   			
											});
											
											
											})
										
											function btn_report(){
												$('#myModal').show();
											}
											
											function reportInsert(){
											
												var reCheck = $('input:radio[name=category]:checked').val();
												console.log("reCheck: "+reCheck);
												
												$.ajax({
													type: "post",
										   			url: "${pageContext.request.contextPath}/report/reportInsert.do",
										   			data: { bno: bno,
										   					mno: mno,
										   					reCheck: reCheck},
										   			success: function(result){
										   				
													if(reCheck == undefined){
													    alert('옵션을 선택해주세요.');
													} else {
													    alert("신고 되었습니다.");
													    
													    if(result == 1){
													    	$('#myModal').hide();
													    }
													} 
													
												}
												
											});
												
											}
										
											function close_box(flag) {
									             $('#myModal').hide();
									        };

											
				                      		$("#btn_board_edit").click(function(){
				                      			boardFrm.action="${pageContext.request.contextPath}/community/free/freeUpdateForm.do?no=${board.no}"
				                      			boardFrm.submit();
				                      		});
				                      		
				                      		$("#btn_board_delete").click(function(){
				                      			boardFrm.action="${pageContext.request.contextPath}/community/free/freeDelete.do?no=${board.no}"
				                       			boardFrm.submit();
				                      		});
				                          	
				                       </script>
										<p class="both" style="clear: both;">&nbsp;</p>
									</div>
									<div style="border: solid 0.5px gray"></div>
									<!--  댓글  -->
								    <div class="container3">
								        <c:import url="../../common/comment.jsp" />
									</div>
									<button class="btn btn_back btn-sm" id="btn_back">Back</button> 
									<script>
					                    $("#btn_back").click(function(){
					                    	location.href="${pageContext.request.contextPath}/community/free/list.do";
					                    });
				                    </script>
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
		</div>
		<c:import url="../../common/footer.jsp" />
</body>
</html>
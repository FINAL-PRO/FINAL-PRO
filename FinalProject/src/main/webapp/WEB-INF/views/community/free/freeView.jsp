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
	
	.time {
		float: right;
		display: inline-block;
		line-height: 20px;
		color: #a6a6a6;
		font-size: 12px;
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
	
	span {
		display: inline-block;
		margin-right: 8px;
		padding-left: 10px;
		line-height: 18px;
		color: #a6a6a6;
		font-size: 12px;
		background-repeat: no-repeat;
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
	
	.articlelist {
		padding-top: 15px;
	}
	
	.group {
		list-style: none;
		padding-top: 20px;
		padding-left: 20px;
		padding-right: 20px;
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
								<div class="articlelist" style="border: solid 0.5px red">
									<form name="boardFrm" method="post">
										<input type="text" id="bno" name="bno" value="${board.no}" readonly="readonly" />
									</form>
									<div class="group" style="border: solid 0.5px blue">
										<p class="title">${board.title}</p>
										<div style="border: solid 0.5px gray"></div>
										<p class="profile">
											<img class="picture" src="https://cf-epi.campuspick.com/0.png"> 
											<span class="nickname">${board.memberName}</span> 
											<span class="count">조회수: ${board.viewCount}</span>
											<p class="time"><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
										</p>
										<p class="text">${board.content}</p>
										<div style="border: solid 0.5px lightgray"></div>
										<div class="status" style="border: solid 0.5px orange">
											<button class="btn_board_edit" id="btn_board_edit">수정</button>
											<button class="btn_board_delete" id="btn_board_delete">삭제</button>
											<button class="btn_report">신고하기</button>
											<c:choose>
												<c:when test="${mno ne null}">
													<a href="javascript: like_func(${board.no});"><img src="./resources/images/dislike.png" id="like_img"></a>
												</c:when>
												<c:otherwise>
													<img src="/resources/images/dislike.png" id="like_img">
													<span class="likecount">: ${boardList.likeCount}</span>
													<input type="text" value="${boardList.no}" />
												</c:otherwise>
											</c:choose>
										<%-- 	<a href="#" onclick="likecount(${board.no});">좋아요</a>
											<span class="likecount">: ${likecount}</span>  --%>
											<span class="commentcount">댓글:${like.no}</span>
										</div>
										<script>
											var bno = bno.val();
										
											function like_func(bno){
												
												console.log("bno:"+bno);
												
												$.ajax({
													type: "get",
										   			url: "${pageContext.request.contextPath}/like/likecheck.do",
										   			data: {bno: bno},
										   			cache: false,
										   			dataType: "json",
										   			success: function(data){
													
										   				var msg = "";
										   				var like_img = "";
										   				
										   				msg += data.msg;
										   				alert(msg);
										   				
										   				if(data.likeInsert == 0){
										   					like_img = "/images/dislike.png";
										   				} else {
										   					like_img = "/images/like.png";
										   				}
										   				
														$('#likecount').html(data.likecount);
														$('#likeInsert').html(data.likeInsert);
										   					
										   			}
										   				
										   				
												});
												
												
											}
											
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
									<button class="btn_back" id="btn_back">Back</button> 
									<script>
					                    $("#btn_back").click(function(){
					                    	boardFrm.action="${pageContext.request.contextPath}/community/free/list.do"
					                    	boardFrm.submit();
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
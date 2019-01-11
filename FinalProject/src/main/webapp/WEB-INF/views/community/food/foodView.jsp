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
		padding-left: 5px;
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
	
	.likecount2{
		border:none;
		width: 10px;
	}
	
	.starRev{
		padding-top: 10px;
		float: left;
	}
	
	.starR1{
        background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	    padding: 0px;
	    margin: 0px;
	}
	.starR2{
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	    padding: 0px;
	}
	.starR1.on{background-position:0 0;}
	.starR2.on{background-position:-15px 0;}
	
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
								<div class="articlelist" style="border: solid 0.5px red">
									<form name="boardFrm" method="post">
										<input type="hidden" name="bno" value="${boardList.no}"/>
										<input type="hidden" name="mno" value="${member.no}"/>
									</form>
									<div class="group" style="border: solid 0.5px blue">
										<p class="title">${boardList.title}</p>
										<div style="border: solid 0.5px gray"></div>
										<p class="profile">
											<img class="picture" src="https://cf-epi.campuspick.com/0.png"> 
											<span class="nickname">${boardList.memberName}</span> 
											<span class="count">조회수: ${boardList.viewCount}</span>
											<p class="time"><fmt:formatDate value="${boardList.writeDate}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
										</p>
										<div class="starRev" style="width: 100%;">
										  <span class="starR1 on">0</span>
										  <span class="starR2">1</span>
										  <span class="starR1">1.5</span>
										  <span class="starR2">2</span>
										  <span class="starR1">2.5</span>
										  <span class="starR2">3</span>
										  <span class="starR1">3.5</span>
										  <span class="starR2">4</span>
										  <span class="starR1">4.5</span>
										  <span class="starR2">5</span>
										</div>
										<div>
											주소: ${food.address}
										</div>
										<p class="text">${boardList.content}</p>
										<div style="border: solid 0.5px lightgray"></div>
										<div>
										<div style="height:12px;"></div>
										<div class="status" style="border: solid 0.5px orange">
											<button class="btn_board_edit" id="btn_board_edit">수정</button>
											<button class="btn_board_delete" id="btn_board_delete">삭제</button>
											<!-- <button class="btn_report" id="btn_report">신고하기</button> -->
											<input type="button" class="btn_report" id="btn_report" value="신고하기" onclick="btn_report();"/>
											<span class="likecount">
											<a href="#" class="likefunc">
												<img src="/dc/resources/images/dislike.png" id="like_img" style="height: 17px; width: 17px;">
												: <input type="text" value="${boardList.likeCount}" class="likecount2" readonly/>
											</a></span>
											<input type="hidden" value="1" class="likecount3"/>
											<span class="commentcount">댓글: ${boardList.commentCount}</span>
										</div>
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
									        
									        $('.starRev span').click(function(){
									        	  $(this).parent().children('span').removeClass('on');
									        	  $(this).addClass('on').prevAll('span').addClass('on');
									        	  
									        	  var star = $(this).parent().children('span').val();
									        	  
									        	  console.log("별 값: "+star);
									        	  return false;
									        });
											
				                      		$("#btn_board_edit").click(function(){
				                      			boardFrm.action="${pageContext.request.contextPath}/community/food/foodUpdateForm.do?no=${board.no}"
				                      			boardFrm.submit();
				                      		});
				                      		
				                      		$("#btn_board_delete").click(function(){
				                      			boardFrm.action="${pageContext.request.contextPath}/community/food/foodDelete.do?no=${board.no}"
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
					                    	/* boardFrm.action="${pageContext.request.contextPath}/community/food/list.do"
					                    	boardFrm.submit(); */
					                    	location.href="${pageContext.request.contextPath}/community/food/list.do";
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
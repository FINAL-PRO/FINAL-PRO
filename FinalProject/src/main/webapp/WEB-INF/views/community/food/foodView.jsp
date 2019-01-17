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

.fpicture {
	display: inline-block;
	width: 20px;
	height: 20px;
	vertical-align: top;
}

.fcount{
	float: right;
	display: inline-block;
	line-height: 20px;
	color: #292929;
	font-size: 14px;
	font-weight: bold;
}

.fnickname {
	display: inline-block;
	line-height: 20px;
	color: #292929;
	font-size: 14px;
	white-space: nowrap;
	overflow: hidden;
	float: left;
	font-weight: bold;
}

.ftitle {
	display: inline-block;
	line-height: 20px;
	color: #292929;
	font-size: 16px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
}

.ftime {
	float: right;
	display: inline-block;
	color: #292929;
	font-size: 14px;
	margin-right:10px;
	font-weight: bold;
}

.faddress{
	color: #292929;
	font-size: 14px;
	font-weight: bold;
}

.fpoint{
	color: #292929;
	font-size: 14px;
	font-weight: bold;
}

.category1{
	margin-top: 10px;
	color: #292929;
	font-size: 14px;
	font-weight: bold;
}

.ftext {
	margin-top: 8px;
	padding: 10px;
	line-height: 500px;
	color: #292929;
	font-size: 14px;
	word-wrap: break-word;
	padding-left:10px;
}

.fcomment {
	padding: 5px;
	line-height: 20px;
	color: #292929;
	font-size: 14px;
}

.fstatus {
	float: right;
	font-weight: bold;
	color: #292929;
	font-size: 14px;
	margin-top: 5px;
	margin-bottom: 5px;
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
	padding-left: 20px;
	padding-right: 20px;
}

hr {
	border: 0.3px solid rgb(178, 182, 187);
}

.category {
	float: left;
}


.both {
	margin-top: 0px;
	margin-bottom: 0px;
	height: 1px;
}

.fcommentbox{
	border: 1px solid yellow;
}

.likecount2{
	border:none;
	width: 10px;
}

.fprofile{
	display: inline-block;
	width: 100%;
}

.likecount2{
	border:none;
	width: 10px;
	color:rgb(244, 126, 96);
	font-weight: bold;
}

.starRev{
	padding-top: 10px;
	float: left;
	display: inline-block;
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

#btn_report{
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
								<div class="articlelist">
									<form name="boardFrm" method="post">
										<input type="hidden" name="bno" value="${foodList.no}"/>
										<input type="hidden" name="mno" value="${member.no}"/>
										<input type="hidden" name="fno" value="${foodList.fno}"/>
									</form>
									<div class="group">
										<span class="ftitle">${foodList.title}</span>
										<div style="border: solid 0.5px gray"></div>
										<p class="fprofile">
											<c:choose>
												<c:when test="${!empty foodList.profile}">
													<img class="fpicture" src="/dc/resources/upload/profile/${foodList.profile}" /> 
												</c:when>
												<c:otherwise>
													<img class="fpicture" src="/dc/resources/upload/profile/profileDefaultImg.png" /> 
												</c:otherwise>
											</c:choose>
											<span class="fnickname">${foodList.memberName}</span> 
											<span class="fcount">조회수: ${foodList.viewCount}</span>
											<span class="ftime">
												<fmt:formatDate value="${foodList.writeDate}" pattern="yyyy-MM-dd" />
											</span>
										</p>
										
										<p class="category1">카테고리: ${foodList.category}</p>
										<p class="faddress">주소: ${foodList.address}</p>
										<p class="fpoint">평가자 평점: ${foodList.point} 점</p>
										
										<p class="ftext">${foodList.content}</p>
										<div style="border: solid 0.5px lightgray"></div>
										<div class="fstatus">
											<c:if test="${!empty member and member.no eq foodList.memberNo}">
											<button class="btn btn_board_edit btn-sm" id="btn_board_edit">수정</button>
											<button class="btn btn_board_delete btn-sm" id="btn_board_delete">삭제</button>
											</c:if>
											<c:if test="${!empty member and member.no ne foodList.memberNo}">
											<input type="button" class="btn btn_report btn-sm" id="btn_report" value="신고하기" onclick="btn_report();"/>
											</c:if>
											<span class="flikecount">
											<a href="#" class="likefunc">
												<img src="/dc/resources/images/dislike.png" id="like_img" style="height: 17px; width: 17px;">
												: <input type="text" value="${foodList.likeCount}" class="likecount2" readonly/>
											</a>
											</span>
											<input type="hidden" value="1" class="likecount3"/>
											<span class="fcommentcount">댓글: <span style="color:rgb(244, 126, 96);">${foodList.commentCount}</span></span>
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

				                      		$("#btn_board_edit").click(function(){
				                      			boardFrm.action="${pageContext.request.contextPath}/community/food/foodUpdateForm.do?bno=${foodList.no}"
				                      			boardFrm.submit();
				                      		});
				                      		
				                      		$("#btn_board_delete").click(function(){
				                      			boardFrm.action="${pageContext.request.contextPath}/community/food/foodDelete.do?bno=${foodList.no}"
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
					                    	location.href="${pageContext.request.contextPath}/community/food/list.do";
					                    });
				                    </script>
								</div>
							</div>
						</div>
					</div>
				<div class="section-right">
					<c:import url="../../common/rightSection.jsp" />
				</div>
				</div>
			</section>
			</main>
		</div>
		</div>
		<c:import url="../../common/footer.jsp" />
</body>
</html>
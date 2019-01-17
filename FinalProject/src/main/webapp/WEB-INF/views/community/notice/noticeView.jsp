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
	background-color: #fff;
	text-decoration: none;
	display: block;
	padding: 12px 12px;
	border-bottom: 1px solid #f2f2f2;
	height: 140px;
}

/* .npicture {
	display: inline-block;
	width: 20px;
	height: 20px;
	vertical-align: top;
} */

.nnickname {
	display: inline-block;
	line-height: 20px;
	color: #292929;
	font-size: 14px;
	font-weight: bold;
	float: left;
}

.ncount{
	display: inline-block;
	line-height: 20px;
	color: #292929;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	float: right;
}

.ntitle {
	display: inline-block;
	color: #292929;
	font-size: 16px;
	font-weight: bold;
}

.ntitle p{
	magin: 0px;
}

.ntime {
	float: right;
	display: inline-block;
	line-height: 20px;
	color: #292929;
	font-size: 14px;
	font-weight: bold;
	margin-left: 10px;
}

.ntext {
	margin-top: 10px;
	padding: 10px;
	line-height: 500px;
	color: #292929;
	font-size: 14px;
	word-wrap: break-word;
}

.ncomment {
	padding: 5px;
	line-height: 20px;
	color: #292929;
	font-size: 14px;
	font-weight: bold;
}

.nstatus {
	float: right;
}

.nstatus span {
	display: inline-block;
	margin-right: 8px;
	line-height: 18px;
	color: #292929;
	font-size: 14px;
	font-weight: bold;
} 

.nattach {
	float: right;
	margin-top: 8px;
}


.articlelist {
	padding-top: 15px;
}

.group {
	list-style: none;
	padding-top: 20px;
	padding-left: 5px;
	padding-right: 5px;
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
							<h1>공지사항</h1>
						</div>
						<div class="dc-content-box">
							<div id="container2">
								<div class="articlelist">
									<form name="boardFrm" method="post">
										<input type="hidden" id="bno" name="bno" value="${boardList.no}"/>
									</form>
									<div class="group">
										<p class="ntitle">${boardList.title}</p>
										<div style="border: solid 0.5px gray"></div>
										<p class="nprofile">
											<span class="nnickname">관리자</span> 
											<span class="ntime">
												<fmt:formatDate value="${boardList.writeDate}" pattern="yyyy-MM-dd" />
											</span>
											<span class="ncount">조회수: ${boardList.viewCount}</span>
										</p>
										<p class="ntext">${boardList.content}</p>
										<div style="border: solid 0.5px lightgray"></div>
										<div class="nstatus">
											<c:if test="${boardList.memberName eq 'admin'}">
												<button class="btn_board_edit" id="btn_board_edit">수정</button>
												<button class="btn_board_delete" id="btn_board_delete">삭제</button>
											</c:if>
											<span class="commentcount">댓글: <span style="color:rgb(244, 126, 96);">${boardList.commentCount}</span></span>
										</div>

										<script>			
				                      		$("#btn_board_edit").click(function(){
				                      			location.href="${pageContext.request.contextPath}/community/notice/noticeUpdateForm.do?no=${board.no}"
				                      		});
				                      		
				                      		$("#btn_board_delete").click(function(){
				                      			location.href="${pageContext.request.contextPath}/community/notice/noticeDelete.do?no=${board.no}"
				                      		});
				                          	
				                       </script>
										<p class="both" style="clear: both;">&nbsp;</p>
									</div>
									<div style="border: solid 0.5px gray"></div>
									<!--  댓글  -->
								    <div class="container3">
								        <c:import url="../../common/comment.jsp" />
									</div>
									<button class="btn btn_back btn-sm" id="btn_back">목록</button> 
									<script>
					                    $("#btn_back").click(function(){
					                    	location.href="${pageContext.request.contextPath}/community/notice/list.do"
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
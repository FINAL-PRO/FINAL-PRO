<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
	<title>게시글 상세페이지</title>
	<c:import url="../../common/header.jsp"/>

</head>
	
<body class="boay_style">
	<c:import url="../../common/menubar.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jobBoard/jobBoardDetailCss.css" />
	<div class="wrap_inner">
	<main id="container">
		<section>
			<div class="section-left">
				<!-- 내용없음 -->
			</div>
			<div class="section-center">
			<div class="dc-content">
				
				<div class="dc-content-box">
					<div class="dc-content-detail">
					<div class="dc-content-title">${jobBoard.title}</div>
					<div id="jobBoard" class="table">	
						<div class="jb-nickDate">
						<a href="#"><span data-toggle="collapse" data-target="#demo">
							<label class="inlie-t">작성자</label>${jobBoard.nickName}</span></a>
						<div id="demo" class="collapse">
						
						<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="">작성글 보기</a>&nbsp;|&nbsp;<span onclick="sendMsg();"><a href="">쪽지보내기</a></span></div>
						</div></div>
						<div class="float">
						<label class="inlie-t">
						작성일
						</label><div class="inline">
						${jobBoard.writeDate}</div>	
						<label class="inlie-t">조회수</label><div class="inline">
						${jobBoard.viewCount}</div><br />
						<label class="inlie-t">근무장소</label><div class="inline"> 
						${jobBoard.location}&nbsp;&nbsp;<span onclick="locPop();"><a href="">
						<img src="${pageContext.request.contextPath}/resources/icons/locSearch.png" id="msgIcon"/>
						</a></span> </div>
						<label class="inlie-t">구인구직타입</label><div class="inline">${jobBoard.type}</div><br />	
						<!-- 모집시작/마감일 -->
						<label class="inlie-t">모집시작/마감일 </label><div class="inline"> ${jobBoard.startDate} ~ ${jobBoard.endDate}</div>
						<!-- 근무시작/종료일 -->
						<label class="inlie-t">근무시작/종료일</label><div class="inline"> ${jobBoard.startJob} ~ ${jobBoard.endJob}</div><br />
						<!-- 급여/급여타입 -->
						<label class="inlie-t">급여/급여타입</label><div class="inline"> ${jobBoard.salary} / 
						<c:if test="${'SALTYPE001' eq jobBoard.salType}">시급</c:if>
						<c:if test="${'SALTYPE002' eq jobBoard.salType}">일급</c:if>
						<c:if test="${'SALTYPE003' eq jobBoard.salType}">주급</c:if>
						<c:if test="${'SALTYPE004' eq jobBoard.salType}">월급</c:if>
						<c:if test="${'SALTYPE005' eq jobBoard.salType}">연봉</c:if>
						</div>
						
						<label class="inlie-t">마감일</label><div class="inline">${jobBoard.dday}일 남음</div>
						</div>
						<div class="jb-content">${jobBoard.content}</div>
						<c:import url="../../common/comment.jsp" />
					
						<br /><button class="btn btn-outline-info" 
							onclick="location.href='${pageContext.request.contextPath}/job/jobBoard/jobBoardList.do'">목록</button>
						
						<c:if test="${member.no eq jobBoard.memberNo}">
						<button class="btn btn-outline-info" type="button" 
							onclick="location.href='${pageContext.request.contextPath}/job/jobBoard/updateJobBoardForm.do?no=${jobBoard.no}'">수정</button>
						<button class="btn btn-outline-info" type="button" 
							onclick="location.href='${pageContext.request.contextPath}/job/jobBoard/endJobBoard.do?boardNo=${jobBoard.boardNo}'">조기마감</button>
						<button class="btn btn-outline-info" type="button" 
							onclick="location.href='${pageContext.request.contextPath}/job/jobBoard/deleteJobBoard.do?boardNo=${jobBoard.boardNo}'">삭제</button>
						</c:if>	
					</div>
					</div>
				</div>	
			</div>
			</div>	
			<div class="section-right">
				<c:import url="../../common/rightSection.jsp"/>
			</div>				
		</section>
	</main>			
	</div>
	<c:import url="../../common/footer.jsp"/>
	<script>
		function sendMsg() {
			window.open("${pageContext.request.contextPath}/message/messageInsertForm.do?fromMember=${jobBoard.nickName}", "msgPop", "width=700, height=600");
		}
		function locPop(){
			window.open("https://map.naver.com/?query=${jobBoard.location}", "locPop", "width=700, height=600");
		}
	</script>	
</body>
</html>
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
	
<body>
	<c:import url="../../common/menubar.jsp"/>
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
					<h1>구인구직 게시판 상세페이지</h1>
					<div id="jobBoard" class="table">			
						<div>${jobBoard.no}</div>
						<div>${jobBoard.title}</div>
						<div>${jobBoard.content}</div>
						<div>${jobBoard.nickName}</div>
						<div>${jobBoard.writeDate}</div>
						<div>${jobBoard.location}</div>
						<div>${jobBoard.companyNo}</div>
						<!-- 모집시작/마감일 -->
						<div>${jobBoard.startDate}</div>
						<div>${jobBoard.endDate}</div>
						<div>${jobBoard.startDate} ~ ${jobBoard.endDate}</div>
						<!-- 근무시작/종료일 -->
						<div>${jobBoard.startJob}</div>
						<div>${jobBoard.endJob}</div>
						<div>${jobBoard.startJob} ~ ${jobBoard.endJob}</div>
						<!-- 급여/급여타입 -->
						<div>${jobBoard.salary} / ${jobBoard.salType}</div>
						<div>${jobBoard.status}</div>
						<div>${jobBoard.viewCount}</div>
						<div>${jobBoard.type}</div>
						<div>${jobBoard.dday}일 남음</div>
						
						<button class="btn btn-outline-info" type="button" 
							onclick="location.href='${pageContext.request.contextPath}/job/jobBoard/jobBoardList.do'">목록</button>
						<button class="btn btn-outline-info" type="button" 
							onclick="location.href='${pageContext.request.contextPath}/job/jobBoard/updateJobBoardForm.do?no=${jobBoard.no}'">수정 페이지</button>
						<button class="btn btn-outline-info" type="button" 
							onclick="location.href='${pageContext.request.contextPath}/job/jobBoard/deleteJobBoard.do?boardNo=${jobBoard.boardNo}'">조기마감하기</button>
						
						<button class="btn btn-outline-info" type="button" 
							onclick="location.href='${pageContext.request.contextPath}/job/jobBoard/deleteJobBoard.do?boardNo=${jobBoard.boardNo}'">삭제 페이지</button>
					</div>
					<c:import url="../../common/comment.jsp" />
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
</body>
</html>
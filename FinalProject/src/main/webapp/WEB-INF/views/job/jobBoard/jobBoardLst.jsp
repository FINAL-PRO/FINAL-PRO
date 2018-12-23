<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구인구직 게시판</title>
	<c:import url="../../common/header.jsp"/>
</head>
<body>
	<div id="container">
		<c:import url="../../common/menubar.jsp"/>
		<section id="content">
			<h1>구인구직 게시판</h1>
			<p>총 0건의 게시물이 있습니다.</p>
			<input type="button" value="글쓰기" id="btn-add" class="btn" onclick="addJobBoard();"/>
			<div id="job-board" class="job-table">
				<div>
					<div>번호</div>
					<div>제목</div>
					<div>작성자</div>
					<div>작성일</div>
					<div>모집기간</div>
					<div>근무기간</div>
					<div>급여</div>
					<div>마감여부</div>
					<div>조회수</div>
				</div>
			
				<c:forEach items="${list}" var="jb">
				<div id="${jb.boardNo}"> 
					<div>${jb.boardNo}</div>
					<div>${jb.title}</div>
					<div>${jb.memberNo}</div>
					<div>${jb.writeDate}</div>
					<div>${jb.startDate} - ${jb.endDate}</div>
					<div>${jb.startJob} - ${jb.endJob}</div>
					<div>${jb.salary} / ${salType}</div>
					<c:if test="${jb.status ='일반'}">
						<div>${jb.status}</div>
					</c:if>
					<div>${jb.viewCount}</div>
					
				</div>
				</c:forEach>

			</div>
			
			
		</section>
		<c:import url="../../common/footer.jsp"/>
	</div>
</body>
</html>
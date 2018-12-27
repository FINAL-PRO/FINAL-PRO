<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구인구직 게시판 목록</title>
	<style>
    .jobBoard {
      display: table;
      border : 1px solid black;
      }
 
    .columName  {
    	display: table-row;
    	background: lightgreen;
    	border : 1px solid black;
      }
    .colum {
    	display: table-row;
    	border : 1px solid black;
    }  
 
    .cell {
      display: table-cell;
      border : 1px solid black;
      }
    </style>
	<script>
		function jobBoardInsert(){
			location.href = "${pageContext.request.contextPath}/job/jobBoard/jobBoardInsertForm.do?no=${member.no}";
		};
		
		$(function(){
			$("div[id]").on("click",function(){
				var no = $(this).attr("id");
				console.log("no="+no);
				location.href = "${pageContext.request.contextPath}/board/boardView.do?no="+no;
			});
		});
	</script>
	<c:import url="../../common/header.jsp"/>
</head>
<body>
	<c:import url="../../common/menubar.jsp"/>
	<div class="wrap_inner">
	<main id="container">
		<section>
			<div class="section-left">
			<!-- <a href="test/select.do">select test</a> -->
				<img class="adimg" src="${pageContext.request.contextPath}/resources/images/adimg1.jpg" 
				alt="메인_좌측_세로배너" width="140" height="800"
				style="margin-left: 1px;margin-right: 1px; margin-top:60px; margin-bottom:60px;
				border:1px solid red"/>
			</div>
			
			<div class="section-center">
				<div id="jobBoard" class="table">
					
					<section id="content">
						<h1>구인구직 게시판</h1>
						<nav></nav>
						
						<p>총 ${totalContents}건의 게시물이 있습니다.</p>
						<div id="job-board" class="jb-table">
							<div class="columName">
								<div id="no" class="cell">번호</div>
								<div id="title" class="cell">제목</div>
								<div id="nickName" class="cell">작성자</div>
								<div id="writeDate" class="cell">작성일</div>
								<!-- <div id="startJob" class="cell">근무시작일</div>
								<div id="endJob" class="cell">근무종료일</div> -->
								<div id="workDate" class="cell">근무기간</div>
								<!-- <div id="salary" class="cell">급여</div>
								<div id="salType" class="cell">급여타입</div> -->
								<div id="salInfo" class="cell">급여</div>
								
								<div id="status" class="cell">마감여부</div>
								<div id="endJobDday" class="cell">마감일</div>
								<div id="viewCount" class="cell">조회수</div>
								<div id="hide/work" class="cell">구인구직여부</div>	
							</div>
							<c:forEach items="${list}" var="jb">
							<div id="${jb.no}" class="colum"> 
								<div class="cell">${jb.no}</div>
								<div class="cell">
									<a href="${pageContext.request.contextPath}/job/jobBoard/jobBoardDetail.do?no=${jb.no}";>${jb.title}</a></div>
								<div class="cell"><a href="작성글 검색뜨게하기">${jb.nickName}</a></div>
								<div class="cell">${jb.writeDate}</div>
								<!-- 근무시작/종료일 -->
								<%-- <div class="cell">${jb.startJob}</div>
								<div class="cell">${jb.endJob}</div> --%>
								<div class="cell">${jb.startJob} ~ ${jb.endJob}</div>
								<!-- 급여/급여타입 -->
								<%-- <div class="cell">${jb.salary}</div>
								<div class="cell">${jb.salType}</div> --%>
								<div class="cell">${jb.salary} / ${jb.salType}</div>
								<div class="cell">${jb.status}</div>
								<div class="cell">${jb.dday}일 남음</div>
								<div class="cell">${jb.viewCount}</div>
								<div class="cell">${jb.type}</div>		
							</div>
							</c:forEach>				
						</div>
						<input type="button" value="글쓰기" id="btn-add" class="btn" onclick="jobBoardInsert();"/>
						<c:out value="${pageBar}" escapeXml="false"/>
					</div>
				</div>
						<div class="section-right">
			<img class="adimg" src="${pageContext.request.contextPath}/resources/images/adimg1.jpg" 
			alt="메인_우측_세로배너" width="140" height="800"
			style="margin-left: 1px;margin-right: 1px; margin-top:60px; margin-bottom:60px;
			border:1px solid red"/></div>
		</section>	
		<c:import url="../../common/footer.jsp"/>
		</main>
	</div>
</body>
</html>
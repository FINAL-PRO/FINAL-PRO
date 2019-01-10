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

	</script>
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
						<h1>구인구직 게시판</h1>
						<nav></nav>
						<!-- 날짜/조회순 정렬 -->
						<select id="arrayType" name="arrayType">
							<option value="B.WRITEDATE" <c:if test="${arrayType == B.WRITEDATE}">selected</c:if>>최신순</option>
							<option value="B.VIEWCOUNT" <c:if test="${arrayType == B.VIEWCOUNT}">selected</c:if>>조회순</option>
						</select>
						<!-- 구인/구직만 보기 -->
						<select id="type" name="type">
							<option value="selAll">전체</option>
							<c:forEach items="${typeList}" var="type_one">
								<option value="${type_one.id}" <c:if test="${type_one.id eq type}">selected</c:if>>${type_one.value}</option>
							</c:forEach>
						</select>
						<!-- 정규/비정규/파트 만 보기 -->
						<select id="jobType" name="jobType">
							<option value="selAllJob">전체</option>
							<c:forEach items="${jobTypeList}" var="job">
								<option value="${job.id}" <c:if test="${job.id eq jobType}">selected</c:if>>${job.value}</option>
							</c:forEach>
						</select>
						<select id="salType" name="salType">
							<option value="selAllSel">전체</option>
							<c:forEach items="${salTypeList}" var="sal">
								<option value="${sal.id}" <c:if test="${sal.id eq salType}">selected</c:if>>${sal.value}</option>
							</c:forEach>
						</select>
					<script>
						
						$("#arrayType").on('change',function() {
							location.href = "${pageContext.request.contextPath}/job/jobBoard/jobBoardList.do?arrayType="
									+ $("#arrayType").val() 
									+ "&type=" + $("#type").val() 
									+ "&jobType=" + $("#jobType").val()
									+ "&salType=" + $("#salType").val();
						});
						$("#type").on('change',function() {
							location.href = "${pageContext.request.contextPath}/job/jobBoard/jobBoardList.do?arrayType="
									+ $("#arrayType").val() 
									+ "&type=" + $("#type").val() 
									+ "&jobType=" + $("#jobType").val()
									+ "&salType=" + $("#salType").val();
						});
						$("#jobType").on('change',function() {
							location.href = "${pageContext.request.contextPath}/job/jobBoard/jobBoardList.do?arrayType="
									+ $("#arrayType").val() 
									+ "&type=" + $("#type").val() 
									+ "&jobType=" + $("#jobType").val()
									+ "&salType=" + $("#salType").val();
						});
						$("#salType").on('change',function() {
							location.href = "${pageContext.request.contextPath}/job/jobBoard/jobBoardList.do?arrayType="
									+ $("#arrayType").val() 
									+ "&type=" + $("#type").val() 
									+ "&jobType=" + $("#jobType").val()
									+ "&salType=" + $("#salType").val();
						});
					</script>
						
						<p>총 ${totalContents}건의 게시물이 있습니다.</p>
						<div id="job-board" class="jb-table">
							<div class="columName">
								<div id="no" class="cell">번호</div>
								<div id="title" class="cell">제목</div>
								<div id="nickName" class="cell">작성자</div>
								<div id="writeDate" class="cell">작성일</div>
								<div id="workDate" class="cell">근무기간</div>
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
									<a href="${pageContext.request.contextPath}/job/jobBoard/jobBoardDetail.do?no=${jb.no}">${jb.title}</a></div>
								<div class="cell"><a href="${pageContext.request.contextPath}/job/jobBoard/jobBoardListOne.do?memberNo=${jb.memberNo}">${jb.nickName}</a></div>
								<div class="cell">${jb.writeDate}</div>
								<div class="cell">${jb.startJob} ~ ${jb.endJob}</div>
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
			</div>	
			<div class="section-right">
				<c:import url="../../common/rightSection.jsp"/>
			</div>	
		</section>	
		<c:import url="../../common/footer.jsp"/>
		</main>
	</div>
</body>
</html>
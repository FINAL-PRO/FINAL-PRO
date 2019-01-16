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
	

	<c:import url="../../common/header.jsp"/>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jobBoard/jobBoardListCss.css" />
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
						<h3>구인구직 게시판</h3>
					</div>
					<div class="dc-content-box">
					
					
					<div class="arrayType" >
						<c:if test="${searchCont eq null}">
						<!-- 날짜/조회순 정렬 -->
						<select class="cArray" id="arrayType" name="arrayType">
							<option value="B.WRITEDATE" <c:if test="${arrayType == B.WRITEDATE}">selected</c:if>>최신순</option>
							<option value="B.VIEWCOUNT" <c:if test="${arrayType == B.VIEWCOUNT}">selected</c:if>>조회순</option>
						</select>
						<!-- 구인/구직만 보기 -->
						<select class="cArray" id="type" name="type">
							<option value="selAll">전체</option>
							<c:forEach items="${typeList}" var="type_one">
								<option value="${type_one.id}" <c:if test="${type_one.id eq type}">selected</c:if>>${type_one.value}</option>
							</c:forEach>
						</select>
						<!-- 정규/비정규/파트 만 보기 -->
						<select class="cArray" id="jobType" name="jobType">
							<option value="selAllJob">전체</option>
							<c:forEach items="${jobTypeList}" var="job">
								<option value="${job.id}" <c:if test="${job.id eq jobType}">selected</c:if>>${job.value}</option>
							</c:forEach>
						</select>
						<select class="cArray" id="salType" name="salType">
							<option value="selAllSel">전체</option>
							<c:forEach items="${salTypeList}" var="sal">
								<option value="${sal.id}" <c:if test="${sal.id eq salType}">selected</c:if>>${sal.value}</option>
							</c:forEach>
						</select>	
						</c:if>
															
						<!-- 검색창 <--><br/>
						<form action="${pageContext.request.contextPath}/job/jobBoard/searchJobBoard.do">
						<div class="searchArea">
						<select class="cArray" id="jb_Search" name="jb_Search">
							<option value="s_All">전체</option>
							<option value="s_Title">제목</option>
							<option value="s_Nick">작성자</option>
							<option value="s_Content">내용</option>
							<option value="s_TitCon">제목 + 내용</option>
						</select>
						<input type="search" id ="searchContent" name="searchCont" placeholder="검색어입력"/>
						<button type="submit">검색</button>
						</div>
						</form>

					</div>
						<table class="job-board table">
							<tr>
								<th id="no" class="cell">번호</th>
								<th id="title" class="cell">제목</th>
								<th id="nickName" class="cell">작성자</th>
								<th id="writeDate" class="cell">작성일</th>
								<th id="salInfo" class="cell">급여</th>
								<th id="endJobDday" class="cell">마감일</th>
								<th id="viewCount" class="cell">조회</th>
								<th id="hide-work" class="cell">상태</th>	
							</tr>
							<c:forEach items="${list}" var="jb">
							<c:if test="${0 < jb.dday && jb.type ne '마감'}">
							<tr id="${jb.no}" class="colum"> 
								<td class="cell" style="width:50px">${jb.no}</td>
								<td class="cell">
									<a href="${pageContext.request.contextPath}/job/jobBoard/jobBoardDetail.do?no=${jb.no}">${jb.title}</a></div>
								<td class="cell dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<a id="sendNick" href="#">${jb.nickName}</a> 
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									    <a class="dropdown-item" href="" id="writeNick" onclick="writeNick();">작성글 검색</a>
									    <a class="dropdown-item" href="" onclick="sendMsg();">쪽지보내기</a>
									    <a class="dropdown-item">---------------</a>
									</div>
								</td>
								<td class="cell">${jb.writeDate}</td>
								<td class="cell">${jb.salary} / ${jb.salType}</td>
								<td class="cell">${jb.dday}일 남음</td>
								<td class="cell mini">${jb.viewCount}</td>
								<td class="cell mini">${jb.type}</td>		
							</tr>
							</c:if>
							</c:forEach>
							
							<c:forEach items="${list}" var="jb">
							<!-- D-Day 지난것들 -->
							<c:if test="${0 > jb.dday}">
							<tr id="${jb.no}" class="colum"> 
								<td class="cell jbEnd mini" style="width:50px">${jb.no}</td>
								<td class="cell jbEnd">
									<a class="jbEnd" href="javascript:void(0);">${jb.title}</a></td>
								<td class="cell jbEnd">${jb.nickName}</td>
								<td class="cell jbEnd">${jb.writeDate}</td>
								<td class="cell jbEnd">${jb.salary} / ${jb.salType}</td>
								<td class="cell jbEnd">${jb.dday}일 남음</td>
								<td class="cell jbEnd mini">${jb.viewCount}</td>
								<td class="cell jbEnd mini">${jb.type}</td>		
							</tr>
							</c:if>
							
							<c:if test="${'마감' eq jb.type}">
							<tr id="${jb.no}" class="colum"> 
								<td class="cell jbEnd mini" style="width:50px">${jb.no}</td>
								<td class="cell jbEnd">
									<a class="jbEnd" href="javascript:void(0);">${jb.title}</a></td>
								<td class="cell jbEnd">${jb.nickName}</td>
								<td class="cell jbEnd">${jb.writeDate}</td>
								<td class="cell jbEnd">${jb.salary} / ${jb.salType}</td>
								<td class="cell jbEnd">${jb.dday}일 남음</td>
								<td class="cell jbEnd mini">${jb.viewCount}</td>
								<td class="cell jbEnd mini">${jb.type}</td>		
							</tr>
							</c:if>
							</c:forEach>				
						</table>
						&nbsp;&nbsp;<input type="button" value="글쓰기" id="btn-add" class="btn" onclick="jobBoardInsert();"/><br/><br/>

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
		<script>
		function jobBoardInsert(){
			location.href = "${pageContext.request.contextPath}/job/jobBoard/jobBoardInsertForm.do?no=${member.no}";
		};
		
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
		function sendMsg() {
			window.open("${pageContext.request.contextPath}/message/messageInsertForm.do?fromMember="+ $("#sendNick").text(), "msgPop", "width=700, height=600");
		}
		function writeNick(){
			location.href = "${pageContext.request.contextPath}/job/jobBoard/searchJobBoard.do?jb_Search=s_Nick&searchCont="+ $("#sendNick").text();
		}
	</script>
</body>
</html>
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
						<span class="dc-title-text">구인구직</span>
					</div>
					<div class="dc-content-box">
					
					
					<div class="arrayType" >
						<c:if test="${searchCont eq null}">
						<!-- 날짜/조회순 정렬 -->
						<div class="form-inline">
							<div style="width:50%">
							<select class=form-control id="arrayType" name="arrayType">
								<option value="B.WRITEDATE" <c:if test="${arrayType == B.WRITEDATE}">selected</c:if>>최신순</option>
								<option value="B.VIEWCOUNT" <c:if test="${arrayType == B.VIEWCOUNT}">selected</c:if>>조회순</option>
							</select>
							<!-- 구인/구직만 보기 -->
							<select class="form-control" id="type" name="type">
								<option value="selAll">전체</option>
								<c:forEach items="${typeList}" var="type_one">
									<option value="${type_one.id}" <c:if test="${type_one.id eq type}">selected</c:if>>${type_one.value}</option>
								</c:forEach>
							</select>
							<!-- 정규/비정규/파트 만 보기 -->
							<select class="form-control" id="jobType" name="jobType">
								<option value="selAllJob">전체</option>
								<c:forEach items="${jobTypeList}" var="job">
									<option value="${job.id}" <c:if test="${job.id eq jobType}">selected</c:if>>${job.value}</option>
								</c:forEach>
							</select>
							<select class="form-control" id="salType" name="salType">
								<option value="selAllSel">전체</option>
								<c:forEach items="${salTypeList}" var="sal">
									<option value="${sal.id}" <c:if test="${sal.id eq salType}">selected</c:if>>${sal.value}</option>
								</c:forEach>
							</select>
							</div>
							<div style="width:50%">
							
							<input type="button" value="글쓰기" id="btn-add" class="btn dc-btn dc-btn-right" onclick="jobBoardInsert();" style="display:block;"/>
							</div>
						</div>	
						</c:if>
															
						<!-- 검색창 <--><br/>
						<div class="form-inline">
							<form action="${pageContext.request.contextPath}/job/jobBoard/search.do">
							<select class="form-control" id="jb_Search" name="jb_Search">
								<option value="s_All">전체</option>
								<option value="s_Title">제목</option>
								<option value="s_Nick">작성자</option>
								<option value="s_Content">내용</option>
								<option value="s_TitCon">제목 + 내용</option>
							</select>
							<input class="form-control" type="search" id ="searchContent" name="searchCont" placeholder="검색어입력"/>
							<button class="btn dc-btn" type="submit">검색</button>
							</form>
						</div>

					</div>
					<br />
						<table>
							<thead class="listcol" style="border-color: white;  color: gray;">
								<tr style="color:gray;">
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>급여</th>
									<th>마감일</th>
									<th>조회</th>
									<th>상태</th>
								</tr>	
							<c:forEach items="${list}" var="jb">
							<c:if test="${0 < jb.dday && jb.type ne '마감'}">
							<tr id="${jb.no}" style="background-color:#FFFFFF; color:gray;">
								<td>${jb.no}</td>
								<td>
									<a href="${pageContext.request.contextPath}/job/jobBoard/view.do?no=${jb.no}">
									${fn:substring(jb.title, 0, 20)}</a></div>
									
								<td class="dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<a id="sendNick" href="#">${jb.nickName}</a> 
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									    <a class="dropdown-item" href="" id="writeNick" onclick="writeNick();">작성글 검색</a>
									    <a class="dropdown-item" href="" onclick="sendMsg();">쪽지보내기</a>
									    <a class="dropdown-item">---------------</a>
									</div>
								</td>
								<td>${fn:substring(jb.writeDate, 5, 10)}</td>
								<td>${jb.salary} / ${jb.salType}</td>
								<td>D-${jb.dday}</td>
								<td>${jb.viewCount}</td>
								<td>${jb.type}</td>		
							</tr>
							</c:if>
							</c:forEach>
							
							<c:forEach items="${list}" var="jb">
							<!-- D-Day 지난것들 -->
							<c:if test="${0 > jb.dday}">
							<tr id="${jb.no}" class="colum" style="background-color:#FFFFFF; color:gray;"> 
								<td>${jb.no}</td>
								<td>
									<a class="jbEnd" href="javascript:void(0);">
									${fn:substring(jb.title, 0, 20)}</a></td>
								<td>${jb.nickName}</td>
								<td>
									${fn:substring(jb.writeDate, 5, 10)}</td>
								<td>${jb.salary} / ${jb.salType}</td>
								<td>D${jb.dday}</td>
								<td>${jb.viewCount}</td>
								<td>${jb.type}</td>		
							</tr>
							</c:if>
							<c:if test="${'마감' eq jb.type}">
							<tr id="${jb.no}" class="colum"> 
								<td>${jb.no}</td>
								<td>
									<a class="jbEnd" href="javascript:void(0);">${fn:substring(jb.title, 0, 20)}</a></td>
								<td>${jb.nickName}</td>
								<td>${fn:substring(jb.writeDate, 5, 10)}</td>
								<td>${jb.salary} / ${jb.salType}</td>
								<c:if test="${jb.dday > 0 }">
									<td>D-${jb.dday}</td>
								</c:if>
								<c:if test="${jb.dday < 0 }">

									<td>D${jb.dday}</td>

								</c:if>
								<td>${jb.viewCount}</td>
								<td>${jb.type}</td>		
							</tr>
							</c:if>
							</c:forEach>
							</thead>				
						</table>
						&nbsp;&nbsp;<br/><br/>
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
			location.href = "${pageContext.request.contextPath}/job/jobBoard/insertForm.do?no=${member.no}";
		};
		
		$("#arrayType").on('change',function() {
			location.href = "${pageContext.request.contextPath}/job/jobBoard/list.do?arrayType="
					+ $("#arrayType").val() 
					+ "&type=" + $("#type").val() 
					+ "&jobType=" + $("#jobType").val()
					+ "&salType=" + $("#salType").val();
		});
		$("#type").on('change',function() {
			location.href = "${pageContext.request.contextPath}/job/jobBoard/list.do?arrayType="
					+ $("#arrayType").val() 
					+ "&type=" + $("#type").val() 
					+ "&jobType=" + $("#jobType").val()
					+ "&salType=" + $("#salType").val();
		});
		$("#jobType").on('change',function() {
			location.href = "${pageContext.request.contextPath}/job/jobBoard/list.do?arrayType="
					+ $("#arrayType").val() 
					+ "&type=" + $("#type").val() 
					+ "&jobType=" + $("#jobType").val()
					+ "&salType=" + $("#salType").val();
		});
		$("#salType").on('change',function() {
			location.href = "${pageContext.request.contextPath}/job/jobBoard/list.do?arrayType="
					+ $("#arrayType").val() 
					+ "&type=" + $("#type").val() 
					+ "&jobType=" + $("#jobType").val()
					+ "&salType=" + $("#salType").val();
		});
		function sendMsg() {
			window.open("${pageContext.request.contextPath}/message/insertForm.do?fromMember="+ $("#sendNick").text(), "msgPop", "width=700, height=600");
		}
		function writeNick(){
			location.href = "${pageContext.request.contextPath}/job/jobBoard/search.do?jb_Search=s_Nick&searchCont="+ $("#sendNick").text();
		}
	</script>
</body>
</html>
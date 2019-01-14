<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지목록 페이지 입니다.</title>
<c:import url="../common/header.jsp"/>


</head>
<body>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/msg/msgListCss.css" />
	<div class="msgBody">
	<h1>쪽지목록 페이지 입니다.</h1>
	<p>Total : ${totalContents}</p>
		<input type="hidden" value="${member.no}"/>
		<div id="msg-table" class="msg-table">
		<div class="columName bg-primary text-white">
			<div id="no" class="cell mini">번호</div>
			<div id="content" class="cell">내용</div>
			<div id="sendDate" class="cell">보낸날짜</div>
			<div id="fromMember" class="cell">보낸사람</div>
			<div id="statues" class="cell">상태</div>
			<div id="delete" class="cell mini">삭제</div>
		</div>
		<c:forEach items="${list}" var="msgList">
		<div id="${msgList.no}" class="row" onclick="">
			<div id="noValue" class="cell mini">${msgList.no}</div>
			<div id="contentValue" class="cell" style="text-overflow: ellipsis;">
			<a href="${pageContext.request.contextPath}/message/messageDetail.do?no=${msgList.no}">
			${msgList.content}</a></div>
			<div id="sendDateValue" class="cell">${msgList.sendDate}</div>
			<div id="fromMemberValue" class="cell">
			<!-- 닉네임 클릭시 회원번호 가지고 쪽지입력폼 이동 -->
			<a href="${pageContext.request.contextPath}/message/messageInsertForm.do?fromMember=${msgList.frommNick}">
			${msgList.frommNick}</a></div>
			<div id="statuesValue" class="cell">${msgList.status}</div>
			<div id="check" class="cell mini"><a href="${pageContext.request.contextPath}/message/messageDelete.do?no=${msgList.no}&memNo=${member.no}">
			<img src="${pageContext.request.contextPath }/resources/icons/del.png" id="msgIcon"/></a></div>
		</div>
		</c:forEach>
		</div>
		<c:out value="${pageBar}" escapeXml="false"/>
		<input type="button" value="쪽지쓰기" id="btn-add" class="btn" onclick="messageInsert();"/>
		<script>
			function messageInsert(){
				location.href = "${pageContext.request.contextPath}/message/messageInsertForm.do?no=${member.no}";
			};
			function msgDel(){
				location.href = "${pageContext.request.contextPath}/message/messageDelete.do?no=${msgList.no}&memNo=${member.no}";
			};
		</script>
	</div>	
</body>
</html>
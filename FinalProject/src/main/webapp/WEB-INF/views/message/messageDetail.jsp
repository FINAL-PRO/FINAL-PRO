<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 상세페이지 입니다.</title>
<c:import url="../common/header.jsp"/>
</head>
<body>
	<h1>쪽지 상세페이지 입니다.</h1>

	<div>${message.no}</div>
	내용 : <div>${message.content}</div>
	<div>${message.sendDate}</div>
	보낸사람 : <div>${message.frommNick}</div>
	<div>${message.tomNick}</div>
	<div>${message.status}</div>
	
	<c:if test="${'test2Nick' eq message.frommNick}">
		<input type="button" value="답장" id="btn-add" class="btn" disabled/>
	</c:if>
	<c:if test="${'test2Nick' ne message.frommNick}">
		<input type="button" value="답장" id="btn-add" class="btn" onclick="messageReply();"/>
	</c:if>
	<input type="button" value="목록" id="btn-add" class="btn" onclick="messageList();"/>
	<input type="button" value="삭제" id="btn-add" class="btn" onclick="messageDelete();"/>
		
	<script>
		function messageList(){
			location.href = "${pageContext.request.contextPath}/message/messageList.do?no=${member.no}";
		};
		function messageDelete(){
			location.href = "${pageContext.request.contextPath}/message/messageDelete.do?no=${member.no}";
		};
	</script>	
</body>
</html>
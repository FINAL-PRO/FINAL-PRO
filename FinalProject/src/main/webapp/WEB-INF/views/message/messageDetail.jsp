<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

</style>

<c:import url="../common/header.jsp"/>

</head>
<body>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/msg/msgDetailCss.css" />
	<div class="msgBody">
	
		<div class="msgTitle">${message.frommNick}님이 보낸 쪽지</div><br />
		<label class="msgLabel">번호</label>
		<label class="msgCont">${message.no}</label>
		
		<label class="msgLabel">수신자</label>
		<label class="msgCont">${message.tomNick}</label><br />
		
		<label class="msgLabel">상태</label>	
		<c:if test="${message.status eq 'MSGTYPE001'}">
		<label class="msgCont">읽지않음</label>
		</c:if>
		<c:if test="${message.status eq 'MSGTYPE002'}">
		<label class="msgCont">읽음</label>
		</c:if>
		<c:if test="${message.status eq 'MSGTYPE003'}">
		<label class="msgCont">삭제</label>
		</c:if>
		
		<label class="msgLabel">작성일</label>
		<label class="msgCont">${message.sendDate}</label><br />
			
		<label class="msgContent">${message.content}</label>


		
		
		<br /><br />
		<c:if test="${'알리미' eq message.frommNick}">
			<input type="button" value="답장" id="btn-add" class="btn" disabled/>
		</c:if>
		<c:if test="${'알리미' ne message.frommNick}">
			<input type="button" value="답장" id="btn-add" class="btn" onclick="messageReply();"/>
		</c:if>
		<input type="button" value="목록" id="btn-add" class="btn" onclick="messageList();"/>
		<input type="button" value="삭제" id="btn-add" class="btn" onclick="messageDelete();"/>
	</div>		
		<script>
			function messageReply(){
				location.href = "${pageContext.request.contextPath}/message/messageInsertForm.do?no=${member.no}&fromMember=${message.frommNick}";
			}
		
			function messageList(){
				location.href = "${pageContext.request.contextPath}/message/messageList.do?no=${member.no}";
			};
			function sendMsg(){
				location.href = "${pageContext.request.contextPath}/message/messageDelete.do?fromNo=${message.no}&memNo=${member.no}";
			};
		</script>
		
</body>
</html>
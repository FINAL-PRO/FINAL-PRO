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
	<style>
	.msg-table{
		border-collapse: collapse;
		text-align: left;
		line-height: 1.5;
		
		margin: 20px 10px;
	}
    .columName  {
    	display: table-row;
    	border : 1px solid black;
    }
    .row {
    	display: table-row;
    	border : 1px solid black;
    }        
    .cell {
	      display: table-cell;
	      border : 1px solid black;
    }
    </style>
</head>
<body>
	<h1>쪽지목록 페이지 입니다.</h1>
	<p>Total : ${totalContents}</p>
		<input type="hidden" value="${member.no}"/>
		<div id="msg-table" class="msg-table">
		<div class="columName bg-primary text-white">
			<div id="no" class="cell">번호</div>
			<div id="content" class="cell">내용</div>
			<div id="sendDate" class="cell">보낸날짜</div>
			<div id="fromMember" class="cell">보낸사람</div>
			<div id="statues" class="cell">상태</div>
			<div id="delete" class="cell">삭제</div>
		</div>
		<c:forEach items="${list}" var="msgList">
		<div id="${msgList.no}" class="row" onclick="">
			<div id="noValue" class="cell">${msgList.no}</div>
			<div id="contentValue" class="cell" style="text-overflow: ellipsis;">
			<a href="${pageContext.request.contextPath}/message/messageDetail.do?no=${msgList.no}">
			${msgList.content}</a></div>
			<div id="sendDateValue" class="cell">${msgList.sendDate}</div>
			<div id="fromMemberValue" class="cell">
			<!-- 닉네임 클릭시 회원번호 가지고 쪽지입력폼 이동 -->
			<a href="${pageContext.request.contextPath}/message/messageInsertForm.do?fromMember=${msgList.frommNick}">
			${msgList.frommNick}</a></div>
			<div id="statuesValue" class="cell">${msgList.status}</div>
			<div id="check" class="cell"><a href="${pageContext.request.contextPath}/message/messageDelete.do?no=${msgList.no}&memNo=${member.no}">O</a></div>
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
</body>
</html>
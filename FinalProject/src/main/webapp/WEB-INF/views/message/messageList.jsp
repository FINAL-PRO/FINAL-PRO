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

</style>

</head>
<head />
<body>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/msg/msgListCss.css" />
	<div class="msgBody">
	<div class="nav">&nbsp;&nbsp;
		<c:if test="${param.no != null}">
			<a class="navList" style="font-weight: bold" href="${pageContext.request.contextPath}/message/messageList.do?no=${member.no}">
			받은메세지</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a class="navList" href="${pageContext.request.contextPath}/message/sendMsg.do?fromMember=${member.no}">
			보낸메세지 </a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${param.fromMember != null}">
			<a class="navList" href="${pageContext.request.contextPath}/message/messageList.do?no=${member.no}">받은메세지</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a class="navList" style="font-weight: bold" href="${pageContext.request.contextPath}/message/sendMsg.do?fromMember=${member.no}">보낸메세지</a>&nbsp;&nbsp;
		</c:if>
	</div>
	
		<input type="hidden" value="${member.no}"/>
		<div id="msg-table" class="msg-table">
		
		<!-- 받은메세지 -->
		<c:if test="${param.no != null}">
		<div class="navbar">
			<label></label>
			<label>TotalContents : ${totalContents}</label>
		</div>
		<div class="columName text-white">
			<div id="no" class="cell mini">번호</div>
			<div id="content" class="cell">내용</div>
			<div id="sendDate" class="cell">작성일</div>
			<div id="fromMember" class="cell mid">수신자</div>
			<div id="statues" class="cell mid">상태</div>
			<div id="delete" class="cell mini">삭제</div>
		</div>
		<c:forEach items="${list}" var="msgList" varStatus="bo">
		<div id="${msgList.no}" class="row" onclick="">
			<div id="noValue" class="cell mini">${bo.index +1}</div>
			
			<div id="contentValue" class="cell contentValue">
			<a href="${pageContext.request.contextPath}/message/messageDetail.do?no=${msgList.no}">
			${fn:substring(msgList.content, 0, 12)}</a></div>
			
			<div id="sendDateValue" class="cell">
			${fn:substring(msgList.sendDate, 5, 10)}</div>
			
			<div id="fromMemberValue" class="cell mid">
			
			<!-- 닉네임 클릭시 회원번호 가지고 쪽지입력폼 이동 -->
			<c:if test="${msgList.frommNick ne '알리미'}">
			<a href="${pageContext.request.contextPath}/message/messageInsertForm.do?fromMember=${msgList.frommNick}">
			${msgList.frommNick}</a>
			</c:if>
			<c:if test="${msgList.frommNick eq '알리미'}">
			${msgList.frommNick}
			</c:if>
			</div>
			<div id="statuesValue" class="cell mid">${msgList.status}</div>
			<div id="check" class="cell mini"><a href="${pageContext.request.contextPath}/message/messageDelete.do?no=${msgList.no}&memNo=${member.no}">
			<img src="${pageContext.request.contextPath }/resources/icons/del.png" id="msgIcon"/></a></div>
		</div>
		</c:forEach>
		</c:if>
		
		<!-- 보낸메세지 -->
		<c:if test="${param.fromMember != null}">
		<div class="navbar">
		<label>보낸메세지</label>
		<label>Total : ${total}</label>
		</div>
		<div class="columName text-white">
			<div id="no" class="cell mini">번호</div>
			<div id="content" class="cell">내용</div>
			<div id="sendDate" class="cell">작성일</div>
			<div id="toMember" class="cell mid">발신자</div>
			<div id="statues" class="cell mid">상태</div>
			<div id="delete" class="cell mini">기타</div>
		</div>
		<c:forEach items="${list}" var="msgList" varStatus="">
		<div id="${msgList.no}" class="row" onclick="">
			<div id="noValue" class="cell mini">${bo.index +1}</div>
			
			<div id="contentValue" class="cell contentValue">
			${fn:substring(msgList.content, 0, 12)}</div>
			
			<div id="sendDateValue" class="cell">
			${fn:substring(msgList.sendDate, 5, 10)}</div>
			
			<div id="fromMemberValue" class="cell mid">${msgList.tomNick}</div>
			<div id="statuesValue" class="cell mid">${msgList.status}</div>
			<div id="check" class="cell mini">-</div>
		</div>
		</c:forEach>
		</c:if>
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
			function testUri(){
				var testUri =  request.getAttribute("javax.servlet.forward.request_uri");
				location.href = testUri();
			}


		</script>
	</div>	
</body>
</html>
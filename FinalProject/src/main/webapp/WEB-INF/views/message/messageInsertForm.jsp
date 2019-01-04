<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 입력페이지 입니다.</title>
<c:import url="../common/header.jsp"/>
</head>
<body>
	<h1>쪽지 입력페이지 입니다.</h1>
	<form id="msgIns" method="post" action="${pageContext.request.contextPath}/message/messageInsert.do">
		작성자 : ${member.nickName}
		<input type="hidden" name="frommNick" value="${member.nickName}" readonly/>
		<input type="hidden" name="fromMember" value="${member.no}" readonly/><br />
		받는사람 : <input type="text" name="tomNick" value=""/><br />
		내용 : <input type="text" name="content"/><br /><br />
		
		<button type="submit">작성</button>
		<button onclick="cancel();">취소</button>
	</form>
	<script>
		function cancel(){
			location.href = "${pageContext.request.contextPath}/message/messageList.do?no=${member.no}";
		}
	</script>
</body>
</html>
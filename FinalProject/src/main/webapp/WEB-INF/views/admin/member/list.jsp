<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>동커</title>
	<c:import url="../../common/header.jsp"/>
</head>
<body>
	<div id="container">
		<c:import url="../../common/menubar.jsp"/>
		<section id="content">
			<h1>어드민 멤버 리스트</h1>
			<select id="authNo">
				<c:forEach items="${memberAuthList}" var="auth">
					<option value="${auth.no}" <c:if test="${auth.no eq authNo}">selected</c:if>>${auth.content}</option>
				</c:forEach>
			</select>
			<div>
				<div class="row table-row">
					<div class="col column">번호</div>
					<div class="col column">이름</div>
					<div class="col column">가입일</div>
				</div>
			
				<c:forEach var="member" items="${memberList}">
					<div class="row table-row">
						<div class="col column">${member.no}</div>
						<div class="col column"><a href="${pageContext.request.contextPath}/admin/member/detailView.do?memberNo=${member.no}">${member.name}</a></div>
						<div class="col column">${member.enrollDate}</div>
					</div>
				</c:forEach>
				<div class="table" style="background:red">
					
					
				</div>
			</div>
		</section>
		<c:import url="../../common/footer.jsp"/>
	</div>
	<script>
		$("#authNo").on('change', function(){
			location.href= "${pageContext.request.contextPath}/admin/member/list.do?authNo="+ $("#authNo").val();
		});
	</script>
</body>
</html>
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
	<c:import url="../common/header.jsp"/>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
		<div class="wrap_inner">
			<main id="container">
				<section>
				<h1>어드민 인덱스</h1>
			<h2>
				<a href="${pageContext.request.contextPath}/admin/member/list.do">멤버 리스트</a>
			</h2>
			<br />
			<h2>
				<a href="${pageContext.request.contextPath}/admin/board/list.do">게시글 리스트</a>
			</h2>
			<br />
			<h2>
				<a href="${pageContext.request.contextPath}/admin/company/list.do">업체 리스트</a>
			</h2>
				</section>
			</main>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>
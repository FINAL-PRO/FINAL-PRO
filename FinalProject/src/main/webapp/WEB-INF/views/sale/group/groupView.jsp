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
		<c:import url="../../common/menubar.jsp" />
		<section id="content">
			<h1>공동구매 상세보기</h1>
			
			<p>${group.no }</p>
			<p>${group.boardNo }</p>
			<p>${group.goodsName }</p>
			<p>${group.price }</p>
			<p>${group.endDate }</p>
			<p>${group.deposit }</p>
			<p>${group.maxCount }</p>
			<p>${group.currentCount }</p>
			<p>${group.title }</p>
			<hr />
			<p>${group.content }</p>
			<hr />
			<p>${group.goodsCategory }</p>
			<p>${group.memberName }</p>
			<p>${group.status }</p>
			<p>${group.dealType }</p>
			<p>${group.writeDate }</p>
			<p>${group.viewCount }</p>
			<p>${group.thumbnail }</p>

		</section>
		<c:import url="../../common/footer.jsp" />
	</div>

</body>
</html>
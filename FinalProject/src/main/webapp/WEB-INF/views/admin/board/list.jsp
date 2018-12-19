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
			<h1>어드민 보드 리스트</h1>
			<div>
				<div class="row table-row">
					<div class="col column">번호</div>
					<div class="col column">이름</div>
					<div class="col column">작성일</div>
				</div>
			
				<c:forEach var="board" items="${boardList}">
					<div class="row table-row">
						<div class="col column">${board.no}</div>
						<div class="col column">${board.title}</div>
						<div class="col column">${board.writeDate}</div>
					</div>
				</c:forEach>
				<div class="table" style="background:red">
					
					
				</div>
			</div>
		</section>
		<c:import url="../../common/footer.jsp"/>
	</div>
</body>
</html>
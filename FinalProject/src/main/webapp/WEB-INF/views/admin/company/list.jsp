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
			<h1>어드민 업체 리스트</h1>
			<div>
				<div class="row table-row">
					<div class="col column">번호</div>
					<div class="col column">업체명</div>
					<div class="col column">등록일</div>
				</div>
			
				<c:forEach var="company" items="${companyList}">
					<div class="row table-row">
						<div class="col column">${company.no}</div>
						<div class="col column"><a href="${pageContext.request.contextPath}/admin/company/detailView.do?companyNo=${company.no}">${company.name}</a></div>
						<div class="col column">${company.enrollDate}</div>
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
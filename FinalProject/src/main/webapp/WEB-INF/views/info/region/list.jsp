<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>지역 list</title>
<c:import url="../../common/header.jsp" />
<style>
</style>
</head>
<body>
	<c:import url="../../common/menubar.jsp" />
	<div class="wrap_inner">
		<main id="container">
		<section>
			<div class="section-left">
				<!-- 내용없음 -->
			</div>

			<div class="section-center">
				<div class="dc-content">
					<div class="dc-content-title">
						<h1>지역정보 게시판</h1>
						<a href="${pageContext.request.contextPath}/info/region/insertRegionView.do">글쓰기</a>
					</div>
					<div class="dc-content-box">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="region" varStatus="vs">
									<tr>
										<th>${region.no}</th>
										<th><a href="${pageContext.request.contextPath}/info/region/rgSelectOne.do?no=${region.no}">${region.title}</a></th>
										<th>${region.userName }</th>
										<th>${region.writeDate}</th>
										<th>${region.viewcount }</th>
									</tr>
									<%-- <c:forEach items="${Region.regionLang}" var="lang" varStatus="vs">${vs.index!=0?",":""} ${lang}</c:forEach> --%>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="section-right">
				<c:import url="../../common/rightSection.jsp" />
			</div>
		</section>
		</main>
	</div>
	<c:import url="../../common/footer.jsp" />
</body>


</html>
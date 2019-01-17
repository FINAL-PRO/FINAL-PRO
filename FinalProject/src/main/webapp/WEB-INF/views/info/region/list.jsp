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
.table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
    background: #f6f6f6;
}

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
						<span class="dc-title-text">지역정보</span>
					</div>
					<div class="dc-content-box">
						<div class="form-inline">
							<div style="width:50%">
							</div>
							<div style="width:50%">
								<button class="btn dc-btn dc-btn-right" onclick="location.href='${pageContext.request.contextPath}/info/region/insert/view.do'">글쓰기</button>
							</div>
						</div>
						<br />
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<c:if test="${!empty list}">
									<c:forEach items="${list}" var="region" varStatus="vs">
										<tr style="background-color:#FFFFFF; color:gray;">
											<th>${region.no}</th>
											<th><a href="${pageContext.request.contextPath}/info/region/view.do?no=${region.no}">${region.title}</a></th>
											<th>${region.userName }</th>
											<th>${region.writeDate}</th>
											<th>${region.viewcount }</th>
										</tr>
										<%-- <c:forEach items="${Region.regionLang}" var="lang" varStatus="vs">${vs.index!=0?",":""} ${lang}</c:forEach> --%>
									</c:forEach>
								</c:if>
								<c:if test="${empty list }">
										<tr style="background-color:#FFFFFF; color:gray;">
						                	<th colspan="5" style="width:auto; text-align:center;">작성된 게시물이 없습니다.</th>						               
						            	</tr>
								</c:if>
							</thead>
						</table>
						<c:out value="${pageBar}" escapeXml="false"/>
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
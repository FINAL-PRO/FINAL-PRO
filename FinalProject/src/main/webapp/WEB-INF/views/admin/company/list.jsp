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
<c:import url="../../common/header.jsp" />
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
						<h1>어드민 업체 리스트</h1>
					</div>
					<div class="dc-content-box">
						<select id="companyTypeNo">
							<c:forEach items="${companyTypeList}" var="company">
								<option value="${company.id}"
									<c:if test="${company.id eq companyType}">selected</c:if>>${company.value}</option>
							</c:forEach>
						</select>
						<div>
							<div class="row table-row">
								<div class="col column">번호</div>
								<div class="col column">업체명</div>
								<div class="col column">등록일</div>
							</div>

							<c:forEach var="company" items="${companyList}">
								<div class="row table-row">
									<div class="col column">${company.no}</div>
									<div class="col column">
										<a
											href="${pageContext.request.contextPath}/admin/company/detailView.do?companyNo=${company.no}">${company.name}</a>
									</div>
									<div class="col column">${company.enrollDate}</div>
								</div>
							</c:forEach>
						</div>
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
	<script>
		$("#companyTypeNo")
				.on(
						'change',
						function() {
							location.href = "${pageContext.request.contextPath}/admin/company/list.do?companyType="
									+ $("#companyTypeNo").val();
						});
	</script>
</body>
</html>
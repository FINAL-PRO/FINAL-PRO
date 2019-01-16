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
						<div>
							<span class="dc-list-title">전체 업체 리스트</span>
						</div>
						<br />
						
						<div class="form-inline">
							<select class="form-control" id="companyTypeNo">
								<c:forEach items="${companyTypeList}" var="company">
									<option value="${company.id}"
										<c:if test="${company.id eq companyType}">selected</c:if>>${company.value}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="dc-content-box">
						<table class="table">
							<thead>
								<th>#</th>
								<th>업체명</th>
								<th>등록일</th>
							</thead>
							<tbody>
								<c:if test="${!empty companyList}">
									<c:forEach var="company" items="${companyList}">
										<tr>
											<td>${company.no}</td>
											<td>
												<a href="${pageContext.request.contextPath}/business/partnership/view.do?companyNo=${company.no}">${company.name}</a>
											</td>
											<td>
												<fmt:formatDate value="${company.enrollDate}" pattern="yyyy.MM.dd"/>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty companyList}">
									<tr>
										<td colspan="3">
											<div class="dc-none-data">
												<span class="dc-none-data-text">데이터가 없습니다.</span>
											</div>
										</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<button class="btn dc-btn" onclick="goAdminIndex();">전체 목록</button>
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
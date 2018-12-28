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
	<c:import url="../../common/menubar.jsp"/>
	<div class="wrap_inner">
		<main id="container">
			<section>
				<div class="section-left">
					<!-- 내용없음 -->
				</div>
				
				<div class="section-center">
					<div class="dc-content">
						<div class="dc-content-title">
							<h1>광고 신청 게시판</h1>
							<br />
							<a href="${pageContext.request.contextPath}/business/ad/insertForm.do">광고신청</a>
							
						<select id="adContentTypeNo">
							<c:forEach items="${adContentType}" var="code">
								<option value="${code.id}" <c:if test="${code.id eq adContent}">selected</c:if>>${code.value}</option>
							</c:forEach>
						</select>
						<select id="adTypeNo">
							<c:forEach items="${adTypeList}" var="code">
								<option value="${code.id}" <c:if test="${code.id eq adType}">selected</c:if>>${code.value}</option>
							</c:forEach>
						</select>
						<select id="adStatusNo">
							<c:forEach items="${adStatusList}" var="code">
								<option value="${code.id}" <c:if test="${code.id eq adStatus}">selected</c:if>>${code.value}</option>
							</c:forEach>
						</select>
						</div>
						<div class="dc-content-box">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>번호</th>
										<th>신청인</th>
										<th>광고노출위치</th>
										<th>광고타입</th>
										<th>광고물타입</th>
										<th>광고상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${adList}" var="ad">
										<tr>
											<td>${ad.no}</td>
											<td>${ad.memberNo}</td>
											<td>${ad.sectionNo }</td>
											<td>${ad.adContentType}</td>
											<td>${ad.adType}</td>
											<td>${ad.status}</td>
										</tr>
									</c:forEach>
								
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="section-right">
					<c:import url="../../common/rightSection.jsp"/>
				</div>
			</section>
		</main>
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>
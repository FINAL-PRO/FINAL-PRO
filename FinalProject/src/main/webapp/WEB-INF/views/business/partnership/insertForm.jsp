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
							<h1>업체 등록 게시판</h1>
						</div>
						<div class="dc-content-box">
							<form method="post" enctype="multipart/form-data"
								<c:if test="${empty company}"> action="${pageContext.request.contextPath}/business/partnership/insert.do" </c:if>
								<c:if test="${!empty company}"> action="${pageContext.request.contextPath}/business/partnership/update.do" </c:if> >
							<table class="table">
								<tr>
									<td>업체명</td>
									<td>
										<input type="text" name="name" value="${company.name}"/>	
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>
										<input type="text" name="address" value="${company.address}" />
									</td>
								</tr>
								<tr>
									<td>업체구분</td>
									<td>
										<select name="status" id="">
											<c:forEach items="${companyTypeList}" var="code">
												<option value="${code.id}">${code.value}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<c:if test="${empty company}">
											<button type="submit">업체 등록</button>
										</c:if>
										<c:if test="${!empty company}">
											<button type="submit">업체 수정</button>
										</c:if>
									</td>
								</tr>		
							</table>
							<input type="hidden" name="companyNo" value="${company.no}"/>
							</form>
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
	
	<script>
	
	</script>
</body>
</html>
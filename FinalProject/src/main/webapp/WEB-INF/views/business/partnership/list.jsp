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
							<br />
							<a href="${pageContext.request.contextPath}/business/partnership/insert/view.do">업체 등록</a>
							
						<select id="companyTypeNo">
							<c:forEach items="${companyTypeList}" var="code">
								<option value="${code.id}" <c:if test="${code.id eq companyType}">selected</c:if>>${code.value}</option>
							</c:forEach>
						</select>
						</div>
						<div class="dc-content-box">
							<div class="table">
								<div class="row">
									<div class="col col-1">번호</div>
									<div class="col col-2">업체명</div>
									<div class="col col-3">주소</div>
									<div class="col col-2">등록일</div>
									<div class="col col-2">업체구분</div>
								</div>
									<c:if test="${!empty companyList}">
										<c:forEach items="${companyList}"  var="company">
											<a href="#" onclick="detailView(${company.no});">
												<div class="row">
													<div class="col col-1">${company.no}</div>
													<div class="col col-2">${company.name}</div>
													<div class="col col-3">${company.address}</div>
													<div class="col col-2">${company.enrollDate}</div>
													<div class="col col-2">${company.value}</div>
												</div>
											</a>
										</c:forEach>
									</c:if>
									<c:if test="${empty companyList}">
										<div class="dc-none-data col">
											<div align="center">
												<span>게시물 없음</span>
											</div>
										</div>
									</c:if>
							</div>
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
	$("#companyTypeNo").on('change',function() {
		location.href = "${pageContext.request.contextPath}/business/partnership/list.do?companyType="
			+ $("#companyTypeNo").val();
	});
	
	function detailView(no){
		location.href = "${pageContext.request.contextPath}/business/partnership/view.do?companyNo=" + no;
	}
	</script>
</body>
</html>
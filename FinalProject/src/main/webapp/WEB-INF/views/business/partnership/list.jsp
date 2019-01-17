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
							<span class="dc-title-text">제휴</span>
							<br />
						</div>
						<div class="dc-content-box">
							<div class="form-inline">
								<div style="width:50%">
									<select id="companyTypeNo" class="form-control">
										<c:forEach items="${companyTypeList}" var="code">
											<option value="${code.id}" <c:if test="${code.id eq companyType}">selected</c:if>>${code.value}</option>
										</c:forEach>
									</select>
								</div>
								<div style="width:50%">
									<button class="btn dc-btn dc-btn-right" onclick="insertCompany();">업체 등록</button>
								</div>
							</div>
							<br />
							<table class="table">
								<thead>
									<th>#</th>
									<th>업체명</th>
									<th>주소</th>
									<th>등록일</th>
									<th>업체구분</th>
								</thead>
								<tbody>
									<c:if test="${!empty companyList}">
										<c:forEach items="${companyList}"  var="company">
												<tr>
													<td>${company.no}</td>
													<td>
														<a href="#" onclick="detailView(${company.no});">
															${company.name}
														</a>
													</td>
													<td>${company.address}</td>
													<td>
														<fmt:formatDate value="${company.enrollDate}" pattern="yyyy.MM.dd"/>
													</td>
													<td>${company.value}</td>
												</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty companyList}">
										<div class="dc-none-data col">
											<div align="center">
												<span>게시물 없음</span>
											</div>
										</div>
									</c:if>
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
	
	<script>
	$("#companyTypeNo").on('change',function() {
		location.href = "${pageContext.request.contextPath}/business/partnership/list.do?companyType="
			+ $("#companyTypeNo").val();
	});
	
	function detailView(no){
		location.href = "${pageContext.request.contextPath}/business/partnership/view.do?companyNo=" + no;
	}
	
	function insertCompany(){
		location.href = "${pageContext.request.contextPath}/business/partnership/insert/view.do";
	}
	</script>
</body>
</html>
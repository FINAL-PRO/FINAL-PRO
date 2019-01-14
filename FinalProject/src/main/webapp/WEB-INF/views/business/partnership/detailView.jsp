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
						<h1>업체 상세보기</h1>
					</div>
					<div class="dc-content-box">
					<form action="${pageContext.request.contextPath}/business/partnership/update/view.do">
						<div>
							<div class="row table-row">
								<div class="col">번호</div>
								<div class="col">제목</div>
								<div class="col">내용</div>
							</div>

							<div class="row table-row">
								<div class="col column">${company.no}</div>
								<div class="col column">${company.name}</div>
								<div class="col column">${company.address}</div>
							</div>
							<div class="table" style="background: red"></div>
							
							<input type="hidden" name="companyNo" value="${company.no}" />
							<button type="submit">수정하기</button>
						</div>
					</form>
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
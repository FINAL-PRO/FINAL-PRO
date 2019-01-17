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
						<span class="dc-title-text">제휴</span>
					</div>
					<div class="dc-content-box">
						<form action="${pageContext.request.contextPath}/business/partnership/update/view.do">
							<table class="table">
								<thead>
									<th>#</th>
									<th>제목</th>
									<th>내용</th>
								</thead>
								<tbody>
									<tr>
										<td>${company.no}</td>
										<td>${company.name}</td>
										<td>${company.address}</td>
									</tr>
									<input type="hidden" name="companyNo" value="${company.no}" />
								</tbody>
							</table>
							<button class="btn dc-btn" type="submit">수정하기</button>
							<button class="btn dc-btn" onclick="historyGoBack();">뒤로</button>
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
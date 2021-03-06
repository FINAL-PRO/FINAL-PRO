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
<c:import url="../common/header.jsp" />
</head>
<body>
	<c:import url="../common/menubar.jsp" />
	<div class="wrap_inner">
		<main id="container">
		<section>
			<div class="section-left">
				<!-- <a href="test/select.do">select test</a> -->
			</div>

			<div class="section-center">
				<div class="dc-content">
					<div class="dc-content-title">
						<span class="dc-title-text">관리자 페이지</span>
					</div>
					<div class="dc-content-box">
						<table class="table">
							<thead>
								<th>#</th>
								<th>연결 목록</th>
							</thead>
							<tbody>
							<tr>
								<td>#</td>
								<td>
									<a href="${pageContext.request.contextPath}/admin/member/list.do">회원 리스트 확인</a>
								</td>
							</tr>
							<tr>
								<td>#</td>
								<td>
									<a href="${pageContext.request.contextPath}/admin/board/list.do">게시글 리스트 확인</a>
								</td>
							</tr>
							<tr>
								<td>#</td>
								<td>
									<a href="${pageContext.request.contextPath}/admin/company/list.do">업체 리스트 확인</a>
								</td>
							</tr>
							</tbody>
						</table>
						<h2>
							
						</h2>
						<br />
						<h2>
							
						</h2>
						<br />
						<h2>
							
						</h2>
					</div>
				</div>
			</div>

			<div class="section-right">
				<c:import url="../common/rightSection.jsp" />
			</div>
		</section>
		</main>
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>
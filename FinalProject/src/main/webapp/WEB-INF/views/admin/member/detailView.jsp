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
						<h1>어드민 멤버 상세보기</h1>
					</div>
					<div class="dc-content-box">

						<div>
							<div class="row table-row">
								<div class="col column">번호</div>
								<div class="col column">이름</div>
								<div class="col column">닉네임</div>
							</div>

							<div class="row table-row">
								<div class="col column">${member.no}</div>
								<div class="col column">${member.email}</div>
								<div class="col column">${member.nickName}</div>
							</div>
							<div class="table" style="background: red"></div>
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
</body>
</html>
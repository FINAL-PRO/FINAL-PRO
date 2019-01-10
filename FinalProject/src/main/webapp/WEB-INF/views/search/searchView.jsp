<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/header.jsp" />
</head>
<body>
	<c:import url="../common/menubar.jsp" />
	<div class="wrap_inner">
		<main id="container">
		<section>
			<div class="section-left">
				<!-- 내용없음 -->
			</div>

			<div class="section-center">
				<div class="dc-content">
					<div class="dc-content-title">
					
						
						
					</div>
					<div class="dc-content-box">
						<c:set value="${searchResultList}" var="result" />
					    <c:if test="${!empty result}" >
							<c:forEach items="${result}" var="result" varStatus="">
								<h3>검색결과</h3>
								<a href="#">${result.title}</a> <br>
								<a href="#">${result.content}</a> <br>
								<a href="#">${result.memberName}</a> <br>
								${result.writeDate}<br>						
							</c:forEach>
						</c:if>
						
						<c:if test="${empty result}" >
							<h3>검색 결과가 없습니다.</h3>
						</c:if>
						
						
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
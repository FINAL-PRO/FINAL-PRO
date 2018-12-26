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
	<%-- <input type="text" name="msg" value="${model.msg}"/> --%>
	<c:import url="../../common/menubar.jsp"/>
	<div class="wrap_inner">
		<main id="container">
			<section>
				<div class="section-left">
				<!-- <a href="test/select.do">select test</a> -->
					<img class="adimg" src="${pageContext.request.contextPath}/resources/images/adimg1.jpg" 
					alt="메인_좌측_세로배너" width="140" height="800"
					style="margin-left: 1px;margin-right: 1px; margin-top:60px; margin-bottom:60px;
					border:1px solid red"/>
				</div>
				
				<div class="section-center">
					<div class="dc-content">
						<h1>business / ad / list</h1>
					</div>
				</div>
				
				<div class="section-right">
						<img class="adimg" src="${pageContext.request.contextPath}/resources/images/adimg1.jpg" 
						alt="메인_우측_세로배너" width="140" height="800"
						style="margin-left: 1px;margin-right: 1px; margin-top:60px; margin-bottom:60px;
						border:1px solid red"/>
	<!-- 				<div class="section-item">
						item1
					</div>
					<div class="section-item">
						item2
					</div>
					<div class="section-item">
						item3
					</div>
					<div class="section-item">
						item4
					</div> -->
				</div>
			</section>
		</main>
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>
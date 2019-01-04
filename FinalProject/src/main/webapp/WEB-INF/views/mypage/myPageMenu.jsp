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
</head>
<body>
	<div class="dc-menubar bg-dark">
		<div class="dc-manebar-main" style="width: auto; margin: 0 auto;">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/member/memberView.do?no=${member.no}">내정보보기 </a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/member/myContentList.do?no=${member.no}">내가 쓴 글/댓글 </a>
						</li>
					
					</ul>
				</div>
			</nav>
		</div>	
	</div>
</body>
</html>
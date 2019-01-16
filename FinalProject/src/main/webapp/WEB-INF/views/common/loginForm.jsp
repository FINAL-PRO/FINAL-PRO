<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> --%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dc-default-style.css" />
<title>로그인 페이지</title>
<c:import url="../common/header.jsp" />

</head>
<body>
	<div align="center" style="margin: 0 auto; ">
		<div class="" style="width: 300px; margin-top: 200px;">
			<form class="form-signin" method="post" action="${pageContext.request.contextPath }/login">
				<img id="logo" alt="메인으로" src="${pageContext.request.contextPath }/resources/images/logo3.png" onclick="toMain();">
				<p>
					<input type="text" id="username" name="username" class="form-control"
						placeholder="이메일을 입력하세요." required="" autofocus="">
				</p>
				<p>
					<input type="password" id="password" name="password" class="form-control"
						placeholder="비밀번호를 입력하세요." required="">
				</p>
				<input name="_csrf" type="hidden" value="${_csrf.token}">
				<button class="btn" id="login" type="submit">로그인</button>
			</form>
		</div>
	</div>
	
	<script>
		function toMain() {
			location.href="/dc";
		}
	</script>
</body>
</html>

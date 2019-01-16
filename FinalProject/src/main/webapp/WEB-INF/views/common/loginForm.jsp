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
<title>로그인 페이지</title>
<c:import url="../common/header.jsp" />
</head>
<body background="${pageContext.request.contextPath }/resources/images/logout.jpg" 
		style="background-size: cover; margin: 0 auto;">
	<div align="center" style="margin: 0 auto; ">
		<div class="" style="width: 350px; margin-top: 200px;">
			<form class="form-signin" method="post" action="/dc/login">
				<h2 class="form-signin-heading" style="color: white;">로그인</h2>
				<p>
					<input type="text" id="username" name="username" class="form-control"
						placeholder="이메일을 입력하세요." required="" autofocus="">
				</p>
				<p>
					<input type="password" id="password" name="password" class="form-control"
						placeholder="비밀번호를 입력하세요." required="">
				</p>
				<input name="_csrf" type="hidden"
					value="83c19c80-7f67-421a-929d-d907255a65c4">
				<button class="btn" id="login" type="submit">Sign in</button>
			</form>
		</div>
	</div>
</body>
</html>

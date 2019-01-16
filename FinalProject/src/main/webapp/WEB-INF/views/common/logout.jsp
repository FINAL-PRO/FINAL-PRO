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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dc-default-style.css" />
<title>로그인 페이지</title>
<c:import url="../common/header.jsp" />

</head>
<body>	
	<div align="center" style="margin: 0 auto; ">
		<div class="" style="width: 350px; margin-top: 200px;">
      		<form class="form-signin" method="post" action="/dc/logout">
	        	<img id="logo" alt="메인으로" src="${pageContext.request.contextPath }/resources/images/logo3.png" onclick="toMain();">
				<input name="_csrf" type="hidden" value="58cec766-dfe7-4e53-a080-b0a0cd6a686e">
	        	<button class="btn" id="logout" type="submit">로그아웃</button>
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

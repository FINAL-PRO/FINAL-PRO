<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dc-default-style.css" />
<title>페이지 접근 권한이 없습니다.</title>
<c:import url="../common/header.jsp" />
</head>
<body>
	<%-- <h1>Access Denied</h1>
	<a href="${pageContext.request.contextPath }">메인 페이지로</a>

	<h2>권한이 없습니다.</h2> --%>
	
	<div align="center" style="margin: 0 auto; ">
		<div class="" style="width: 300px; margin-top: 200px;">
      		<form class="form-signin" method="post" action="#">
	        	<img id="logo" alt="메인으로" src="${pageContext.request.contextPath }/resources/images/logo3.png" onclick="toMain();">
	        	<h1 style="margin-bottom: 20px;">페이지 접근 권한이 없습니다.</h1>
	        	<button class="btn" id="logout" type="button" onclick="toMain();">메인으로</button>
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
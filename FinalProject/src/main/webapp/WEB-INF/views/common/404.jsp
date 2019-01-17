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
<link href="https://fonts.googleapis.com/css?family=Gugi&amp;subset=korean" rel="stylesheet">
<title>페이지를 찾을 수 없습니다.</title>
<c:import url="../common/header.jsp" />
</head>
<style>
	p{
		font-family: 'Gugi', cursive;
	}
	
	img{
		/* height: 20%;
		widht: 20%; */
		size: 80%;
	}

	body{
		background-color: rgb(245, 234, 219);
	}

	span{
		color: gray;
	}
	
	.btn-main{
		width: 300px;
	}
	
</style>
<body>
	<%-- <h1>Access Denied</h1>
	<a href="${pageContext.request.contextPath }">메인 페이지로</a>

	<h2>권한이 없습니다.</h2> --%>
	
	<div class="404_center" align="center" style="margin: 0 auto; ">
		<div class="" style="width: 500px; margin-top: 200px;">
      		<form class="form-signin" method="post" action="#">
	        	<img id="logo" alt="메인으로" src="${pageContext.request.contextPath }/resources/images/logo3.png" onclick="toMain();"> 
				<p style="font-size: 50px; font-weight: bold;">404 ERROR :(</p>
				<span style="font-size: 25px; font-weight: bold;">Sorry, Page not found</span>
				<div style="heigth:20px;"></div><br>
				<button class="btn btn-main btn-sm" style="width: 300px;" id="logout" type="button" onclick="toMain();">메인으로</button>
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
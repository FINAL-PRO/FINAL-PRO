<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dc-default-style.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/spring_icon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/weather-icons.min.css" />

<!-- summernote 관련 라이브러리 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>

<script src="${pageContext.request.contextPath }/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sweetalert2.min.css"/>

<!-- 기상청 날씨 받아오기 위한 크로스도메인 해결 플러그인 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.ajax-cross-origin.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="${pageContext.request.contextPath }/resources/icons/favicon.ico">
<style>
	section{background-color: white;}
/* 	header {
	
	}
	section {
		width : 100%;
		height : 800px;
		background-color: white;
	}
	
	header{
		width : 100%;
		background-color: yellow;
	}
	
	body {
		
	}
	footer{
		width : 100%;
		height : 200px;
		background-color: lightgreen;
	}
	
	#container{
		margin-left:auto;
		margin-right:auto;
	} */
</style>


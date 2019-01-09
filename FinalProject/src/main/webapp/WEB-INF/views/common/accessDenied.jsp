<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 Page not found.</title>
</head>
<body>
	<h1>Access Denied</h1>
	<a href="${pageContext.request.contextPath }">메인 페이지로</a>

	<h2>권한이 없습니다.</h2>

</body>
</html>
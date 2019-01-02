<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta charset="UTF-8">
<title>${msg}</title>
</head>
   <%-- <h2>msg : ${msg}</h2>
   <h3>loc : ${loc} <a href="${pageContext.request.contextPath}/${loc}"> 페이지로 이동</a></h3> --%>
<script>
   alert("${msg}");
   history.go(${loc});s
</script>
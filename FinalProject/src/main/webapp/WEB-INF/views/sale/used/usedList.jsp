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
<c:import url="../../common/header.jsp" />

<style>

.product-box {
	height: 200px;
	border: 1px solid white;
	padding: 10px;
	margin: 10px;
}

a {
	color: black;
}

.btn-write {
	float: right;
	margin-right: 10px;
}

#goodsPicture {
	width: 100%;
	height: 100%;
}

.pro {
	padding-left: 0px;
}

.pro-con {
	margin-top: 10px;
}

.title {
	font-size: 20px;
	padding-bottom: 10px;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.pro-info {
	margin-top: 20px;
}

.product-box:hover {
	background-color: #f8f8f8;
	cursor: pointer;
}

</style>

</head>
<body>

<c:import url="../../common/menubar.jsp" />
<div class="wrap_inner">
<main id="container">
<section>

<div class="section-left"><!-- 내용없음 --></div>

<div class="section-center">
<div class="dc-content">
<div class="dc-content-title">
	<h3>중고거래</h3>
</div>
		
<div class="dc-content-box">
<!-- ------------------- 내용 입력 ------------------- -->

<c:set var="viewPath" value="${pageContext.request.contextPath}/sale/used/usedView.do?boardNo=" />

<div class="row">
	<div class="col-md-12">
		<button class="btn btn-write" onclick="goUsedForm();">글쓰기</button>
	</div>
</div> <hr />

<c:forEach items="${list}" var="u">
<div class="row product-box" onclick="location.href='${viewPath}${u.boardNo}'">
	<div class="col-md-3 pro">
		<img id="goodsPicture" src="${u.goodsPicture}" />
	</div>
	<div class="col-md-6 pro pro-con">
		<p class="title">${u.title}</p>
		<p class="pro-info">물품명 : ${u.goodsName}</p>	
		<p class="pro-info">가격 : ${u.price} 원</p>
	</div> 
	<div class="col-md-3 pro pro-con">
		<br />
		<p class="pro-info">${u.memberName} </p>
		<br />
		<span>${u.writeDate}</span>
		<span style="float:right;">조회수 ${u.viewCount}</span>
	</div>
</div> <hr />
</c:forEach>

<c:out value="${pageBar}" escapeXml="false" />
	
<!-- -------------------------------------------- -->
</div>
</div>
</div>

<div class="section-right"><c:import url="../../common/rightSection.jsp" /></div>
	
</section>
</main>
</div>
<c:import url="../../common/footer.jsp" />



<!-------------------- Script -------------------->
<script>

	function goUsedForm(){
		location.href = "${pageContext.request.contextPath}/sale/used/usedForm.do";
	}	

</script>

</body>
</html>
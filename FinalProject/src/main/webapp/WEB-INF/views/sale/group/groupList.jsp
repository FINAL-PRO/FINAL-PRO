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

.product-box>div {
	float: left;
}

.product-box {
	width: 1000px;
	height: 200px;
	border: 1px solid black;
	padding: 5px;
	margin: 5px;
}

.product-info {
	height: 100%;
	padding: 10px;
}

.product-img {
	width: 20%;
}

.product-text {
	width: 60%;
}

.product-pro {
	width: 20%;
}

a {
	color: black;
}

.btn {
	float: right;
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
	<span style="size:20px;">공동구매</span>
	<button class="btn" onclick="goGroupForm();">글쓰기</button>
</div>
		
<div class="dc-content-box">
<!-- ------------------- 내용 입력 ------------------- -->

<c:set var="viewPath" value="${pageContext.request.contextPath}/sale/group/groupView.do?boardNo=" />

<c:forEach items="${list}" var="g">
<div class="product-box">
	<div class="product-info product-img">
		<a href="${viewPath}${g.boardNo}"><img src="${g.goodsPicture}" /></a>
	</div>
	<div class="product-info product-text">
		<p class="title"><a href="${viewPath}${g.boardNo}">${g.title}</a></p>
		<p><a href="${viewPath}${g.boardNo}">${g.goodsName}</a></p>
		<span>${g.price}원</span> <br /> 
		
		<span>${g.writeDate}</span>
		<span>조회수 ${g.viewCount}</span>
	</div> 
	<div class="product-info product-pro">
		<p>진행자 : ${g.memberName}</p>
		<p>마감일 : ${g.endDate}</p>
		<p>인원 : ${g.maxCount}명/${g.currentCount}명</p>
	</div>
</div>
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

	function goGroupForm(){
		location.href = "${pageContext.request.contextPath}/sale/group/groupForm.do";
	}	

</script>

</body>
</html>
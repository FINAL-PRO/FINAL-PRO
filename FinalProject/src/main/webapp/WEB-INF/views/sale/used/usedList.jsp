<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sale/dc-sale-style.css" />
<title>동커</title>
<c:import url="../../common/header.jsp" />
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
	<span class="dc-title-text">중고거래</span>
</div>
		
<div class="dc-content-box">
<!-- ------------------- 내용 입력 ------------------- -->

<c:set var="viewPath" value="${pageContext.request.contextPath}/sale/used/view.do?boardNo=" />

<div style="height:40px;">
	<button class="btn btnGroup" id="btnSubmit" onclick="goUsedForm();">글쓰기</button>
</div> <hr />

<c:forEach items="${list}" var="u">
<div class="row product-box" onclick="location.href='${viewPath}${u.boardNo}'">
	<div class="col-md-3" style="position: relative;">
		<div class="pro-img">
			<img class="goodsPicture" src="${u.goodsPicture}" />
		</div>
		<c:if test="${'판매완료' eq u.status}">
			<div class="pro-img" style="background-color:rgba(0,0,0,.5);">
				<div class="sold-text"><span>판매<br />완료</span></div>
			</div>
		</c:if>
	</div>
	<div class="col-md-6 pro-con">
		<p class="title">${u.title}</p>
		<p class="pro-info">물품명 : ${u.goodsName}</p>	
		<p class="pro-info">가격 : ${u.price} 원</p>
	</div> 
	<div class="col-md-3 pro-con">
		<p class="pro-info">${u.memberName} </p>
		<p class="pro-info">거래방법 : ${u.dealType}</p>
		<p class="pro-info">판매상태 : ${u.status}</p>
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
		location.href = "${pageContext.request.contextPath}/sale/used/insertForm.do";
	}	

</script>

</body>
</html>
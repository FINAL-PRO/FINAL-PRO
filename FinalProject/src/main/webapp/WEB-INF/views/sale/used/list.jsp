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
}

.product-img {
	width: 20%;
	height: 100%;
	background-color: yellow;
	padding: 10px;
}

.product-text {
	width: 80%;
	height: 100%;
	background-color: orange;
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
<div class="dc-content-title"><h1>제목</h1></div>
		
<div class="dc-content-box">
<!-- ------------------- 내용 입력 ------------------- -->

<c:set var="viewPath" value="${pageContext.request.contextPath}/sale/group/groupView.do?boardNo=" />

<input type="button" value="글쓰기" onclick="goGroupForm();" /> <br />

<c:forEach items="${list}" var="g">
<div class="product-box">
	<div class="product-info product-img">
		<a href="${viewPath}${g.boardNo}"><img src="${g.thumbnail}" /></a>
	</div>
	<div class="product-info product-text">
		<p>${g.title}</p>
		<span>${g.goodsName}</span> <span>${g.price}원</span> <span>${g.currentCount}명/${g.maxCount}명</span>
		<span>마감일 ${g.endDate}</span> <span>${g.memberName}</span> <span>${g.writeDate}</span>
		<span>조회수 ${g.viewCount}</span>
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
	
	$(function(){
		$('.right').on("click",function(){
			var boardNo = $(this).siblings('input[name="boardNo"]').val();
			location.href = "${pageContext.request.contextPath}/sale/group/groupView.do?boardNo="+boardNo;
		});
	});
	
</script>

</body>
</html>
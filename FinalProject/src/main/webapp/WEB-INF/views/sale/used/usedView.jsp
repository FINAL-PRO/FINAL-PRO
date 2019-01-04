<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

.dc-content-box {
	padding-left: 50px;
	padding-right: 50px;
	margin-bottom: 50px;
}

.title-box {
	margin-top: 10px;
	margin-bottom: 10px;
}

.img-box {
	height: 250px;
	width: 250px;
}

.info {
	width: 100%;
}

.warn-msg {
	color:red; 
	font-size:12px; 
	padding-top:3px;
}

#goodsImg {
	width: 100%;
	height: 100%;
}

#content {
	width: 100%;
	height: auto;
	padding: 30px;
	border: 1px solid lightgray;
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
	
<div class="title-box">
	<label class="title-label" for="title">제목</label>
	<span class="" id="title">${used.title }</span>
</div> <hr />
	
<div style="display:inline-block; width:100%;">
	<div style="float:left; width:30%;">
		<div class="img-box" style="border:1px solid black;">
			<img id="goodsImg" src="${used.goodsPicture}"/>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-2">
			<p class="info-label">물품명</p>
			<p class="info-label">가격</p>
			<p class="info-label">거래방법</p>
		</div>
		<div class="col-md-4">
			<p>${used.goodsName}</p>
			<p>${used.price}<span>원</span></p>
			<p>${used.dealType}</p>
		</div>
	</div>
</div> <hr />
	
<div>
	<div id="content">${group.content }</div>
</div>
	
<br /><br />
<input type="button" value="목록" class="" onclick="goUsedList();"/>
<c:if test="${!empty member and member.no eq group.memberNo}">
	<input type="button" value="수정하기" class="" onclick="updateUsed();"/>
	<input type="button" value="삭제하기" class="" onclick="deleteUsed();"/>
</c:if>
<br /><br />

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
	
	$(function(){

	});
	
	function goUsedList() {
		location.href = "${pageContext.request.contextPath}/sale/used/list.do";
	}
	
	function updateUsed() {
		location.href = "${pageContext.request.contextPath}/sale/used/usedUpdateForm.do?boardNo="+${used.boardNo};
	}
	
	function deleteUsed() {
		location.href = "${pageContext.request.contextPath}/sale/used/usedDelete.do?boardNo="+${used.boardNo};
	}

</script>

</body>
</html>
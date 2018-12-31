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

label.info-label {
	margin-left: 30px;
	padding-top: 10px;
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
	broder: 1px solid gray;
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
	<span class="" id="title">${group.title }</span>
</div> <hr />
	
<div style="display:inline-block; width:100%;">
	<div style="float:left; width:30%;">
		<div class="img-box" style="border:1px solid black;">
			<img id="goodsImg"/>
		</div>
	</div>
	
	<div>
	<table class="product-info">
	<colgroup>
		<col width="200px"/>
		<col width="400px"/>
	</colgroup>
	<tbody>
		<tr>
			<th><label class="info-label" for=goodsName>물품명</label></th>
			<td><span class="" id="">${group.goodsName }</span></td>
		</tr>
		<tr>
			<th><label class="info-label" for="price">가격</label></th>
			<td><span class="" id="">${group.price }</span></td>
		</tr>
		<tr>
			<th><label class="info-label" for="maxCount">모집인원</label></th>
			<td><span class="" id="">${group.maxCount }</span></td>
		</tr>
		<tr>
			<th><label class="info-label" for="dealType">거래방법</label></th>
			<td><span class="" id="">${group.dealType }</span></td>
		</tr>
		<tr>
			<th><label class="info-label" for="deposit">계좌번호</label></th>
			<td>
				<span class="" id="bank">${group.deposit }</span>
				<span class="" id="deposit">${group.deposit }</span>
			</td>
		</tr>
		<tr>
			<th><label class="info-label" for=endDate>마감일</label></th>
			<td><span class="" id="endDate">${group.endDate }</span></td>
		</tr>
	</tbody>
	</table>
	</div>
	
</div> <hr />
	
<div>
	<div id="content">${group.content }</div>
</div>
	
<br /><br />
<input type="button" value="목록" class="" onclick="goGroupList();"/>
<c:if test="${!empty member and member.no eq group.memberNo}">
	<input type="button" value="수정하기" class="" onclick="updateGroup();"/>
	<input type="button" value="삭제하기" class="" onclick="deleteGroup();"/>
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

	function goGroupList() {
		location.href = "${pageContext.request.contextPath}/sale/group/list.do";
	}
	
	function updateGroup() {
		location.href = "${pageContext.request.contextPath}/sale/group/groupUpdateForm.do?boardNo="+${group.boardNo};
	}
	
	function deleteGroup() {
		location.href = "${pageContext.request.contextPath}/sale/group/groupDelete.do?boardNo="+${group.boardNo};
	}

</script>

</body>
</html>
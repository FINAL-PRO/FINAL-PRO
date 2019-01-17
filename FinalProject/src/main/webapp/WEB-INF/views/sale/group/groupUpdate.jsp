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
	<span class="dc-title-text">공동구매</span>
</div>
		
<div class="dc-content-box">
<!-- ------------------- 내용 입력 ------------------- -->

<form id="boardForm" action="${pageContext.request.contextPath}/sale/group/groupUpdateFormEnd.do" method="post">
	<input type="hidden" name="memberNo" value="${member.no}" required /> 
	<input type="hidden" name="boardNo" value="${group.boardNo}" />

	<div class="title-box">		
		<input type="text" class="info form-control" name="title" id="title" value="${group.title}" />
		<!-- <p class="warn-msg" id="titleMsg">제목은 50글자를 넘을 수 없습니다.</p> -->	
	</div>
	
	<div class="row">
		<div class="col-md-4 img-box" style="padding-left:20px;">		
			<img class="goodsImg-box" id="goodsImg" src="${group.goodsPicture}"/>				
			<input type="file" id="inputFile" style="display:none;" onchange="inputPicture(this);"/>
			<input type="hidden" id="goodsPicture" name="goodsPicture" value="${group.goodsPicture}"/>
			<input type="button" class="btn btnGroup" style="width:100%;" id="btnPic" value="물품사진 등록하기">		
		</div>
		
		<div class="col-md-8">
			<table class="product-info" style="width:100%;">
			<colgroup><col width="30%"/><col width="70%"/></colgroup>
			<tbody>
				<tr>
					<th><label class="info-label" for=goodsName>물품명</label></th>
					<td><input type="text" class="form-control" name="goodsName" id="goodsName" value="${group.goodsName}"/></td>
				</tr>
				<tr>
					<th><label class="info-label" for="price">가격</label></th>
					<td><input type="text" class="form-control" name="price" id="price" value="${group.price}" disabled="disabled"/></td>
				</tr>
				<tr>
					<th><label class="info-label" for="maxCount">모집인원</label></th>
					<td>
						<input type="text" class="form-control" name="maxCount" id="maxCount" value="${group.maxCount}" disabled="disabled"/>
						<!-- <p class="warn-msg" id="maxCountMsg"></p> -->
					</td>
				</tr>
				<tr>
					<th><label class="info-label" for="dealType">거래방법</label></th>
					<td>직거래 <input type="radio" name="dealType" value="DEAL001" /> 
					택배 <input type="radio" name="dealType" value="DEAL002" /></td>
				</tr>
				<tr>
					<th valign="top"><label class="info-label" for="deposit">계좌번호</label></th>
					<td>
						<div class="row" style="margin: 0px;">
						<select class="col-md-4 form-control" name="bank" id="bank" style="display: inline-block;">
							<c:forEach items="${bankList}" var="bank">
								<option value="${bank.id}" ${(bank.id eq group.bank) ? "selected" : ""}>${bank.value}</option>
							</c:forEach>
						</select> 
						<input type="text" class="col-md-8 form-control" name="deposit" id="deposit" 
							value="${group.deposit}" style="display: inline-block;"/> <br /> 
						</div>
						<p class="warn-msg" style="float: right;">반드시 본인 명의의 계좌를 입력해 주세요.</p>
					</td>
				</tr>
				<tr>
					<th><label class="info-label" for=endDate>마감일</label></th>
					<td><input type="date" class="form-control" name="endDate" id="endDate" value="${group.endDate}" /></td>
				</tr>
			</tbody>
			</table>	
		</div>
	</div> <br /> <hr />	

	<div>
		<textarea id="summernote" name="content">${group.content}</textarea>
	</div> <br />
	
	<div style="display:flex; justify-content: center;">
		<input type="submit" class="btn btnGroup" value="수정완료" />
		<input type="button" class="btn btnGroup" value="수정취소" onclick="cancelUpdate();"/>
	</div>
	<br /><br />
</form>

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

	$(function() {
		
		$(('input[value="${group.dealType}"]')).attr("checked", true);
	});

	$('#summernote').summernote({
		height : 500,
		minHeight : 500,
		maxHeight : 500,
		focus : true,
		callbacks : {
			onImageUpload : function(files) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i]);
		}}}
	});

	function sendFile(file) {
		var form_data = new FormData();
		form_data.append('file', file);

		$.ajax({
			url : '${pageContext.request.contextPath}/common/summernote/convertImage.do',
			data : form_data,
			type : "POST",
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(url) {
				$('#summernote').summernote('editor.insertImage', url);
			},
			error : function() {
				console.log("이미지 업로드 실패");
			}
		});
	}
	
	$('#btnPic').on("click", function() {
		$('#inputFile').click();
	});	
	
	function inputPicture(value) {
		if(value.files && value.files[0]) {
			var reader = new FileReader();
			var form_data = new FormData();
			form_data.append('file', value.files[0]);

			$.ajax({
				url : '${pageContext.request.contextPath}/common/summernote/convertImage.do',
				data : form_data,
				type : "POST",
				cache : false,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(url) {
					$('#goodsImg').attr('src', url);	
					$('#goodsPicture').attr('value', url);	
					$('#imgMsg').hide();
				}
			});
		}
	}

	function cancelUpdate(){
		location.href = "${pageContext.request.contextPath}/sale/group/groupView.do?boardNo="+${group.boardNo};
	}	
	
	$('#btnSubmit').click(function(){
		$('#boardForm').submit();
	});
	
	// groupInsert랑 똑같은 정규식 처리
	
</script>

</body>
</html>
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
<div class="dc-content-title"><h1>제목</h1></div>
		
<div class="dc-content-box">
<!-- ------------------- 내용 입력 ------------------- -->

<form name="boardForm" action="${pageContext.request.contextPath}/sale/used/update.do" method="post">
	<input type="hidden" name="memberNo" value="${member.no}" required /> 
	<input type="hidden" name="boardNo" value="${used.boardNo}" />
	
	<div class="title-box">		
		<input type="text" class="info form-control" name="title" id="title" value="${used.title}" />
		<!-- <p class="warn-msg" id="titleMsg">제목은 50글자를 넘을 수 없습니다.</p> -->	
	</div>
	
	<div class="row">
		<div class="col-md-4 img-box" style="padding-left:20px;">		
			<img class="goodsImg-box" id="goodsImg" src="${used.goodsPicture}"/>				
			<input type="file" id="inputFile" style="display:none;" onchange="inputPicture(this);"/>
			<input type="hidden" id="goodsPicture" name="goodsPicture" value="${used.goodsPicture}"/>
			<input type="button" class="btn btnGroup" style="width:100%;" id="btnPic" value="물품사진 등록하기">		
		</div>
		<div class="col-md-8">
			<table class="product-info" style="width:100%;">
			<colgroup><col width="30%"/><col width="70%"/></colgroup>
			<tbody>
			<tr>
				<th><label class="info-label" for=goodsName>물품명</label></th>
				<td><input type="text" class="info form-control" name="goodsName" id="goodsName"
						value="${used.goodsName}"  /></td>
			</tr>
			<tr>
				<th><label class="info-label" for="price">가격</label></th>
				<td><input type="text" class="info form-control" name="price" id="price" 
						value="${used.price}" disabled="disabled"/></td>
			</tr>
			<tr>
				<th><label class="info-label" for="dealType">거래방법</label></th>
				<td>
					직거래 <input type="radio" name="dealType" value="DEAL001" /> 
					택배 <input type="radio" name="dealType" value="DEAL002" />
					안전거래 <input type="radio" name="dealType" value="DEAL003" />
				</td>
			</tr>
			</tbody>
			</table>	
		</div>
	</div> <br /><br /> <hr />	
	
	<div>
		<textarea id="summernote" name="content">${used.content}</textarea>
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
		
		$(('input[value="${used.dealType}"]')).attr("checked", true);
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
		location.href = "${pageContext.request.contextPath}/sale/used/view.do?boardNo="+${used.boardNo};
	}	
	
	
	// groupInsert랑 똑같은 정규식 처리
	
</script>

</body>
</html>
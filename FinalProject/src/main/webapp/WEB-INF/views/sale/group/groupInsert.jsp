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

<form name="boardForm" action="${pageContext.request.contextPath}/sale/group/groupFormEnd.do" method="post">
	<input type="hidden" name="memberNo" value="${member.no}" required /> 
	
	<div class="row title-box">
		<div class="col-md-1">
			<label class="title-label" for="title">제목</label>
		</div>
		<div class="col-md-9">
			<input type="text" class="info" name="title" id="title" />
			<p class="warn-msg">제목은 50글자를 넘을 수 없습니다.</p>
		</div>
		<div class="col-md-2"></div>
	</div> <hr />
	
	<div style="display:inline-block; width:100%;">
		<div style="float:left; width:30%;">
			<div class="img-box" style="border:1px solid black;">
				<span id="imgMsg">물품 사진을 등록해주세요.</span>
				<img id="goodsImg"/>
			</div>
			<input type="file" id="inputFile" style="display:none;" onchange="inputPicture(this);"/>
			<input type="hidden" id="goodsPicture" name="goodsPicture" />
			<button type="button" style="width:250px;" id="btnPic">물품사진 등록하기</button>
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
				<td><input type="text" class="info" name="goodsName" id="goodsName" /></td>
			</tr>
			<tr>
				<th><label class="info-label" for="price">가격</label></th>
				<td><input type="text" class="info" name="price" id="price" /></td>
			</tr>
			<tr>
				<th><label class="info-label" for="maxCount">모집인원</label></th>
				<td><input type="text" class="info" name="maxCount" id="maxCount" /></td>
			</tr>
			<tr>
				<th><label class="info-label" for="dealType">거래방법</label></th>
				<td>직거래 <input type="radio" name="dealType" value="DEAL001" /> 
				택배 <input type="radio" name="dealType" value="DEAL002" /></td>
			</tr>
			<tr>
				<th><label class="info-label" for="deposit">계좌번호</label></th>
				<td>
					<select class="" name="bank" id="bank" style="padding: 0; width:30%;">
						<c:forEach items="${bankList}" var="bank">
							<option value="${bank.id}">${bank.value}</option>
						</c:forEach>
					</select> 
					<input type="text" class="info" name="deposit" id="endDate" style="width:68%;"/> <br /> 
					<p class="warn-msg">반드시 본인 명의의 계좌를 입력해 주세요.</p>
				</td>
			</tr>
			<tr>
				<th><label class="info-label" for=endDate>마감일</label></th>
				<td><input type="date" class="info" name="endDate" id="endDate"/></td>
			</tr>
		</tbody>
		</table>
		</div>
		
	</div> <hr />
	
	<div>
		<textarea id="summernote" name="content"></textarea>
	</div>
	
	<br /><br />
	<input type="button" class="a" value="글쓰기" onClick="submitForm();"/>
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
	
	function submitForm() {
		if($('input[name="memberNo"]').val() == 0 ) {
			alert("로그인이 필요한 기능입니다.");
		} else if($('input[name="title"]').val() == "" ) {
			alert("제목을 입력해 주세요.");
		} else if ($('input[name="goodsPicture"]').val() == "" ) {
			alert("물품 사진을 등록해주세요.");
		} else if ($('input[name="goodsName"]').val() == "" ) {
			alert("물품명을 입력해 주세요.");
		} else if ($('input[name="price"]').val() == "" ) {
			alert("물품 가격을 입력해 주세요.");
		} else if ($('input[name="maxCount"]').val() == "" ) {
			alert("공동구매 모집 인원을 입력해 주세요.");
		} else if ($('input[name="dealType"]').val() == "" ) {
			alert("거래 방법을 선택해 주세요.");
		} else if ($('input[name="deposit"]').val() == "" ) {
			alert("계좌번호를 입력해 주세요.");
		} else if ($('input[name="endDate"]').val() == "" ) {
			alert("마감일을 입력해 주세요.");
		} else {
			alert($('input[name="maxCount"]').val());
			$('form').submit();
		}
	}
	
	$("#maxCount").on("keyup", function() {
		var title = $("#maxCount").val().trim();
		var regPwd = /^[0-9]$/g;
		if (title == "") {
			$("#pwdChkComment").text('비밀번호을 입력하세요.');
		} else if (!regPwd.test(title)) {
			$("#pwdChkComment").text('영대문자/특수문자/숫자 최소 1개 포함 6자 이상!');
		} else {
			$("#pwdChkComment").text('OK!');
		}
	});
	
	
	
	
	// 제목 100바이트 넘지 않게 정규식 처리
	
</script>

</body>
</html>
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

<form name="boardForm" action="${pageContext.request.contextPath}/sale/group/groupFormEnd.do" method="post">
	<input type="hidden" name="memberNo" value="${member.no}" required /> 

	<div class="title-box">		
		<input type="text" class="info form-control" name="title" id="title" 
			placeholder="제목을 입력하세요."/>
		<!-- <p class="warn-msg" id="titleMsg">제목은 50글자를 넘을 수 없습니다.</p> -->	
	</div>
	
	<div class="row">
		<div class="col-md-4 img-box" style="padding-left:20px;">		
			<img class="goodsImg-box" id="goodsImg"/>				
			<input type="file" id="inputFile" style="display:none;" onchange="inputPicture(this);"/>
			<input type="hidden" id="goodsPicture" name="goodsPicture" />
			<input type="button" class="btn btnGroup" style="width:100%;" id="btnPic" value="물품사진 등록하기">		
		</div>
		<div class="col-md-8">
			<table class="product-info" style="width:100%;">
			<colgroup><col width="30%"/><col width="70%"/></colgroup>
			<tbody>
				<tr>
					<th><label class="info-label" for=goodsName>물품명</label></th>
					<td><input type="text" class="info form-control" name="goodsName" id="goodsName" /></td>
				</tr>
				<tr>
					<th><label class="info-label" for="price">가격</label></th>
					<td><input type="text" class="info form-control" name="price" id="price" /></td>
				</tr>
				<tr>
					<th><label class="info-label" for="maxCount">모집인원</label></th>
					<td>
						<input type="text" class="info form-control" name="maxCount" id="maxCount" 
								placeholder="1~20 사이의 숫자를 입력해주세요."/>
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
								<option value="${bank.id}">${bank.value}</option>
							</c:forEach>
						</select> 
						<input type="text" class="col-md-8 info form-control" name="deposit" id="deposit" style="display: inline-block;"/> <br /> 
						</div>
						<p class="warn-msg" style="float: right;">반드시 본인 명의의 계좌를 입력해 주세요.</p>
					</td>
				</tr>
				<tr>
					<th><label class="info-label" for=endDate>마감일</label></th>
					<td><input type="date" class="info form-control" name="endDate" id="endDate"/></td>
				</tr>
			</tbody>
			</table>	
		</div>
	</div> <br />	

	
	<div>
		<textarea id="summernote" name="content"></textarea>
	</div>
	
	<br />
	<input type="button" class="btn btnGroup" id="btnSubmit" value="글쓰기" onClick="submitForm();"/>
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
	
	var priceChk = false;
	
	$(function(){
		var today = new Date();
		var endDate = new Date();
		today.setDate(today.getDate() + 1);
		endDate.setDate(today.getDate() + 10);
		
		$('#endDate').attr("min", today.toISOString().substr(0,10))
					 .attr("max", endDate.toISOString().substr(0,10));
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
	
	// 폼 미입력시 입력하라는 알림창 띄움
	function submitForm() {
		if($('input[name="memberNo"]').val() == 0 ) {
			alert("로그인이 필요한 기능입니다.");
		} else if ($('input[name="goodsPicture"]').val() == "" ) {
			alert("물품 사진을 등록해주세요.");
		} else if ($('input[name="goodsName"]').val() == "" ) {
			alert("물품명을 입력해 주세요.");
		} else if ($('input[name="price"]').val() == "" ) {
			alert("물품 가격을 입력해 주세요.");
		} else if (priceChk != true){
			alert("가격은 100원~100만원 사이만 가능합니다.");
		} else if ($('input[name="maxCount"]').val() == "" ) {
			alert("공동구매 모집 인원을 입력해 주세요.");
		} else if (maxCountChk != true){
			alert("모집 인원은 1~20명 사이만 가능합니다.");
		} else if ($('input[name="dealType"]:checked').val() == null ) {
			alert("거래 방법을 선택해 주세요.");
		} else if ($('input[name="deposit"]').val() == "" ) {
			alert("계좌번호를 입력해 주세요.");
		} else if ($('input[name="endDate"]').val() == "" ) {
			alert("마감일을 입력해 주세요.");
		} else if ($('#summernote').val() == "" ) {
			alert("글 내용을 등록해주세요.");
		} else {
			$('form[name="boardForm"]').submit();
		}
	}

	var priceChk = false;
	// 가격 --> 정규식처리:100~1000000 (백원~백만원)
	$("#price").on("keyup", function() {
		var price = $("#price").val().trim();
		var regPwd = /^[0-9]{1,7}$/g;
		
		if (!regPwd.test(price)) {
			priceChk = false;
		} else if (price>1000000 || price<100) {
			priceChk = false;
		} else {
			priceChk = true;
		}
	});
	
	var maxCountChk = false;
	// 모집인원 --> 정규식처리:1~20 사이 숫자만
	$("#maxCount").on("keyup", function() {
		var maxCount = $("#maxCount").val();
		var regPwd =  /^[0-9]{1,2}$/g;
		
		if (!regPwd.test(maxCount)) {
			maxCountChk = false;
		} else if (maxCount>20 || maxCount<1) {
			maxCountChk = false;
		} else {
			maxCountChk = true;
		}
	});

	
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구인구직 게시판 작성페이지</title>
	<c:import url="../../common/header.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jobBoard/jobBoardInsCss.css" />
</head>
<body>
	<c:import url="../../common/menubar.jsp"/>	
	<div class="wrap_inner">
	<main id="container">
		<section>
			<div class="section-left">
					<!-- 내용없음 -->
			</div>
			
		<div class="section-center">
			<div class="dc-content">
				<div class="dc-content-title">
				<h1>구인구직 게시판 작성페이지</h1>
				</div>
				<form id="jInsForm" method="post" action="${pageContext.request.contextPath}/job/jobBoard/insertJobBoard.do">
				<div class="dc-content-box"><br />
				<div class="jb-margin">
				<label class="insLabel">제목&nbsp;</label>
				<input type="text" class="insTitle" placeholder="제목" name="title" id="title" required/><br />
				
				<label class="insLabel">작성자&nbsp;</label>${member.nickName}
				<input type="text" class="" value="${member.nickName}" hidden required/><br />
				<input type="hidden" class="" name="memberNo" id="memberNo" value="${member.no}" readonly required/>
				
				 
				<label class="insLabel">구인구직여부&nbsp;</label>
				<input type="radio" name = "type" value = "JTYPE001" checked><label> 구인 </label>&nbsp;&nbsp;&nbsp;
				<input type="radio" name = "type" value = "JTYPE002"><label> 구직 </label><br />
				
				
				<label class="insLabel">구인일&nbsp;</label>
				<input type="date" name="startDate"/> ~
				<input type="date" name="endDate"/> <br />
				
				 
				<label class="insLabel">근무기간&nbsp;</label>
				<input type="date" name="startJob"/> ~
				<input type="date" name="endJob"/> <br />
				
				 
				<label class="insLabel">근무시간&nbsp;</label>
				<input type="time" name="startTime" id="startTime"> ~
				<input type="time" name="endTime" id="endTime"><br />

				
				<label class="insLabel">상호명&nbsp;</label>
				<input type="hidden" class="" id="companyNo" name="companyNo"/>
				<input type="text" class="" placeholder="상호명" id="companyName" onclick="selectCompany();" readonly required/>
				<input type="text" class="" placeholder="근무장소" name="location" id="location"/>
				<br/>
				
				<label class="insLabel">고용형태&nbsp;</label>
				<select name="jobType" id="jobType" size="1">
					<option name="JOBTYPE001" value="JOBTYPE001" selected>정규직</option>
					<option value="JOBTYPE002">비정규직</option>
					<option value="JOBTYPE003">파트타임</option>
				</select><br/>
				
				<label class="insLabel">급여형태&nbsp;</label>
				<input type="number" min="0"  class="" placeholder="급여" name="salary" id="salary" required/>원
				<select name="salType" id="salType" size="1">
					<option name="salType" value="SALTYPE001" selected>시급</option>
					<option name="salType" value="SALTYPE002">일급</option>
					<option name="salType" value="SALTYPE003">주급</option>
					<option name="salType" value="SALTYPE004">월급</option>
					<option name="salType" value="SALTYPE005">연봉</option>
				</select><br/><hr />
			<textarea id="summernote" name="content"></textarea> <br />
			</div>
			</div>
			<button class="btn btn-outline-info" type="submit">게시글 등록</button>
			</form>
			

			
		</div>
			</div>
			<div class="section-right">
				<c:import url="../../common/rightSection.jsp"/>
			</div>
		</section>
		<c:import url="../../common/footer.jsp"/>
	</main>
	</div>
	
<script>
	function selectCompany() {
		window.name = "jobBoardInsertForm";	
		var childWindow = window.open("jobBoardComPop.do", "comPop", "width=500, height=400");
	}
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
			url: '${pageContext.request.contextPath}/common/summernote/convertImage.do',
			data: form_data,
			type: "POST",
			cache: false,
			contentType: false,
			enctype: 'multipart/form-data',
			processData: false,
			success : function(url) {
				$('#summernote').summernote('editor.insertImage', url);
			}, error : function(){						
				console.log("이미지 업로드 실패");						
			}
		});
	}

</script>	
	
	
</body>
</html>
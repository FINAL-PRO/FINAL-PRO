<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>구인구직 게시판 작성페이지</title>
	<c:import url="../../common/header.jsp"/>
</head>
<body>
	<c:import url="../../common/menubar.jsp"/>	
	<div class="wrap_inner">
	<main id="container">
		<section>
			<div class="section-left">
			<!-- <a href="test/select.do">select test</a> -->
				<img class="adimg" src="${pageContext.request.contextPath}/resources/images/adimg1.jpg" 
				alt="메인_좌측_세로배너" width="140" height="800"
				style="margin-left: 1px;margin-right: 1px; margin-top:60px; margin-bottom:60px;
				border:1px solid red"/>
			</div>
			
			<div class="section-center">
			<h1>구인구직 게시판 작성페이지</h1>
			<div id="jobBoard-container">
				<div class="dc-content"><br />
				제목 : <input type="text" class="" placeholder="제목" name="jobBoardTitle" id="jobBoardTitle" required/><br /><br />
				작성자 : <input type="text" class="" value="${member.nickName}" readonly required/><br /><br />
				구인구직여부 : 
				<input type="radio" name = "type" value = "hire" checked><label> 구인 </label>
				<input type="radio" name = "type" value = "offer"><label> 구직 </label><br /><br />
				
				구인일 : 
				<input type="date" name="startDate"/> ~
				<input type="date" name="endDate"/> <br /><br />
				
				근무일 : 
				<input type="date" name="startJob"/> ~
				<input type="date" name="endJob"/> <br /><br />
				
				근무시간 : 
				<input type="number" min="0" max="24" class="" name="startHour" id="startTime" required/>시 
				<input type="number" min="0" max="60" class="" name="startMin" id="startMin" required/>분   ~   
				<input type="number" min="0" max="24" class="" name="endTime" id="endTime" required/>시
				<input type="number" min="0" max="60" class="" name="endMin" id="endMin" required/>분<br /><br />
				
				상호명 :
				<input type="text" class="" placeholder="상호명" name="companyNo" id="companyNo" required/>
				<input type="text" class="" placeholder="근무장소" name="endTime" id="endTime" required/>
				<button type="button" onclick="selectCompany();">업체찾기</button><br /><br />
				
				고용형태 :
				<select name="jobType" id="jobType" size="1">
					<option value="JOBTYPE001" selected>정규직</option>
					<option value="JOBTYPE002">비정규직</option>
					<option value="JOBTYPE003">파트타임</option>
				</select><br/><br />
				급여형태 : 
				<input type="number" min="0"  class="" placeholder="급여" name="salary" id="salary" required/>원
				<select name="salType" id="salType" size="1">
					<option value="SALTYPE001" selected>시급</option>
					<option value="SALTYPE002">일급</option>
					<option value="SALTYPE003">주급</option>
					<option value="SALTYPE004">월급</option>
					<option value="SALTYPE005">연봉</option>
				</select><br/><hr />
			</div>
			
			내용 : 
			<textarea id="summernote" name="content"></textarea> <br />
			</div>
			<button type="submit" onclick="insertJobTable();">게시글 등록</button>	
			</div>
			<div class="section-right">
			<img class="adimg" src="${pageContext.request.contextPath}/resources/images/adimg1.jpg" 
			alt="메인_우측_세로배너" width="140" height="800"
			style="margin-left: 1px;margin-right: 1px; margin-top:60px; margin-bottom:60px;
			border:1px solid red"/></div>
		</section>
		<c:import url="../../common/footer.jsp"/>
	</main>
	</div>
	
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
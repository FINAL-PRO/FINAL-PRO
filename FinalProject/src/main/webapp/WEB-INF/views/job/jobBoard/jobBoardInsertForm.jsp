<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<!-- 내용없음 -->
			</div>
			
			<div class="section-center">
			<div class="dc-content">
				<div class="dc-content-title">
				<h1>구인구직 게시판 작성페이지</h1>
				</div>
				<form id="jInsForm" method="post" action="${pageContext.request.contextPath}/job/jobBoard/insertJobBoard.do">
				<div class="dc-content-box"><br />
				제목 : <input type="text" class="" placeholder="제목" name="title" id="title" required/><br /><br />
				작성자 : <input type="text" class="" value="${member.nickName}" readonly required/><br /><br />
				<input type="hidden" class="" name="memberNo" id="memberNo" value="${member.no}" readonly required/>
				
				구인구직여부 : 
				<input type="radio" name = "type" value = "JTYPE001" checked><label> 구인 </label>
				<input type="radio" name = "type" value = "JTYPE002"><label> 구직 </label><br /><br />
				
				구인일 : 
				<input type="date" name="startDate"/> ~
				<input type="date" name="endDate"/> <br /><br />
				
				근무일 : 
				<input type="date" name="startJob"/> ~
				<input type="date" name="endJob"/> <br /><br />
				<!-- int 00 int 00 -> string 00:00 -->
				근무시간 : 
				<input type="time" name="startTime" id="startTime"> ~
				<input type="time" name="endTime" id="endTime"><br /><br />

				상호명 :
				<input type="hidden" class="" id="companyNo" name="companyNo"/>
				<input type="text" class="" placeholder="상호명" id="companyName" onclick="selectCompany();" readonly required/>
				<input type="text" class="" placeholder="근무장소" name="location" id="location"/>
				
				<script type="text/javascript">
					function selectCompany() {
						window.name = "jobBoardInsertForm";	
						var childWindow = window.open("jobBoardComPop.do", "popup01", "width=500, height=400");
					}
				</script>
				<br/><br/>
				고용형태 :
				<select name="jobType" id="jobType" size="1">
					<option name="JOBTYPE001" value="JOBTYPE001" selected>정규직</option>
					<option value="JOBTYPE002">비정규직</option>
					<option value="JOBTYPE003">파트타임</option>
				</select><br/><br />
				급여형태 : 
				<input type="number" min="0"  class="" placeholder="급여" name="salary" id="salary" required/>원
				<select name="salType" id="salType" size="1">
					<option name="salType" value="SALTYPE001" selected>시급</option>
					<option name="salType" value="SALTYPE002">일급</option>
					<option name="salType" value="SALTYPE003">주급</option>
					<option name="salType" value="SALTYPE004">월급</option>
					<option name="salType" value="SALTYPE005">연봉</option>
				</select><br/><hr />
			내용 : <textarea id="summernote" name="content"></textarea> <br />
			<button type="submit">게시글 등록</button>
			</div>
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
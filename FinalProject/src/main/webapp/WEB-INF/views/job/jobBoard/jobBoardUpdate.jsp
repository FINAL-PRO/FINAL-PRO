<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구인구직 게시판 업데이트</title>
	<c:import url="../../common/header.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jobBoard/jobBoardUpdCss.css" />
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
							<h1>구인구직 게시판 업데이트</h1>
						</div>
						<form id="jUpdForm" method="post" action="${pageContext.request.contextPath}/job/jobBoard/update.do">
						<div class="dc-content-box"><br />
						<div class="jb-margin">
						<input type="hidden" name="no" value="${jobBoard.no}"/></p>
						<input type="hidden" name="boardNo" value="${jobBoard.boardNo}"/>
						<input type="hidden" name="companyNo" value="${jobBoard.companyNo}"/>
						
						<label class="insLabel">제목&nbsp;</label> 
						<input type="text" class="insTitle" placeholder="제목" name="title" id="title" value="${jobBoard.title}" required/><br />
				
						<label class="insLabel">작성자&nbsp;</label>${member.nickName}
						<input type="text" class="" value="${member.nickName}" hidden required/><br />
						<input type="hidden" class="" name="memberNo" id="memberNo" value="${member.no}" readonly required/>
				

						<label class="insLabel">구인구직여부&nbsp;</label> 
						<input type="radio" name = "type" value = "JTYPE001" checked><label> 구인 </label>&nbsp;&nbsp;&nbsp;
						<input type="radio" name = "type" value = "JTYPE002"><label> 구직 </label><br />
						
						<label class="insLabel">구인일&nbsp;</label>
						<input type="date" name="startDate" value="${jobBoard.startDate}" required/> ~
						<input type="date" name="endDate" value="${jobBoard.endDate}"/> <br />
						
						<label class="insLabel">근무기간&nbsp;</label>
						<input type="date" name="startJob" value="${jobBoard.startJob}"/> ~
						<input type="date" name="endJob" value="${jobBoard.endJob}"/> <br />
						
						<label class="insLabel">근무시간&nbsp;</label> 
						<input type="time" name="startTime" id="startTime" value="${jobBoard.startTime}"> ~
						<input type="time" name="endTime" id="endTime" value="${jobBoard.endTime}"><br />
		
						<label class="insLabel">상호명&nbsp;</label>
						<input type="hidden" class="" id="companyNo" name="companyNo" value="${jobBoard.companyNo}"/>
						<input type="text" class="" placeholder="상호명" id="companyName" onclick="selectCompany();" value="${jobBoard.cName}" readonly required/>
						<input type="text" class="" placeholder="근무장소" name="location" id="location" value="${jobBoard.location}"/>
						
						<br/>
						<label class="insLabel">고용형태&nbsp;</label>
						<select name="jobType" id="jobType" size="1" value="${jobBoard.jobType}">
							<option name="JOBTYPE001" value="JOBTYPE001" selected>정규직</option>
							<option value="JOBTYPE002">비정규직</option>
							<option value="JOBTYPE003">파트타임</option>
						</select><br/><br />
						<label class="insLabel">급여형태&nbsp;</label>
						<input type="number" min="0"  class="" placeholder="급여" name="salary" id="salary" value="${jobBoard.salary}" required/>원
						<select name="salType" id="salType" size="1" value="${jobBoard.salType}">
							<option id="SALTYPE001" value="SALTYPE001" selected>시급</option>
							<option id="SALTYPE002" value="SALTYPE002">일급</option>
							<option id="SALTYPE003" value="SALTYPE003">주급</option>
							<option id="SALTYPE004" value="SALTYPE004">월급</option>
							<option id="SALTYPE005" value="SALTYPE005">연봉</option>
						</select><br/><hr />
					<textarea id="summernote" name="content">${jobBoard.content}</textarea> <br />
					<button class="btn btn-outline-info" type="submit">게시글 등록</button>
					</div>
					</div>
					</form>
					</div>
				</div>
				
				<div class="section-right">
					<c:import url="../../common/rightSection.jsp"/>
				</div>
			</section>
		</main>
	</div>
	<c:import url="../../common/footer.jsp"/>
	
<script>
	function selectCompany() {
		window.name = "jobBoardInsertForm";	
		var childWindow = window.open("comPop.do", "popup01", "width=500, height=400");
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
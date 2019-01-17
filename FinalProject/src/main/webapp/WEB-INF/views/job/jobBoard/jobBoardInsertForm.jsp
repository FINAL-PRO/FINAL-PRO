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
					<span class="dc-title-text">구인구직</span>
				</div>
				<form id="jInsForm" method="post" action="${pageContext.request.contextPath}/job/jobBoard/insert.do">
				<div class="dc-content-box">
				

				<table class="table">
					<tbody>
					<tr>
						<td>
							제목	
						</td>
						<td>
							<input type="text" class="form-control" placeholder="제목" name="title" id="title" required/>
						</td>
					</tr>
					<tr>
						<td>
							작성자
						</td>
						<td>
							<input type="text" class="form-control" value="${member.nickName}" readonly="readonly" required/>
							<input type="hidden" class="" name="memberNo" id="memberNo" value="${member.no}" readonly required/>
						</td>
					</tr>
					<tr>
						<td>
							구인구직여부
						</td>
						<td>
							<input type="radio" name = "type" value = "JTYPE001" checked><label> 구인 </label>
							<input type="radio" name = "type" value = "JTYPE002"><label> 구직 </label>
						</td>
					</tr>	
					<tr>
						<td>
							구인일
						</td>
						<td>
							<div class="form-inline">
								<input class="form-control" type="date" name="startDate"/>&nbsp; ~ &nbsp;
								<input class="form-control" type="date" name="endDate"/>
							</div> 
						</td>
					</tr>	
					<tr>
						<td>
							근무기간
						</td>
						<td>
							<div class="form-inline">
								<input class="form-control" type="date" name="startJob"/>&nbsp; ~ &nbsp;
								<input class="form-control" type="date" name="endJob"/>
							</div>
						</td>
					</tr>	
					<tr>
						<td>
							근무시간
						</td>
						<td>
							<div class="form-inline">
								<input class="form-control" type="time" name="startTime" id="startTime">&nbsp; ~ &nbsp;
								<input class="form-control" type="time" name="endTime" id="endTime">
							</div>
						</td>
					</tr>	
					<tr>
						<td>
							상호명
						</td>
						<td>
							<div class="form-inline">
								<input type="hidden" class="" id="companyNo" name="companyNo"/>
								<input type="text" class="form-control" placeholder="상호명" id="companyName" onclick="selectCompany();" readonly required/>
								&nbsp;&nbsp;<input type="text" class="form-control" placeholder="근무장소" name="location" id="location"/>
							</div>
						</td>
					</tr>	
					<tr>
						<td>
							고용형태
						</td>
						<td>
							<div class="form-inline">
								<select class="form-control" name="jobType" id="jobType" size="1">
									<option name="JOBTYPE001" value="JOBTYPE001" selected>정규직</option>
									<option value="JOBTYPE002">비정규직</option>
									<option value="JOBTYPE003">파트타임</option>
								</select>
							</div>
						</td>
					</tr>	
					<tr>
									<label class="insLabel">급여형태&nbsp;</label>

						<td>
							급여형태
						</td>
						<td>
							<div class="form-inline">
								<input class="form-control" type="number" min="0"  class="" placeholder="급여" name="salary" id="salary" required/>원
								&nbsp;&nbsp;&nbsp;<select class="form-control" name="salType" id="salType" size="1">
									<option name="salType" value="SALTYPE001" selected>시급</option>
									<option name="salType" value="SALTYPE002">일급</option>
									<option name="salType" value="SALTYPE003">주급</option>
									<option name="salType" value="SALTYPE004">월급</option>
									<option name="salType" value="SALTYPE005">연봉</option>
								</select>
							</div>
						</td>
					</tr>	
					<tr>
						<td colspan="2">
							<textarea id="summernote" name="content"></textarea> <br />
							<button class="btn dc-btn dc-btn-right" type="submit">게시글 등록</button>
						</td>
					</tr>	
					</tbody>
		
				</table>
				</form>
				</div>
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
		var childWindow = window.open("comPop.do", "comPop", "width=500, height=400");
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
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>���α��� �Խ��� �ۼ�������</title>
	<c:import url="../../common/header.jsp"/>
</head>
<body>
	<c:import url="../../common/menubar.jsp"/>	
	<div class="wrap_inner">
	<main id="container">
		<section>
			<div class="section-left">
					<!-- ������� -->
			</div>
			
			<div class="section-center">
			<div class="dc-content">
				<div class="dc-content-title">
				<h1>���α��� �Խ��� �ۼ�������</h1>
				</div>
				<form id="jInsForm" method="post" action="${pageContext.request.contextPath}/job/jobBoard/insertJobBoard.do">
				<div class="dc-content-box"><br />
				���� : <input type="text" class="" placeholder="����" name="jobBoardTitle" id="jobBoardTitle" required/><br /><br />
				�ۼ��� : <input type="text" class="" value="${member.nickName}" readonly required/><br /><br />
				���α������� : 
				<input type="radio" name = "type" value = "hire" checked><label> ���� </label>
				<input type="radio" name = "type" value = "offer"><label> ���� </label><br /><br />
				
				������ : 
				<input type="date" name="startDate"/> ~
				<input type="date" name="endDate"/> <br /><br />
				
				�ٹ��� : 
				<input type="date" name="startJob"/> ~
				<input type="date" name="endJob"/> <br /><br />
				
				�ٹ��ð� : 
				<input type="number" min="0" max="24" class="" id="startTime" required/>�� 
				<input type="number" min="0" max="60" class="" id="startMin" required/>��   ~   
				<input type="number" min="0" max="24" class="" id="endTime" required/>��
				<input type="number" min="0" max="60" class="" id="endMin" required/>��<br /><br />
				
				��ȣ�� :
				<input type="hidden" class="" id="companyNo" name="companyNo" value=""/>
				<input type="text" class="" placeholder="��ȣ��" id="companyName" onclick="selectCompany();" required/>
				<input type="text" class="" placeholder="�ٹ����" id="location" onclick="selectCompany();" required/>
				
				<script type="text/javascript">
					function selectCompany() {
						window.name = "jobBoardInsertForm";	
						var childWindow = window.open("jobBoardComPop.do", "popup01", "width=500, height=400");
					}
				</script>
				<br/><br/>
				������� :
				<select name="jobType" id="jobType" size="1">
					<option value="JOBTYPE001" selected>������</option>
					<option value="JOBTYPE002">��������</option>
					<option value="JOBTYPE003">��ƮŸ��</option>
				</select><br/><br />
				�޿����� : 
				<input type="number" min="0"  class="" placeholder="�޿�" name="salary" id="salary" required/>��
				<select name="salType" id="salType" size="1">
					<option value="SALTYPE001" selected>�ñ�</option>
					<option value="SALTYPE002">�ϱ�</option>
					<option value="SALTYPE003">�ֱ�</option>
					<option value="SALTYPE004">����</option>
					<option value="SALTYPE005">����</option>
				</select><br/><hr />
			���� : <textarea id="summernote" name="content"></textarea> <br />
			<button type="submit">�Խñ� ���</button>
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
				console.log("�̹��� ���ε� ����");						
			}
		});
	}

</script>	
	
	
</body>
</html>
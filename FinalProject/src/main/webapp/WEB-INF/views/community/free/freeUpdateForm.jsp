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

.board_area {
	padding: 20px;
	margin: 20px;
}

.btn_board_save{
	background: rgb(171, 187, 129);
    color: white;
}

.btn_board_back{
	background: rgb(171, 187, 129);
    color: white;
}
</style>

</head>
<body>
	<div id="container">
		<c:import url="../../common/menubar.jsp" />
		<div class="wrap_inner">
			<main id="container">
			<section>
				<div class="section-left">
					<!-- 내용없음 -->
				</div>

				<div class="section-center">
					<div class="dc-content">
						<div class="dc-content-title">
							<h1>자유게시판</h1>
						</div>
						<div class="dc-content-box">
							<div class="board_area">
								<form name="boardFrm" action="${pageContext.request.contextPath}/community/free/freeUpdateFormEnd.do?no=${board.no}" method="post">
									<div>
										<b>글쓰기</b>
										<input type="hidden" class="form-control" id="bno" name="bno" value="${board.no}" readonly="readonly" />
									</div>
									<div>
										<div>제목</div>
											<div>
												<input type="text" class="form-control" name="title" id="title" value="${board.title}" style="width: 100%;" required>
											</div>
										</div>
									<div>
									<br>
									<div>내용</div>
									<div>
										<textarea name="content" id="summernote"
											class="form-control" rows="20" cols="70" required>${board.content}</textarea>
									</div>
									<script>
									
										$('#summernote').summernote({
											minHeight : 100,
		                            		maxHeight : 500,
		                            		maxHeight : 500,
		                            		focus : true,
		                            		callbacks : {
		                            			onImageUpload : function(files) {
		                            				for (var i = files.length - 1; i >= 0; i--) {
		                            					sendFile(files[i]);
		                            		}}},
		                            		toolbar: [
		                            		    // [groupName, [list of button]]
		                            		    ['style', ['bold', 'italic', 'underline', 'clear']],
		                            		    ['font', ['strikethrough', 'superscript', 'subscript']],
		                            		    ['fontsize', ['fontsize']],
		                            		    ['color', ['color']],
		                            		    ['para', ['ul', 'ol', 'paragraph']],
		                            		    ['height', ['height']]
		                            		  ]
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
		                            				console.log("url: "+url);
		                            			},
		                            			error : function() {
		                            				console.log("이미지 업로드 실패");
		                            			}
		                            		});
		                            	}
									
									</script>
								</div>
									<div style="text-align: center; padding:10px;">
										<button class="btn btn_board_save btn-sm" id="btn_board_edit">Save</button>
										<button class="btn btn_board_back btn-sm" id="btn_board_back">Back</button>
									</div>
								</div>
							</div>
							<script>
								$("#btn_board_save").click(function() {
										location.href = "${pageContext.request.contextPath}/community/free/freeUpdateFormEnd.do?no=${board.no}"
									});

								$("#btn_board_back").click(function() {
										location.href= "${pageContext.request.contextPath}/community/free/list.do"
									});
							</script>
							</form>
							</div>
						</div>
					<div class="section-right">
						<c:import url="../../common/rightSection.jsp" />
					</div>
					</div>
				</div>
			</section>
			</main>
		</div>
		<c:import url="../../common/footer.jsp" />
</body>
</html>
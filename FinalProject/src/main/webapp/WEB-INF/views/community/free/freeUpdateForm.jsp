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

.table-div {
	display: table;
}

.tr-div {
	display: table-row;
	text-align: center;
}

.td-div {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
	padding: 5px;
}

.th-div {
	display: table-header-group;
	text-align: center;
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
										<input type="text" id="bno" name="bno" value="${board.no}" readonly="readonly" />
									</div>
									<div class="table-div">
										<br>
										<div class="tr-div">
											<div class="td-div">제목</div>
											<div class="td-div">
												<textarea name="title" rows="1" cols="105"
													style="resize: none;">${board.title}</textarea>
											</div>
										</div>
										<div class="tr-div">
											<div class="td-div">내용</div>
											<div class="td-div">
												<textarea name="content" id="summernote"
													class="form-control" rows="20" cols="70" required>${board.content}</textarea>
												<script>
												
												$('#summernote').summernote({
				                            		height : 300,
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
				                            				console.log("url: "+url);
				                            			},
				                            			error : function() {
				                            				console.log("이미지 업로드 실패");
				                            			}
				                            		});
				                            	}
												
												</script>
											</div>
										</div>
										<div class="tr-div">
											<div class="td-div"></div>
											<div class="td-div">
												<button class="btn_board_save" id="btn_board_edit">Save</button>
												<button class="btn_board_back" id="btn_board_back">Back</button>
											</div>
										</div>
									</div>
									<script>
										$("#btn_board_save").click(function() {
												boardFrm.action = "${pageContext.request.contextPath}/community/free/freeUpdateFormEnd.do?no=${board.no}"
												boardFrm.submit();
											});

										$("#btn_board_back").click(function() {
												boardFrm.action = "${pageContext.request.contextPath}/community/free/list.do"
												boardFrm.submit();
											});
									</script>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="section-right">
					<c:import url="../../common/rightSection.jsp" />
				</div>
			</section>
			</main>
		</div>
		<c:import url="../../common/footer.jsp" />
</body>
</html>
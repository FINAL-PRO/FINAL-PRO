<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.dc.info.house.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% House house = (House)request.getAttribute("house"); %>
<html>
<head>
<meta charset="UTF-8">
<title>부동산 글쓰기</title>
<c:import url="../../common/header.jsp" />
</head>
<body>
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
						<c:if test="${house.no != null }">
							<h2>글 수정</h2>
						</c:if>
						<c:if test="${house.no == null }">
							<h2>글쓰기</h2>
						</c:if>
					</div>
					<div class="dc-content-box">
						<form id="insertFrm" method="post"
							action="<c:if test="${house.boardNo!=null}">${pageContext.request.contextPath}/info/house/updatehouseEnd.do</c:if>
							 <c:if test="${house.boardNo==null}">${pageContext.request.contextPath}/info/house/inserthouse.do</c:if>">


							제목 : <input type="text" id="title" name="title"
								style="width: 700px; height: 30px;"
								value='<c:if test="${house.title != null }">${house.title }</c:if>'
								required> <br> 매매타입 : <select>
								<c:forEach items="${dealList}" var="deal">
									<option value="${deal.id}">${deal.value}</option>
								</c:forEach>
							</select> 매매가 : <input type="text" id="minprice"><br> 방 타입 :
							<select>
								<c:forEach items="${roomList}" var="room">
									<option value="${room.id}">${room.value }</option>
								</c:forEach>
							</select> 방 크기 : <input type="text" id="area"><br>

							<textarea id="summernote" name="content" required>
            <c:if test="${house.content != null }"> ${house.content}</c:if>
            </textarea>

							<c:if test="${house.no != null }">
								<input type="hidden" name="no" value="${house.boardNo}" required />
							</c:if>

							<button type="submit" onclick="inserthouse()">확인</button>
							<button type="reset">취소</button>

						</form>

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
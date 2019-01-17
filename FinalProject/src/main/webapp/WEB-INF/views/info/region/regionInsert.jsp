<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.dc.info.region.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% Region region = (Region)request.getAttribute("region"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 글쓰기</title>
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
						<c:if test="${region.no != null }">
							<h2>글 수정</h2>
						</c:if>
						<c:if test="${region.no == null }">
							<h2>글쓰기</h2>
						</c:if>
					</div>
					<div class="dc-content-box">
						<form id="insertFrm" method="post"
							action="<c:if test="${region.no!=null}">${pageContext.request.contextPath}/info/region/update.do</c:if>
							 <c:if test="${region.no==null}">${pageContext.request.contextPath}/info/region/insert.do</c:if>">
							<table class="table">
								<tr>
									<td>제목</td>
									<td>
										<input class="form-control" type="text" id="title" name="title" value='<c:if test="${region.title != null }">${region.title }</c:if>' required>
									</td>
								</tr>		
								<tr>
									<td colspan="2">
										<textarea id="summernote" name="content" required>
			            					<c:if test="${region.content != null }"> ${region.content}</c:if>
			            				</textarea>	
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<c:if test="${region.no != null }">
											<input type="hidden" name="no" value="${region.no}" required />
											
										</c:if>
										
										<input type="hidden" name="memberNo" value="${member.no}" required />
										<button class="btn dc-btn" type="submit" onclick="insertRegion()">확인</button>
										<button class="btn dc-btn" type="reset" onclick="historyGoBack();">취소</button>									
									</td>
								</tr>				
							</table>
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
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
						<span class="dc-title-text">부동산</span>
					</div>
					<div class="dc-content-box">
						<form id="insertFrm" method="post"
							action="<c:if test="${house.boardNo!=null}">${pageContext.request.contextPath}/info/house/update.do</c:if>
							 <c:if test="${house.boardNo==null}">${pageContext.request.contextPath}/info/house/insert.do</c:if>">
							<table class="table">
								<tr>
									<td>제목</td>
									<td><input class="form-control" type="text" id="title" name="title" value='<c:if test="${house.title != null }">${house.title }</c:if>' required></td>
								</tr>
								<tr>
									<td>매매타입 :</td>
									<td>
										<div class="form-inline">
											<select class="form-control" name="dealType">
												<c:forEach items="${dealList}" var="deal">
													<option value="${deal.id}"
														<c:if test="${house.dealType eq deal.id}">selected</c:if>
													>${deal.value}</option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<td>매매가 : </td>
									<td>
										<input class="form-control" type="number" name="minprice" id="minprice" value="${house.minprice}">
									</td>
								</tr>
								<tr>
									<td>방 타입 :</td>
									<td>
										<div class="form-inline">
											<select name="hType" class="form-control">
												<c:forEach items="${roomList}" var="room">
													<option value="${room.id}"
														<c:if test="${house.hType eq room.id}">selected</c:if>
													>${room.value}</option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<td>방 크기 : </td>
									<td>
										<input class="form-control" type="number" name="area" id="area" value="${house.area}">
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<textarea id="summernote" name="content" required>
										<c:if test="${house.content != null }"> ${house.content}</c:if>
	            						</textarea>	
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="dc-btn-right">
											<input type="hidden" name="mNo" value="${member.no}" />
											<button class="btn dc-btn" type="submit">확인</button>
											<button class="btn dc-btn" type="reset" onclick="historyGoBack();">취소</button>
											<c:if test="${house.boardNo != null }">
												<input type="hidden" name="no" value="${house.boardNo}" required />
												<button class="btn dc-btn" onclick ="deleteHouse()" title="삭제하기">삭제하기</button>
											</c:if>
										</div>	
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
    	
    	function deleteHouse(){
    		location.href="${pageContext.request.contextPath}/info/house/delete.do?no=${house.boardNo}";
    	}
    </script>
</body>
</html>
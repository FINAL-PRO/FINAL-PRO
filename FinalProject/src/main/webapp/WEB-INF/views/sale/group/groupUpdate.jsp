<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>동커</title>
	<c:import url="../../common/header.jsp"/>
	
</head>

<body>
	<div id="container">
	<c:import url="../../common/menubar.jsp"/>
		<section id="content">
			<h1>공동구매 글쓰기</h1>
			
			<div class="content-form">
			<form name="boardForm" action="${pageContext.request.contextPath}/sale/group/groupUpdateFormEnd.do" method="post">
				<input type="hidden" name="memberNo" value="${member.no}"/>
				<input type="hidden" name="boardNo" value="${group.boardNo}"/>
				제목 : <input type="text" name="title" value="${group.title}" /> <br />
				물품종류 : 
				<select class="form-control" name="goodsNo" id="goodsNo" style="padding:0;">                                                 
					   <option value="1"> 종류1</option>
				</select> <br />
				물품명 : <input type="text" name="goodsName" value="${group.goodsName}" /> <br />
				가격 : <input type="text" name="price" value="${group.price}" disabled="disabled"/> <br />
				모집인원 : <input type="text" name="maxCount" value="${group.maxCount}" disabled="disabled"/> <br />
				거래방법 : 직거래<input type="radio" name="dealType" value="DEAL001"/> 
						택배<input type="radio" name="dealType" value="DEAL002"/> <br />
				<select class="form-control" name="bank" id="bank" style="padding:0;">                        
					<c:forEach items="${bankList}" var="bank" >                              
					   <option value="${bank.id}"> ${bank.value}</option>
					</c:forEach>
				</select>                   
				계좌번호 : <input type="text" name="deposit" value="${group.deposit}" /> <br />
				마감일 : <input type="date" name="endDate" value="${group.endDate}" /> <br />
				내용 : <textarea id="summernote" name="content">${group.content}</textarea> <br />
				
				<input type="submit" class="a" value="수정완료" />
				<input type="button" class="a" value="수정취소" onclick="cancelUpdate();"/>
			</form>	
			</div>
			
		</section>
	<c:import url="../../common/footer.jsp"/>
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
	
	function cancelUpdate(){
		location.href = "${pageContext.request.contextPath}/sale/group/groupView.do?boardNo="+${group.boardNo};
	}	

</script>

	
</body>
</html>
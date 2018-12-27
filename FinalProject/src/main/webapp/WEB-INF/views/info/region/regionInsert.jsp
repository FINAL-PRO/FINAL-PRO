<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, com.kh.dc.info.region.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% Region region = (Region)request.getAttribute("region"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title> 지역 글쓰기</title>
	<c:import url="../../common/header.jsp"/>
	
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>
        
        
    	<c:import url="../../common/menubar.jsp"/>
        <div style="width: 800px; margin: auto; padding-top:20px;">
			
			
			<form id="insertFrm" method="post" 
			action="<c:if test="${region.no!=null}">${pageContext.request.contextPath}/info/region/updateRegionEnd.do</c:if>
							 <c:if test="${region.no==null}">${pageContext.request.contextPath}/info/region/insertRegion.do</c:if>">
			
			<c:if test="${region.no != null }"> <h2> 글 수정 </h2></c:if>
            <c:if test="${region.no == null }" ><h2>글쓰기</h2></c:if>
            <input type="text"  id="title" name="title" style="width: 800px; height: 30px;" value='<c:if test="${region.title != null }">${region.title }</c:if>' required> <br><br>
            <textarea id="summernote"  name="content"  required >
            <c:if test="${region.content != null }"> ${region.content}</c:if>
            </textarea>
            
            <c:if test="${region.no != null }"> <input type="hidden" name="no" value="${region.no}" required/> </c:if>
            
            <button type="submit"  onclick="insertRegion()">확인</button>
            <button type="reset">취소</button>			
			
			</form>
            

        </div>


        <c:import url="../../common/footer.jsp"/>



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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			
			<c:if test="${region.no != null }"> <h2> 글 수정 </h2></c:if>
            <c:if test="${region.no == null }" ><h2>글쓰기</h2></c:if>
            <input type="text" style="width: 800px; height: 30px;" value='<c:if test="${region.title != null }">${region.title }</c:if>'><br><br>
            <div id="summernote">
            <c:if test="${region.content != null }"> ${region.content}</c:if>
            </div>

            <button type="submit">확인</button>
            <button type="reset">취소</button>
        </div>


        <c:import url="../../common/footer.jsp"/>



    <script>
    $(document).ready(function() {
     $('#summernote').summernote({
             height: 500,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: 500,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
         });
    });

    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title> 지역 글쓰기</title>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>
        <header></header>
    
        <div style="width: 800px; margin: auto; padding-top:200px;">

            <h2>글쓰기</h2>
            <div id="summernote"></div>

            <button type="submit">확인</button>
            <button type="reset">취소</button>
        </div>


        <footer></footer>



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
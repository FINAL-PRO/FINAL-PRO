<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
<style>

div{
	font-size: 15px;
}

</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div id="container">
		<section id="content">
		<div>
			<div style="font-weight: bold;">신고하기</div>
			<br />
			<div class="rpTitle">제목: ${board.title}</div>
			<div class="rpName">신고자: ${member.name}</div>
			<hr />
			사유선택: <p style="font-size:13px;">여러 사유에 해당하는 경우, <br /> 대표적인 사유 1개를 선택해 주세요.</p>
			<input type="radio" name="category" value="1">부적절한 홍보 게시글<br>
			<input type="radio" name="category" value="2">음란성 또는 청소년에게 부적합한 내용<br>
			<input type="radio" name="category" value="3">명예훼손/사생활 침해 및  저작권침해<br>
			<br>
<!-- 			<input type="button" name="rpButton" value="신고하기"/>
			<input type="button" name="reButton" value="취소"/> -->
			<button type="submit" id="rpButton">신고하기</button>
			<button type="reset" id="reButton">취소</button>
			<br />
			<input type="text" name="bno" class="bno" value="${boardList.no}"/>
			<input type="text" name="mno" class="mno" value="${member.no}"/>
			<script>
	 			//var reCheck = $('input:radio[name=category]:checked').val();
				
	 			$('#rpButton').on('click',function (obj) {
	 				
	 				opener.document.getElementById("bno").value = $(obj).children(".bno").val();
		            opener.document.getElementById("mno").value = $(obj).children(".mno").val();
	 				
		            console.log(opener.document.getElementById("bno").value);
		            
	 			});
	 			
/* 				$('#rpButton').on('click',function (obj) {
					var reCheck = $('input[name="category"]:checked').val();
					var bno = $(opener.document).find('#id').val();;
					
					console.log("bno: "+bno);
					
					if(reCheck == undefined){
					    alert('옵션을 선택해주세요.');
					} else {
					    alert(reCheck + "를 선택하셨습니다.");
					    //action="${pageContext.request.contextPath}/report/reportView.do?bno="+bno;
					} 
						
		        }); */
		        
		        $('#reButton').on('click',function(){
		        	close();
		        }); 
		        
			</script>
		</div>
		</section>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<style>

	/* The Modal (background) */
	.modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    /* z-index: 1; /* Sit on top */
	    left: 0;
	    top: 0;
	    /* width: 1500px; */ /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content/Box */
	.modal-content {
	    background-color: #fefefe;
	    margin: 15% auto; /* 15% from the top and centered */
	    padding: 20px;
	    border: 1px solid #888;
	    width: 30%;  /* Could be more or less, depending on screen size */                          
	}
	
	.rep_box{
		display: inline-block;
		cursor:pointer;
		color: white;
		background-color: rgb(248, 178, 106);
		text-align: center;
		padding-bottom: 5px;
		padding-top: 5px;
		margin-bottom: 5px;
	}
	
	.close_box{
		display: inline-block;
		cursor:pointer;
		color: white;
		background-color: rgb(248, 178, 106);
		text-align: center;
		padding-bottom: 5px;
		padding-top: 5px;
	}
	
	.footerAnchor{
		margin-left: 20px;
		align: center;	
	}
	
	.page-item.active .page-link {
	    z-index: 1;
	    color: #fff;
	    background-color: rgb(248, 178, 106);
	    border-color: rgb(248, 178, 106);
	}
	
	.page-link {
	    position: relative;
	    display: block;
	    padding: .5rem .75rem;
	    margin-left: -1px;
	    line-height: 1.25;
	    color: rgb(248, 178, 106);
	    background-color: #fff;
	    border: 1px solid #dee2e6;
	}
	
	.dc-user-menu a:hover {
	    color: rgb(248, 178, 106);
	    text-decoration: underline;
	}
	
	.dc-user-menu span:hover {
	    color: rgb(248, 178, 106);
	    font-weight: bold;
	}
	
	.dropdown-item:active{
		color: rgb(248, 178, 106);
		background-color: transparent;
	}
	
	.modal-content{
		font-weight:bold;
	}
	

</style>
<footer>
	<div id="myModal" class="modal">
    	<!-- 신고 Modal content -->
    	<form class="reportForm" name="reportForm">
     	<div class="modal-content">
	        <p align="center"><b><span style="font-size: 24pt;">신고하기</span></b></p>
	       <%--  <p>제목: ${boardList.title}</p> --%>
	        <p>신고자: ${member.name}</p>
	        <input type="hidden" id="bno" name="bno" value="${bno}" />
	        <input type="hidden" id="mno" name="mno" value="${member.no}" /> 
	        <br />
			사유선택: <p style="font-size:13px;">여러 사유에 해당하는 경우, <br /> 대표적인 사유 1개를 선택해 주세요.</p>
			<label><input type="radio" name="category" value="1">부적절한 홍보 게시글</label>
			<label><input type="radio" name="category" value="2">음란성 또는 청소년에게 부적합한 내용</label>
			<label><input type="radio" name="category" value="3">명예훼손/사생활 침해 및  저작권침해</label>
			<br />
			<div class="btn rep_box" onClick="reportInsert();">
			   <span class="rep_bt" style="font-size: 13pt;" >신고하기</span>
			</div>
			<div class="btn close_box" onClick="close_box();">
			   <span class="close_bt" style="font-size: 13pt;">닫기</span>
			</div>
 		</div>
 		</form>
	</div>
	<!--End Modal-->
	<script>
	function btn_report(){
		$('#myModal').show();
	}
	
	var reportData = $('[name=reportForm]').serialize();
	console.log("reportData: "+reportData);
	
	function reportInsert(reportData){
	
		var reCheck = $('input:radio[name=category]:checked').val();
		console.log("reCheck: "+reCheck);
		
		$.ajax({
			type: "post",
   			url: "${pageContext.request.contextPath}/report/reportInsert.do",
   			data: { bno: bno,
   					mno: mno,
   					reCheck: reCheck},
   			success: function(result){
   				
			if(reCheck == undefined){
			    alert('옵션을 선택해주세요.');
			} else {
			    alert("신고 되었습니다.");
			    
			    if(result == 1){
			    	$('#myModal').hide();
			    }
			} 
			
		}
		
	});
		
	}

	function close_box(flag) {
            $('#myModal').hide();
       };
    </script> 
      
	<div class="footer_bottom">
	
	<div align="center">
		<a href="#" class="footerAnchor">회사소개</a>
		<a href="#" class="footerAnchor">인재채용</a>
		<a href="#" class="footerAnchor">제휴안내</a>
		<a href="#" class="footerAnchor">광고안내</a>
		<a href="#" class="footerAnchor">이용약관</a>
		<a href="#" class="footerAnchor">개인정보처리방침</a>
		<a href="#" class="footerAnchor">청소년보호정책</a>
		<br/><br/>
		<span class="footer-text">Copyright 2019. 1st All rights reserved.</span>
	</div>
		
	</div>
	
	<script>
		function historyGoBack(){
			history.go(-1);
		}
		
		function goAdminIndex(){
			location.href = "${pageContext.request.contextPath}/admin/index.do?no=${memberNo}";
		}
	</script>
</footer>

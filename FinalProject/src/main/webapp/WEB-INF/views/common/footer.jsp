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
	    /* width: 30%; */ /* Could be more or less, depending on screen size */                          
	}
	
	.rep_box{
		display: inline-block;
		cursor:pointer;
		background-color: #DDDDDD;
		text-align: center;
		padding-bottom: 10px;
		padding-top: 10px;
	}
	
	.close_box{
		display: inline-block;
		cursor:pointer;
		background-color: #DDDDDD;
		text-align: center;
		padding-bottom: 10px;
		padding-top: 10px;
	}
	

</style>
<footer>
	<div id="myModal" class="modal">
    	<!-- 신고 Modal content -->
     	<div class="modal-content">
	        <p align="center"><b><span style="font-size: 24pt;">신고하기</span></b></p>
	       <%--  <p>제목: ${boardList.title}</p> --%>
	        <p>신고자: ${member.name}</p>
	        <br />
			사유선택: <p style="font-size:13px;">여러 사유에 해당하는 경우, <br /> 대표적인 사유 1개를 선택해 주세요.</p>
			<label><input type="radio" name="category" value="1">부적절한 홍보 게시글</label>
			<label><input type="radio" name="category" value="2">음란성 또는 청소년에게 부적합한 내용</label>
			<label><input type="radio" name="category" value="3">명예훼손/사생활 침해 및  저작권침해</label>
			<br />
			<div class="rep_box" onClick="reportInsert();">
			   <span class="rep_bt" style="font-size: 13pt;" >신고하기</span>
			</div>
			<div class="close_box" onClick="close_box();">
			   <span class="close_bt" style="font-size: 13pt;">닫기</span>
			</div>
 		</div>
	</div>
	<!--End Modal-->

	<div class="footer_bottom">
		<p align="center">
			<span class="footer-text">Copyright 2019. 1st All rights reserved.</span>
		</p>
	</div>
</footer>

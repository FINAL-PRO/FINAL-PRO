<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<c:import url="../../common/header.jsp"/>
	<title>업체조회</title>
	
	<style>
    .columName  {
    	display: table-row;
    	background: lightgreen;
    	border : 1px solid black;
      }
    .row {
    	display: table-row;
    	border : 1px solid black;
    }  
    .cell {
      display: table-cell;
      border : 1px solid black;
      }
    </style>
</head>
<body>
	<h2> 업체조회</h2>
	<div id="c-table" class="c-table">
		<div class="columName">
			<div id="no" class="cell">번호</div>
			<div id="name" class="cell">회사명</div>
			<div id="address" class="cell">위치</div>
		</div>

		<c:forEach items="${list}" var="jc">
		<div id="${jc.no}" class="row" onclick="setComInfo(this);">
			<div id="noValue" class="noValue cell">${jc.no}</div>
			<div id="nameValue" class="nameValue cell">${jc.name}</div>
			<div id="addressValue" class="addressValue cell">${jc.address}</div>
		</div>
		
		<script>
			function setComInfo(obj){
				//console.log(opener);
				//console.log($(obj));
				
				//$(opener).find('#companyName').val($(obj).find('.nameValue').val());
				//$(opener).find('#location').val($(obj).attr('id'));
				
				//this.close();
	            //opener.$(this).val() = document.getElementById("companyName").value
	            
	            //전달할 정보
	            //console.log($(obj).children(".noValue").text());
	            //console.log($(obj).children(".nameValue").text());
	            
	            // 전달받을 위치
	            //console.log(opener.document.getElementById("companyNo").value);
	            //console.log(opener.document.getElementById("companyName").value);
	            
	            // 1. 전달할 정보를 전달받을 위치에 넣기
	            opener.document.getElementById("companyNo").value = $(obj).children(".noValue").text();
	            opener.document.getElementById("companyName").value = $(obj).children(".nameValue").text();
	            console.log($('#eqAdd').is(':checked'));
	            // 1-1. 근무 위치가 동일하다면 장소도 전달
	            if($('#eqAdd').is(':checked')){
	            	opener.document.getElementById("location").value = $(obj).children(".addressValue").text();
	            }
	            else {
	            	opener.document.getElementById("location").value = null;
	            }
	            
	            // 2. 창닫기
	            this.close();
	       }
		</script>	
		</c:forEach>
		

		<br /><br />
		<input type="checkbox" name="eqAdd" id="eqAdd" checked/>&nbsp; 회사위치와 동일
		<div id="cResult"></div> 

		<c:out value="${pageBar}" escapeXml="false"/>
		<input type="button" value="창닫기" onclick="window.close()">

	</div>
</body>
</html>
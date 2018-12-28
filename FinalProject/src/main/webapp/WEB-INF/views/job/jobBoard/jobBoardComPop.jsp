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
			<div id="location" class="cell">근무장소</div>
			<div id="address" class="cell">위치</div>
		</div>

		<c:forEach items="${list}" var="jc">
		<div id="${jc.no}" class="row" onclick="setComInfo(this);">
			<div id="noValue" class="noValue cell">${jc.no}</div>
			<div id="nameValue" class="nameValue cell">${jc.name}</div>
			<div id="locationValue" class="locationValue cell">${jc.location}</div>
			<div id="addressValue" class="addressValue cell">${jc.address}</div>
		</div>
		<script>
			function setComInfo(obj){
				//console.log(opener);
				//console.log($(obj));
				
				//$(opener).find('#companyName').val($(obj).find('.nameValue').val());
				//$(opener).find('#location').val($(obj).attr('id'));
				//$(opener).find('#companyNo').val($(obj).find('.locationValue').val());
				
				//this.close();
	            //opener.$(this).val() = document.getElementById("companyName").value
	       }
		</script>	
		</c:forEach>
		<br /><br />

		<div id="cResult"></div> 

		<c:out value="${pageBar}" escapeXml="false"/>
		<input type="button" value="창닫기" onclick="window.close()">

	</div>
</body>
</html>
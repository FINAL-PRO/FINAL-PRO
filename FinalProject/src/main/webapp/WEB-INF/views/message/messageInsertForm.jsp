<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 입력페이지 입니다.</title>
<style>
	.msgBody {
		margin: 5%;
	}
	.msgContent{
		width: 500px;
		height: 150px;
		padding: 12px 20px;
		box-sizing: border-box;
		border: 2px solid #ccc;
		border-radius: 4px;
		background-color: #f8f8f8;
		font-size: 16px;
		resize: none;
	}
	.msgLabel{
		width: 100px;
		font-weight: bold;
	}
	.msgTitle{
		border: 2px solid gray;
		width: 500px;
		display: inline-block;
    	vertical-align: baseline;
		font-weight: bold;
   		background: gray;
   		font-size: 18px;
    	height: 40px;
    	margin: 2px;
    	color: #fff;
	}	
</style>

<c:import url="../common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/msg/msgDetailCss.css" />
</head>
<body>
	<div class="msgBody">
	<div class="msgTitle">&nbsp;&nbsp;쪽지쓰기</div>
	<form id="msgIns" method="post" 
	oninput="checkNick();"
	action="${pageContext.request.contextPath}/message/messageInsert.do">
		<input type="hidden" name="fromMember" value="${member.no}" readonly/>
		<label class="msgLabel">작성자</label>  ${member.nickName}
		<input type="hidden" name="frommNick" value="${member.nickName}" readonly/>
		
		<div id="tomNick-container"> 
			<label class="msgLabel">받는사람</label>
			<c:if test="${empty param.fromMember}">
			<input type="text" name="tomNick" id="nickName_"
			 placeholder="받을사람 닉네임" required/>
			</c:if>
			<c:if test="${!empty param.fromMember}">
			<input type="text" name="tomNick" id="nickName_" value="${param.fromMember}"
			 placeholder="받을사람 닉네임" required/>
			</c:if>
	     	<span style="display:none; color:#4CAF50" class="exist">존재하는 닉네임</span>
	     	<span style="display:none; color:red" class="noOne">없는 닉네임</span>
	     	<input type="hidden" name="nickDuplicateCheck" id="nickDuplicateCheck" value="0"/>
	    </div>
		
		
		<textarea class="msgContent" type="text" name="content"></textarea> <br /><br />
		
		<button class="write" type="submit">작성</button>
		<button onclick="cancel();">취소</button>
	</form>
	</div>
	<script type="text/javascript">
		function checkNick(){
			$(function(){
				$("#nickName_").on("keyup", function(){
			        var nickName = $(this).val().trim();
			        $.ajax({
			            url  : "${pageContext.request.contextPath}/message/checkToNick.do",
			            data : {nickName:nickName},
			            dataType: "json",
			            success : function(data){
			                console.log(data);
			                if(data.isUsable==true){ 
			                    $(".exist").hide();
			                    $(".noOne").show();
			                    $("#nickName_").css("background-color", "#FFCECE");
			                    $("#nickDuplicateCheck").val(1);
			                } else {
			                    $(".exist").show();
			                    $(".noOne").hide();
			                    $("#nickName_").css("background-color", "#4CAF50");
			                    $("#nickDuplicateCheck").val(0);
			                }
			            }, error : function(jqxhr, textStatus, errorThrown){
			                console.log("ajax 처리 실패");
			                //에러로그
			                console.log(jqxhr);
			                console.log(textStatus);
			                console.log(errorThrown);
			            }
		        	});
				});
			});
		}		
		
		function cancel(){
			location.href = "${pageContext.request.contextPath}/message/messageList.do?no=${member.no}";
		}
	</script>
</body>
</html>
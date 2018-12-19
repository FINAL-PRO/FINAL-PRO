<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동커 회원가입</title>
<c:import url="../common/header.jsp"/>
	<style>
		section {background-color: lightgray;}
		div#enroll-container{width:600px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container .col-md-3{text-align: right; padding-right:10px;}
		
		.btn-container>.btn{width:100%}
		.row label{width: 100%; text-align:left; font-size: 8px;}
		
		
	</style>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
		<section id="content">
			<div id="enroll-container">
				<form name="memberEnrollFrm" action="memberEnrollEnd.do" method="post" onsubmit="return fn_enroll_validate();" >								 
					<div class="row email-container" id="email-container">
						<div class="col-md-3">이메일</div>
						<div class="col-md-6"><input type="email" class="form-control" name="email" id="email" required></div>
						<div class="col-md-3 comment" id="duplicateCheck">
							<label class="guide1">이메일을 입력하세요.</label>
				    	</div>
					</div>				
				   
				   <div class="row password-container" id="password-container">
				   		<div class="col-md-3">패스워드</div>
				   		<div class="col-md-6">
				   			<input type="password" class="form-control" name="password" id="password_" oninput="checkedPassword()" required>
				   		</div>	
				   		<div class="col-md-3 comment" id="pwdChkComment">
				        	<label class="pwdChkComment" id="password">비밀번호을 입력하세요.</label>
				    	</div>
				   </div>
				   
				   
				   
				   <div class="row password-container" id="password2-container">
				   		<div class="col-md-3">패스워드 확인</div>
				   		<div class="col-md-6">
				   			<input type="password" class="form-control" id="password2" required>
				   		</div>
				   		<div class="col-md-3 comment" id="pwd2ChkComment">
				        	<label class="pwdChkComment" id="password2">비밀번호을 입력하세요.</label>
				    	</div>
				   </div>

				   <div class="row nickName-container" id="nickName-container">
				   		<!-- 닉네임 2~10 글자 허용 -->
				   		<div class="col-md-3">닉네임</div>
				   		<div class="col-md-6">
				   			<input type="text" class="form-control" name="nickName" id="nickName">
				   		</div>			   		
				   		<div class="col-md-3 duplicateCheck" id="duplicateCheck2">
				   		<!-- 닉네임 중복 검사 -->
				   			<label class="guide">닉네임을 입력하세요.</label>			            
				   		</div>
				   </div>
				   
				        
				   <div class="row userName-container" id="userName-container">
				   		<div class="col-md-3">이름</div>
				   		<div class="col-md-6">
				   		<input type="text" class="form-control" name="userName" id="userName" required>	
				   		</div>	
				   		<div class="col-md-3 duplicateCheck" id="">
				   			<label class="guide"></label>			            
				   		</div>		   		
				   </div>
				   <div class="row address-container" id ="address-container">
				   		<div class="col-md-3">주소</div>
				   		<div class="col-md-6">
				   		<input type="text" class="form-control" placeholder="" name="" id="" readonly value="서울특별시">
				   		</div>
				   		<div class="col-md-3 " id=""></div>
				   		
				   </div>
				   <div class="row address-container" id ="address-container2">
				   		<div class="col-md-3"></div>
				   		<div class="col-md-6">
					   		<select class="form-control" name="address" id="address">
						   		<option id="address1" value="gangnam">강남구</option>
						   		<option id="address2">관악구</option>
						   		<option id="address3">마포구</option>
						   		<option id="address4">서초구</option>
						   		<option id="address5">영등포구</option>
					   		</select>
				   		</div>
				   		<div class="col-md-3" id=""></div>
				   		
				   </div>
				   <div class="row btn-container">
				   <div class="col-md-3"></div>
				   <div class="col-md-3 btn-container"><input type="submit" class="btn btn-outline-success" value="가입" ></div>
				   <div class="col-md-3 btn-container"><input type="reset"  class="btn btn-outline-danger" value="취소"></div>
				   <div class="col-md-3" id=""></div>
				   </div>	
				</form>
			</div>
			<script>
			$(function(){
				
				$("#password2").blur(function(){
					var p1=$("#password_").val(), p2=$("#password2").val();
					if(p1!=p2){
						alert("패스워드가 일치하지 않습니다.");
						$("#password_").focus();
					}
				});
				
				/* 닉네임 중복검사 이벤트 추가 */
				$("#nickName").on("keyup", function(){
			        var nickName = $(this).val().trim();
			        
			        if(nickName == null){
			        	$(".guide.null").show();
			        	
			        } else if(nickName != null && nickName.length<2) {
			        	$(".guide").text("2자 이상 입력해주세요.");
			        	return;
			        	
			        } else if (nickName.length>10){
			        	$(".guide").text("10자 미만으로 입력해주세요.");
			        	return;			        	
			        } else {     	
				        $.ajax({
				            url  : "${pageContext.request.contextPath}/member/checkNickNameDuplicate.do",
				            data : {nickName:nickName},
				            dataType: "json",
				            success : function(data){
				                console.log(data);
				                if(data==1){
							        $(".guide").text("이미 사용중인 닉네임입니다.");			                    
				                } else {
							        $(".guide").text("사용할 수 있는 닉네임입니다.");
				                }
				            }, error : function(jqxhr, textStatus, errorThrown){
				                console.log("ajax 처리 실패");
				                //에러로그
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
			        	});
			     	}
				});
			
			
			
			/* 이메일 중복검사 이벤트 추가 */
			$("#email").on("keyup", function(){
				
				 var email = $(this).val().trim();
				 var regEmail = /^[a-zA-Z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
				 
				 if(email == null){
					 $(".guide1").text('이메일을 입력하세요.');
			     } else{
			    	 $.ajax({
				            url  : "${pageContext.request.contextPath}/member/checkEmailDuplicate.do",
				            data : {email:email},
				            dataType: "json",
				            success : function(data){
				                console.log(data);
				                // if(data=="true") //stream 방식
				                if(data==1){ //viewName 방식
				                	$(".guide1").text('이미 가입된 이메일입니다.');
				                } else if(!(regEmail.test(email))) {
				                	$(".guide1").text('이메일 형식에 맞지 않습니다.');
				                } else if(data==0 && regEmail.test(email)){
				                	$(".guide1").text('');				                	
				                }
				            }, error : function(jqxhr, textStatus, errorThrown){
				                console.log("ajax 처리 실패");
				                //에러로그
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
			        	});			    	 
			     }
			});			
		});
			
			function checkedPassword() {
				var pwd = $("#password").val();
				var pwd2 = $("#password2").val();
				var regPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,12}$/;
				
				if(regPwd.test(pwd)){
					
					$(".guide1").text('영대문자/특수문자/숫자 최소 1개 이상 포함해주세요.');
					
				}
				
				
				if (pwd != "" && pwdChk != "" && pwd == pwdChk) {
					// 비밀번호 정규식으로 검사
	
					if(regPwd.test(pwd)) {
						$(".guide1").text('영대문자특수문자 숫자 최소 1개 이상 포함해주세요.');	
					} else {
					

					}
					
				} else if (pwd2 == "" || pwd == "") {


				} else {

				}

			}	
			
		
		</script>
		</section>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>
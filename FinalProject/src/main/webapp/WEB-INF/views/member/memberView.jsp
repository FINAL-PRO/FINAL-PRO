<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 페이지</title>
<c:import url="../common/header.jsp"/>
	<style>
		section {background-color: white;}
		div#enroll-container{width:600px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container .col-md-3{text-align: right; padding-right:10px;}
		
		.btn-container>.btn{width:100%}
		.row label{width: 100%; text-align:left; font-size: 8px;}
		
		#modalBtn>button {width: 40%; text-align:center; margin-bottom: 10px;}
		
		#modalPassword {width: 80%;}
				
	</style>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
		<section id="content">
			<div id="enroll-container">
				<form name="memberEnrollFrm" action="memberUpdate.do" method="post" onsubmit="return fn_enroll_validate();" >								 
					<div class="row email-container" id="email-container">
						<div class="col-md-3">이메일</div>
						<div class="col-md-6"><input type="email" class="form-control" name="email" id="email" value="${member.email}" readonly></div>
						<div class="col-md-3 comment" id="duplicateCheck">
							<label class="guide1"></label>
				    	</div>
					</div>				
				   
				   <div class="row password-container" id="password-container">
				   		<div class="col-md-3">패스워드</div>
				   		<div class="col-md-6">
				   			<input type="password" class="form-control" name="password" id="password_" required>
				   		</div>	
				   		<div class="col-md-3 comment" id="">
				        	<label class="pwdChkComment" id="pwdChkComment"></label>
				    	</div>
				   </div>
   
				   <div class="row password-container" id="password2-container">
				   		<div class="col-md-3">패스워드 확인</div>
				   		<div class="col-md-6">
				   			<input type="password" class="form-control" id="password2" required>
				   		</div>
				   		<div class="col-md-3 comment" id="pwd2ChkComment">
				        	<label class="pwdChkComment" id="pwdChkComment2"></label>
				    	</div>
				   </div>

				   <div class="row nickName-container" id="nickName-container">
				   		<!-- 닉네임 2~10 글자 허용 -->
				   		<div class="col-md-3">닉네임</div>
				   		<div class="col-md-6">
				   			<input type="text" class="form-control" name="nickName" id="nickName" value="${member.nickName}" required>
				   		</div>			   		
				   		<div class="col-md-3 duplicateCheck" id="duplicateCheck2">
				   		<!-- 닉네임 중복 검사 -->
				   			<label class="guide"></label>			            
				   		</div>
				   </div>
				   
				        
				   <div class="row userName-container" id="userName-container">
				   		<div class="col-md-3">이름</div>
				   		<div class="col-md-6">
				   		<input type="text" class="form-control" name="name" id="userName" value="${member.name}" required>	
				   		</div>	
				   		<div class="col-md-3" id="">
				   			<label class=""></label>			            
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
				   			<c:set var="selectedLocationNo" value="${member.locationNo}"></c:set>
					   		<select class="form-control" name="locationNo" id="address">					   		
					   		<c:forEach items="${locationList}" var="location" >						   			
					   			<option value="${location.no}" ${ (location.no == selectedLocationNo) ? "selected"  :  "" }> ${location.location}</option>
					   		</c:forEach>
					   		</select>
				   		</div>
				   	<div class="col-md-3" id=""></div>				   		
				   </div>
				   
				   <div class="row btn-container">
				   <div class="col-md-3"></div>
				   <div class="col-md-3 btn-container"><input type="submit" class="btn btn-outline-success" value="수정" ></div>
				   <div class="col-md-3 btn-container">
				   	<input type="button"  class="btn btn-outline-danger" 
				   			data-toggle="modal" data-target="#modalDeleteMember" value="삭제"></div>
				   <div class="col-md-3" id=""></div>
				   </div>	
				</form>
				
				<!-- Modal시작 -->
				<!-- https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
				<div class="modal fade" id="modalDeleteMember" tabindex="-1" role="dialog" aria-labelledby="memberDeleteModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="memberDeleteModalLabel">회원 탈퇴 확인</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
			          <!--로그인폼 -->
			          <!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
			          <form action="" method="post" style="height: auto;">
				      <div class="modal-body" style="padding-bottom:0;">
						  <label> 정말로 탈퇴하실건가요? T_T </label>
						  <div class="row passwordDiv" style=" display:inline;">
						  <input type="password" class="form-control" name="password" id="modalPassword" 
						  		placeholder="비밀번호를 입력하세요." style="display: block; margin: 0 auto;" required>
						  </div>
				      </div>
				      <div class="modal-footer" id="modalBtn" style=" display:inline; margin-bottom: 10px;">
				        <button type="button" class="btn btn-outline-success" id="deleteBtn">회원 탈퇴</button>
				        <button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>
				      </div>
					</form>
				    </div>
				  </div>
				</div>
				<!-- Modal 끝-->			
				
			</div>
			<script>
			$(function(){
				
				/* 이메일 중복검사 이벤트 추가 */
				$("#email").on("keyup", function(){
					
					 var email = $(this).val().trim();
					 var regEmail = /^[a-zA-Z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
					 
					 if(email == ""){
						 $(".guide1").text('이메일을 입력하세요.');
				     } else if(email != null){
				    	 $.ajax({
					            url  : "${pageContext.request.contextPath}/member/checkEmailDuplicate.do",
					            data : {email:email},
					            dataType: "json",
					            success : function(data){
					                console.log(data);
					                if(data==1){ 
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
				
				/* 닉네임 중복검사 이벤트 추가 */
				$("#nickName").on("keyup", function(){
			        var nickName = $(this).val().trim();
			        
			        if(nickName == "${member.nickName}"){
			        	$(".guide").text("");
			        	
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

			
			$("#password_").on("keyup", function checkedPassword() {
				var pwd = $("#password_").val().trim();
				var pwd2 = $("#password2").val().trim();
				
				var regPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,12}$/;
				
				if(pwd==""){
					$("#pwdChkComment").text('비밀번호을 입력하세요.');
				}else if(!regPwd.test(pwd)){
					
					$("#pwdChkComment").text('영대문자/특수문자/숫자 최소 1개 포함 6자 이상!');
					
				} else {
					$("#pwdChkComment").text('OK!');		
				} 
			});
			
			
			$("#password2").on("keyup", function(){
				var pwd=$("#password_").val(), pwd2=$("#password2").val();
				if(pwd != pwd2){
					$("#pwdChkComment2").text('위의 비밀번호와 다릅니다.');				
				} else if(pwd!=null && pwd2!= null && pwd == pwd2){
					$("#pwdChkComment2").text('OK!');
				}
			
			});	
			
			$("#deleteBtn").on("click", function(){
				var no = "${member.no}";
				var email = "${member.email}";
				var password = $("#modalPassword").val();
				
				console.log(password);
				console.log(no);
				
				$.ajax({
					type: "GET",
					url : "${pageContext.request.contextPath}/member/checkPassword.do",
					data: { email: email, password : password},
					dataType: "json",
					success : function(data){
						if(data > 0){
							$.ajax({
								type: "POST",
								url : "${pageContext.request.contextPath}/member/memberDelete.do",
								data: {no : no},
								dataType: "json",
								success : function(data){
										alert(data.msg);
										location.href= "${pageContext.request.contextPath}/";
								}, error : function(jqxhr, textStatus, errorThrown){
					                console.log("ajax 처리 실패");
					                //에러로그
					                console.log(jqxhr);
					                console.log(textStatus);
					                console.log(errorThrown);
					            }		
							});		
						} else{
							alert("비밀번호가 틀립니다. 다시 한번 확인해주세요.")
						}
					}, error : function(jqxhr, textStatus, errorThrown){
		                console.log("checkPassword ajax 처리 실패");
		            }							
				});			
			});			
			
		});

		</script>
		</section>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>
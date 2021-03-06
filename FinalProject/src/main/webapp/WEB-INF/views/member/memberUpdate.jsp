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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/dc-member.css" />
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="wrap_inner">
		<main id="container">
			<section>
				<div class="section-left">
					<!-- 내용없음 -->
				</div>
				
				<div class="section-center">
					<div class="dc-content">
						<div class="dc-content-title">
							<c:import url="../mypage/myPageMenubar.jsp"/>
						</div>
						<div class="dc-content-box">
							<div id="enroll-container">
				<form action="memberUpdate.do" id="memberUpdate" method="post" enctype="multipart/form-data">								 
					<div class="row profile-container" id="profile-container">
						<div class="col-md-3 memberTitleLabel">프로필</div>
					  	<div class="col-md-6" align="center">
						  	<c:if test="${!empty member.profile}">
						  		<img id="profileImg" src="${pageContext.request.contextPath}/resources/upload/profile/${member.profile}"/>	
						  		<br>				    				
						  	</c:if>
						  	<c:if test="${empty member.profile}">
						  		<img id="profileImg" src="${pageContext.request.contextPath}/resources/upload/profile/profileDefaultImg.png"/>
						  		<br/>						  		
						  	</c:if>
						  	<input type="button" class="btnClass btn btn-sm" id="deleteProfileImg" value="프로필 사진 삭제">				  	
					  		<input type="file" name="file" id="file" onchange="inputProfile(this);" multiple/>
						</div>
					  	<div class="col-md-3">
					  		<br><br>
					  		<label class="profileLabel">이미지를 누르면 <br>프로필 사진을 <br> 변경할 수 있습니다.</label>
					  	</div>
					</div>	
					<div class="row email-container" id="email-container">
						<div class="col-md-3 memberTitleLabel">이메일</div>
						<div class="col-md-6"><input type="email" class="form-control" name="email" id="email" value="${member.email}" readonly></div>
						<div class="col-md-3 comment" id="duplicateCheck">
							<label class="guide1"></label>
				    	</div>
					</div>				
				   
				   <div class="row password-container" id="password-container">
				   		<div class="col-md-3 memberTitleLabel">패스워드</div>
				   		<div class="col-md-6">
				   			<input type="password" class="form-control" name="password" id="password_" required>
				   		</div>	
				   		<div class="col-md-3 comment" id="">
				        	<label class="pwdChkComment" id="pwdChkComment"></label>
				    	</div>
				   </div>
   
				   <div class="row password-container" id="password2-container">
				   		<div class="col-md-3 memberTitleLabel">패스워드 확인</div>
				   		<div class="col-md-6">
				   			<input type="password" class="form-control" id="password2" required>
				   		</div>
				   		<div class="col-md-3 comment" id="pwd2ChkComment">
				        	<label class="pwdChkComment" id="pwdChkComment2"></label>
				    	</div>
				   </div>

				   <div class="row nickName-container" id="nickName-container">
				   		<!-- 닉네임 2~10 글자 허용 -->
				   		<div class="col-md-3 memberTitleLabel">닉네임</div>
				   		<div class="col-md-6">
				   			<input type="text" class="form-control" name="nickName" id="nickName" value="${member.nickName}" required>
				   		</div>			   		
				   		<div class="col-md-3 duplicateCheck" id="duplicateCheck2">
				   		<!-- 닉네임 중복 검사 -->
				   			<label class="guide"></label>			            
				   		</div>
				   </div>
				   
				        
				   <div class="row userName-container" id="userName-container">
				   		<div class="col-md-3 memberTitleLabel">이름</div>
				   		<div class="col-md-6">
				   		<input type="text" class="form-control" name="name" id="userName" value="${member.name}" required>	
				   		</div>	
				   		<div class="col-md-3" id="">
				   			<label class=""></label>			            
				   		</div>		   		
				   </div>
				   <div class="row address-container" id ="address-container">
				   		<div class="col-md-3 memberTitleLabel">주소</div>
				   		<div class="col-md-6">
				   		<input type="text" class="form-control" placeholder="" name="" id="" readonly value="서울특별시">
				   		</div>
				   		<div class="col-md-3 " id=""></div>
				   		
				   </div>
				   <div class="row address-container" id ="address-container2">
				   		<div class="col-md-3"></div>
				   		<div class="col-md-6">
				   			<c:set var="selectedLocationNo" value="${member.locationNo}"></c:set>
					   		<select class="form-control" name="locationNo" id="locationNo">					   		
					   		<c:forEach items="${locationList}" var="location" >						   			
					   			<option value="${location.no}" ${ (location.no == selectedLocationNo) ? "selected"  :  "" }> ${location.location}</option>
					   		</c:forEach>
					   		</select>
				   		</div>
				   	<div class="col-md-3" id=""></div>				   		
				   </div>
				   
				    <div class="row address-container" id="address-container">
				   		<div class="col-md-3 memberTitleLabel">상세 주소</div>
				   		<div class="col-md-6">
				   		<input type="text" class="form-control" name="address" id="address" value="${member.address}">	
				   		</div>	
				   		<div class="col-md-3" id="">
				   			<label class=""></label>			            
				   		</div>		   		
				   </div>
				   
				    <div class="row deposit-container" id="deposit-container">
				   		<div class="col-md-3 memberTitleLabel">계좌번호</div>
				   		<div class="col-md-2" style="padding-right:0;">
				   			<c:set var="selectedBank" value="${member.bank}"></c:set>
					   		<select class="form-control" name="bank" id="bank" style="padding:0;">					   		
					   		<c:forEach items="${bankList}" var="bank" >						   			
					   			<option value="${bank.id}" ${ (bank.value == selectedBank) ? "selected"  :  "" }> ${bank.value}</option>
					   		</c:forEach>
					   		</select>				   			
				   		</div>	
				   		<div class="col-md-4" style="padding-left:0;">
				   		<input type="text" class="form-control" name="deposit" id="deposit" value="${member.deposit}" placeholder="-없이 숫자만 입력">	
				   		</div>	
				   		<div class="col-md-3" id="">
				   			<label class="guide" id="depositLabel"></label>			            
				   		</div>		   		
				   </div>
				   
				   
				   <div class="row btn-container">
				   <div class="col-md-3"></div>
				   <div class="col-md-6 btn-container">
				   		<input type="button" class="btnClass btn" id="submitButton" value="수정">
				   		<input type="button"  class="btnClass btn" 
				   			data-toggle="modal" data-target="#modalDeleteMember" value="회원 탈퇴"></div>
				   <div class="col-md-3" id=""></div>
				   </div>	
				</form>
				
				<!-- Modal시작 -->
				<!-- https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
				<div class="modal fade" id="modalDeleteMember" tabindex="-1" role="dialog" aria-labelledby="memberDeleteModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content" style="width: 100%;">
				      <div class="modal-header">
				        <h5 class="modal-title" id="memberDeleteModalLabel">회원 탈퇴 확인</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
			          <!--로그인폼 -->
			          <!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
			          <form action="memberDelete.do" id="deleteMemberForm" method="post" style="height: auto;">
				      <div class="modal-body" style="padding-bottom:0;">
						  <label> 정말로 탈퇴하실건가요? T_T </label>
						  <div class="row passwordDiv" style=" display:inline;">
						  <input type="hidden" name="no" value="${member.no}">
						  <input type="password" class="form-control" name="password" id="modalPassword" 
						  		placeholder="비밀번호를 입력하세요." style="display: block; margin: 0 auto;" required>
						  </div>
				      </div>
				      <div class="modal-footer" id="modalBtn" style=" display:inline; margin-bottom: 10px;">
				        <button type="button" class="btnClass btn" id="deleteBtn">회원 탈퇴</button>
				        <button type="button" class="btnClass btn" data-dismiss="modal">취소</button>
				      </div>
					</form>
				    </div>
				  </div>
				</div>
				<!-- Modal 끝-->			
				
			</div>
						</div>
					</div>
				</div>
				
				<div class="section-right">
					<c:import url="../common/rightSection.jsp"/>
				</div>
			</section>
		</main>
	</div>
	<c:import url="../common/footer.jsp"/>
	
	<script>
			$(function(){
				
				var pwdChk = false;
				var nickNameChk = true;
								
				
				/* 닉네임 중복검사 이벤트 추가 */
				$("#nickName").on("keyup", function(){
			        var nickName = $(this).val().trim();
			        
			        if(nickName == "${member.nickName}"){
			        	$(".guide").text("");
			        	
			        } else if(nickName != null && nickName.length<2) {
			        	$(".guide").text("2자 이상 입력해주세요.");
			        	nickNameChk = false;
			        } else if (nickName.length>10){
			        	$(".guide").text("10자 미만으로 입력해주세요.");
			        	nickNameChk = false;		        	
			        } else {     	
				        $.ajax({
				            url  : "${pageContext.request.contextPath}/member/checkNickNameDuplicate.do",
				            data : {nickName:nickName},
				            dataType: "json",
				            success : function(data){
				                console.log(data);
				                if(data==1){
							        $(".guide").text("이미 사용중인 닉네임입니다.");
							        nickNameChk = false;
				                } else {
							        $(".guide").text("");s
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

			
			$("#password_").on("keyup", function() {

				var regPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,12}$/;
				var pwd1 = $("#password_").val();
				var pwd2 = $("#password2").val();

				if (pwd1 == "") {
					$("#pwdChkComment").text('비밀번호을 입력하세요.');
				} else if (!regPwd.test(pwd1)) {
					$("#pwdChkComment").text('영대문자/특수문자/숫자 최소 1개 포함 6자 이상 12자 이하!');
					$("#submitButton").attr('disabled', true);
				} else if (pwd1 != pwd2) {
					$("#pwdChkComment").text('아래의 비밀번호와 다릅니다.');
					$("#submitButton").attr('disabled', true);
				} else {
					$("#pwdChkComment").text('');
					$("#pwdChkComment2").text('');
					$("#submitButton").attr('disabled', false);					
				}
			});

			$("#password2").on("keyup", function() {
				var pwd1 = $("#password_").val();
				var pwd2 = $("#password2").val();
				
				if (pwd1 != pwd2) {
					$("#pwdChkComment2").text('위의 비밀번호와 다릅니다.');
					$("#submitButton").attr('disabled', true);
				} else if (pwd1 != null && pwd2 != null && pwd1 == pwd2) {
					$("#pwdChkComment").text('');
					$("#pwdChkComment2").text('');
					$("#submitButton").attr('disabled', false);
					pwdChk = true;
				}

			});
			
			$("#deleteBtn").on("click", function(){
				var no = "${member.no}";
				var email = "${member.email}";
				var password = $("#modalPassword").val();
				
				console.log(password);
				console.log(no);
				console.log(email);
				
				$.ajax({
					type: "GET",
					url : "${pageContext.request.contextPath}/member/checkPassword.do",
					data: { email: email, password : password},
					dataType: "json",
					success : function(data){
						$('#deleteMemberForm').submit();
						/* if(data > 0){
							$.ajax({
								type: "POST",
								url : "${pageContext.request.contextPath}/member/memberDelete.do",
								data: {no : no},
								dataType: "json",
								success : function(data){
										$('#deleteMemberForm').submit();
										location.href= "${pageContext.request.contextPath}/logout";
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
						} */
					}, error : function(jqxhr, textStatus, errorThrown){
		                console.log("checkPassword ajax 처리 실패");
		                alert("checkPassword ajax 처리 실패");
		            }							
				});			
			});	
			
			/* 계좌번호에 숫자가 아닌 문자가 들어갔을 때 라벨 띄움*/
			$("#deposit").on("keyup", function(){				
				this.value = this.value.replace(/[^0-9\.]/g,'');				
			});
			
			$("#submitButton").on("click", function() {
				
				if(nickNameChk == true && pwdChk == true){
					$("#memberUpdate").submit();
				} else if(nickNameChk == false){
					alert("닉네임을 다시 입력해주세요.");
					return;
				} else if(pwdChk == false){
					alert("비밀번호를 다시 입력해주세요.");
					return;
				}
			
			});							
		});			
			
		// 프로필 이미지 클릭시 파일 태그 클릭 효과
		$('#profileImg').click(() => { $('#file').click(); });
			
		// 프로필 사진 미리보기 스크립트
		function inputProfile(value) {
			if(value.files && value.files[0]) {
				var reader = new FileReader();				
					
				reader.onload = function (e) {
					$("#profileImg").attr("src", e.target.result);
					$(".profileLabel").hide();
					console.log($("#file").val());
				}	
				
				reader.readAsDataURL(value.files[0]);				
			}
		}
		
		$('#deleteProfileImg').on('click', function(e){
			   var $el = $('#file');
			   $("#profileImg").attr("src", "${pageContext.request.contextPath}/resources/upload/profile/profileDefaultImg.png");	
			   
			   $el.wrap('<form>').closest('form').get(0).reset();
			   $el.unwrap();
			});

		</script>
</body>
</html>
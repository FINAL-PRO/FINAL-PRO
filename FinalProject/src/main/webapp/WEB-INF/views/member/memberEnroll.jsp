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
<c:import url="../common/header.jsp" />
<style>
		section {background-color: white;}
		div#enroll-container{width:600px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container .col-md-3{text-align: right; padding-right:10px;}
		
		.dc-content-box{padding: 40px;}
		.btn-container>.btn{width:100%}
		.row label{width: 100%; text-align:left; font-size: 8px;}
		
		#modalBtn>button {width: 40%; text-align:center; margin-bottom: 10px;}		
		#modalPassword {width: 80%;}
		
		#file {display:none;}
		#profileImg {
			border-radius: 100px;
		    border: 1px solid lightgray; 
		    width: 150px; 
		    height: 150px;
		    margin-bottom: 15px;
		}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp" />
	<div class="wrap_inner">
		<main id="container">
		<section>
			<div class="section-left">
				<!-- 내용없음 -->
			</div>

			<div class="section-center">
				<div class="dc-content">
					<div class="dc-content-title">
						<h1>제목</h1>
					</div>
					<div class="dc-content-box">
						<div id="enroll-container">
						<form name="memberEnrollFrm" id="memberEnroll" action="memberEnrollEnd.do" method="post" enctype="multipart/form-data">
							<div class="row profile-container" id="profile-container">
								<div class="col-md-3">프로필</div>
				  				<div class="col-md-6" align="center">
				  					<img id="profileImg" src="${pageContext.request.contextPath}/resources/upload/profile/profileDefaultImg.png"/>
				    				<input type="file" name="file" id="file" onchange="inputProfile(this);" multiple/>
				  				</div>
				  				
				  				<div class="col-md-3">
				  					<label class="profileLabel">기본 이미지를 누르면</label>
				  					<label class="profileLabel">프로필사진을 변경할 수 있습니다.</label>
				  				</div>
							</div>
							
							
							<div class="row email-container" id="email-container">
								<div class="col-md-3">이메일</div>
								<div class="col-md-6">
									<input type="email" class="form-control" name="email"
										id="email" required>
								</div>
								<div class="col-md-3 comment" id="duplicateCheck">
									<label class="guide1">이메일을 입력하세요.</label>
								</div>
							</div>

							<div class="row password-container" id="password-container">
								<div class="col-md-3">패스워드</div>
								<div class="col-md-6">
									<input type="password" class="form-control" name="password"
										id="password_" required>
								</div>
								<div class="col-md-3 comment" id="">
									<label class="pwdChkComment" id="pwdChkComment">비밀번호을 입력하세요.</label>
								</div>
							</div>

							<div class="row password-container" id="password2-container">
								<div class="col-md-3">패스워드 확인</div>
								<div class="col-md-6">
									<input type="password" class="form-control" id="password2"
										required>
								</div>
								<div class="col-md-3 comment" id="pwd2ChkComment">
									<label class="pwdChkComment" id="pwdChkComment2">비밀번호을
										입력하세요.</label>
								</div>
							</div>

							<div class="row nickName-container" id="nickName-container">
								<!-- 닉네임 2~10 글자 허용 -->
								<div class="col-md-3">닉네임</div>
								<div class="col-md-6">
									<input type="text" class="form-control" name="nickName"
										id="nickName">
								</div>
								<div class="col-md-3 duplicateCheck" id="duplicateCheck2">
									<!-- 닉네임 중복 검사 -->
									<label class="guide">닉네임을 입력하세요.</label>
								</div>
							</div>


							<div class="row userName-container" id="userName-container">
								<div class="col-md-3">이름</div>
								<div class="col-md-6">
									<input type="text" class="form-control" name="name"
										id="userName" required>
								</div>
								<div class="col-md-3" id="">
									<label class=""></label>
								</div>
							</div>
							<div class="row address-container" id="address-container">
								<div class="col-md-3">주소</div>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="" name=""
										id="" readonly value="서울특별시">
								</div>
								<div class="col-md-3 " id=""></div>

							</div>
							<div class="row address-container" id="address-container2">
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<select class="form-control" name="locationNo" id="address">
										<c:forEach items="${locationList}" var="location">
											<option value="${location.no}">${location.location}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-3" id=""></div>
							</div>

							<div class="row btn-container">
								<div class="col-md-3"></div>
								<div class="col-md-3 btn-container">
									<input type="button" class="btn btn-outline-success" id="submitButton" value="가입">
								</div>
								<div class="col-md-3 btn-container">
									<input type="reset" class="btn btn-outline-danger" value="취소">
								</div>
								<div class="col-md-3" id=""></div>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>

			<div class="section-right">
				<c:import url="../common/rightSection.jsp" />
			</div>
		</section>
		</main>
	</div>
	<c:import url="../common/footer.jsp" />

	<script>
		$(function() {

			/* 이메일 중복검사 이벤트 추가 */
			$("#email").on("keyup",function() {

				var email = $(this).val().trim();
				var regEmail = /^[a-zA-Z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;

				if (email == "") {
					$(".guide1").text('이메일을 입력하세요.');
				} else if (email != null) {
					$.ajax({
						url : "${pageContext.request.contextPath}/member/checkEmailDuplicate.do",
						data : {email : email},
						dataType : "json",
						success : function(data) {
							console.log(data);
							if (data == 1) {
								$(".guide1").text('이미 가입된 이메일입니다.');
								$("#submitButton").attr('disabled', true);
							} else if (!(regEmail.test(email))) {
								$(".guide1").text('이메일 형식에 맞지 않습니다.');
								$("#submitButton").attr('disabled', true);
							} else if (data == 0 && regEmail.test(email)) {
								$(".guide1").text('');
								$("#submitButton").attr('disabled', false);
							}
						}, error : function(jqxhr,textStatus, errorThrown) {
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
			$("#nickName").on("keyup", function() {
				var nickName = $(this).val().trim();

				if (nickName == "") {
					$(".guide").text("닉네임을 입력해주세요.");

				} else if (nickName != null
						&& nickName.length < 2) {
					$(".guide").text("2자 이상 입력해주세요.");
					$("#submitButton").attr('disabled', true);
					return;

				} else if (nickName.length > 10) {
					$(".guide").text("10자 미만으로 입력해주세요.");
					$("#submitButton").attr('disabled', true);
					return;
				} else {
					$.ajax({
						url : "${pageContext.request.contextPath}/member/checkNickNameDuplicate.do",
						data : {nickName : nickName},
						dataType : "json",
						success : function(data) {
							console.log(data);
							if (data == 1) {
								$(".guide").text("이미 사용중인 닉네임입니다.");
								$("#submitButton").attr('disabled', true);
							} else {
								$(".guide").text("사용할 수 있는 닉네임입니다.");
								$("#submitButton").attr('disabled', false);
							}
							},error : function(jqxhr,textStatus, errorThrown) {
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

				var regPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,12}$/;

				if (pwd == "") {
					$("#pwdChkComment").text('비밀번호을 입력하세요.');
				} else if (!regPwd.test(pwd)) {
					$("#pwdChkComment").text('영대문자/특수문자/숫자 최소 1개 포함 6자 이상 12자 이하!');
					$("#submitButton").attr('disabled', true);
				} else {
					$("#pwdChkComment").text('');
					$("#submitButton").attr('disabled', false);
				}
			});

			$("#password2").on("keyup", function() {
				var pwd = $("#password_").val(), pwd2 = $("#password2").val();
				if (pwd != pwd2) {
					$("#pwdChkComment2").text('위의 비밀번호와 다릅니다.');
					$("#submitButton").attr('disabled', true);
				} else if (pwd != null && pwd2 != null && pwd == pwd2) {
					$("#pwdChkComment2").text('');
					$("#submitButton").attr('disabled', false);
				}

			});
			
			$("#submitButton").on("click", function() {
				
				var pwd = $("#password_").val().trim();
				var pwd2 = $("#password2").val().trim();
				var regPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,12}$/;
				
				if(regPwd.test(pwd) && pwd==pwd2){
					$("#memberEnroll").submit();
				} else{
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
				}				
				reader.readAsDataURL(value.files[0]);				
			}
		}
	</script>
</body>
</html>
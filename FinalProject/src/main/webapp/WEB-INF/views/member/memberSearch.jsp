<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<c:import url="../common/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/dc-memberSearch.css" />
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

					</div>
					<div class="dc-content-box" >
						<div class="center" style="display: inline-block; margin-left:12%;">
							<div class="block" style="border-right: 1px solid lightgray">
								<div class="emailArea" align="center">
									<label class="searchTitleLabel">이메일 찾기</label>
									<form>
										<input type="text" class="form-control" id="nickname_emailArea" name="nickName"
											placeholder="닉네임을 입력하세요." required> 
										<input type="text" class="form-control" id="name_emailArea" name=""
											placeholder="이름을 입력하세요." required> 
										<input type="button" class="btnClass btn emailSearchBtn"
											onclick="searchEmail();" value="Go!">
									</form>
								</div>
								

								<div class="nickNameArea" align="center">
									<label class="searchTitleLabel">닉네임 찾기</label>
									<form>
										<input type="email" class="form-control"
											id="email_nickNameArea" name="" placeholder="이메일을 입력하세요.">
										<input type="button"
											class="btnClass btn nickNameSearchBtn"
											onclick="searchNickName();" value="Go!">
									</form>
								</div>
							</div>

							<div class="block passwordArea"  align="center">
								<label class="searchTitleLabel">비밀번호 찾기</label>
								<form action="sendPwd.do" method="post" id="sendPwd">
									<input type="email" class="form-control" id="email_pwdArea"
										name="email" placeholder="이메일을 입력하세요."> <input
										type="text" class="form-control" id="name_pwdArea" name="name"
										placeholder="이름을 입력하세요."> <input type="button"
										class="btnClass btn passwordSearchBtn"
										onclick="searchPwd();" value="임시 비밀번호 발급받기!">
								</form>
							</div>
						</div>
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
		function searchEmail() {
			var nickName = $("#nickname_emailArea").val();
			var name = $("#name_emailArea").val();

			console.log(nickName);
			console.log(name);

			if (nickName == "") {
				alert("닉네임을 입력해주세요.")
				$("#nickname_emailArea").focus();
			} else if (name == "") {
				alert("이름을 입력해주세요.")
				$("#name_emailArea").focus();
			} else {
				$
						.ajax({
							data : {
								nickName : nickName,
								name : name
							},
							url : "${pageContext.request.contextPath}/member/chkEmail.do",
							dataType : "json",
							success : function(data) {
								console.log(data);
								switch (data.result) {
								case "fail1":
									alert("존재하지 않은 닉네임입니다.");
									location.reload();
									break;
								case "fail2":
									alert("이름 정보가 일치하지 않습니다.");
									$("#chkEmail2").focus();
									break;
								default:
									alert("찾으시는 이메일은 " + data.result + " 입니다.");
									location.reload();
								}
							},
							error : function(jqxhr, textStatus, errorThrown) {
								console.log("ajax 처리 실패");
							}
						});
			}

		}

		function searchNickName() {
			var email = $("#email_nickNameArea").val();

			if (email == "") {
				alert("이메일을 입력해주세요.");
			} else {

				$
						.ajax({
							data : {
								email : email,
							},
							url : "${pageContext.request.contextPath}/member/chkNickName.do",
							dataType : "json",
							success : function(data) {
								console.log(data.result);

								if (data.result != "") {
									alert("찾으시는 닉네임은 " + data.result + " 입니다.");
									location.reload();
								} else {
									alert("존재하지 않은 닉네임입니다.");
									location.reload();
								}

							},
							error : function(jqxhr, textStatus, errorThrown) {
								console.log("ajax 처리 실패");
							}
						});

			}
		}

		function searchPwd() {
			var name = $("#name_pwdArea").val();
			var email = $("#email_pwdArea").val();

			if (name == "") {
				alert("이름을 입력해주세요.")
				$("#name_pwdArea").focus();
			} else if (email == "") {
				alert("이메일을 입력해주세요.")
				$("#email_pwdArea").focus();
			} else {
				$
						.ajax({
							data : {
								name : name,
								email : email
							},
							url : "${pageContext.request.contextPath}/member/chkPwd.do",
							dataType : "json",
							success : function(data) {
								if (data > 0) {
									alert("임시 비밀번호를 가입하신 이메일 " + email
											+ " 로 보내드렸습니다.");
									$
											.ajax({
												data : $("#sendPwd")
														.serialize(),
												type : "POST",
												url : "${pageContext.request.contextPath}/member/sendPwd.do",
												success : function() {
													console.log("성공");
												},
												error : function() {
													console.log("실패");
												}
											});

									location.reload();
								} else {
									alert("정보가 일치하지 않습니다. 다시 확인해주세요.");
									location.reload();
								}
							},
							error : function(jqxhr, textStatus, errorThrown) {
								console.log("ajax 처리 실패");
							}
						});
			}

		}
	</script>
</body>
</html>
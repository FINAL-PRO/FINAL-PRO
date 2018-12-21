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
<c:import url="../common/header.jsp"/>
	<style>
		section {background-color:white;}
		
		.block{
			float: left;			
			height: auto; width: 300px; 
			margin: 120px 10px 120px 10px; 
			margin-left:50px;
		}
		
		form>input{
			width:100%;
			margin-bottom: 5px;
			
		}
		
		.idArea{
			margin-bottom: 50px;
		}
		
		#content{
			width: 100%;
 			text-align: center;
		}
		
		form>label {
			visibility: hidden;
			margin:0;
			fint-size:8px;
		}
	</style>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
		<section id="content">
			<div class="center" style="display: inline-block; ">
				<div class="block">			
					<div class="emailArea">
						<label>이메일 찾기</label>
						<form>
						<input type="text" class="form-control" id="nickname_emailArea" name="nickName" placeholder="닉네임을 입력하세요.">
						<label id="chkEmail1"></label>
						<input type="text" class="form-control" id="" name="" placeholder="이름을 입력하세요.">	
						<label id="chkEmail2"></label>						
						<input type="button" class="btn btn-outline-success emailSearchBtn" onclick="searchEmail();" value="Go!">
						</form>
					</div>
					
					<hr />
					
					<div class="nickNameArea">
						<label>닉네임 찾기</label>
						<form>
						<input type="email" class="form-control" id="" name="email" placeholder="이메일을 입력하세요.">
						<label id="chkNickName"></label>	
						<input type="button" class="btn btn-outline-success nickNameSearchBtn" onclick="searchNickName();"value="Go!">
						</form>				
					</div>				
				</div>
			
				<div class="block">
					<label>비밀번호 찾기</label>
					<form>
					<input type="text" class="form-control" id="" name="nickName" placeholder="닉네임을 입력하세요.">	
					<label id="chkPassword1"></label>
					<input type="email" class="form-control" id="" name="email" placeholder="이메일을 입력하세요.">
					<label id="chkPassword2"></label>
					<input type="button" class="btn btn-outline-success passwordSearchBtn" onclick="searchPwd();"value="Go!">
					</form>					
				</div>
			</div>
		</section>
		<c:import url="../common/footer.jsp"/>
	</div>
	
	<script>
	
	
/* 	$(document).ready(
		function searchEmail() {
	    	var nickname = $("#nickname_emailArea").val();
			$.ajax({
				data : {
					nickName : nickName
				},
				url : "/member/chkNickName.do",
				type : "get",
				success : function(data) {
					console.log(data);
					if (data != null) {
						if (data == "fail") {
							$("#chkEmail1").css("visibility", "visible");
							$("#chkEmail1").css("color", "red");
							$("#chkEmail1").text("존재하지 않은 닉네임 입니다.");
						} else {
							$("#labelEmail").css("visibility", "visible");
							$("#labelEmail").css("color", "lavender");
							$("#labelEmail").text(
									"회원님의 이메일은 ' " + data + " '입니다.");
						}
					} else {
						$("#chkEmail1").css("visibility", "hidden");
					}
				}
			});
		
	}); */
	
	
	</script>
</body>
</html>
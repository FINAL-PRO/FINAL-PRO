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
			float : right;
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
						<input type="text" class="form-control" id="nickname_emailArea" name="nickName" placeholder="닉네임을 입력하세요." required>
						<input type="text" class="form-control" id="name_emailArea" name="" placeholder="이름을 입력하세요." required>	
						<input type="button" class="btn btn-outline-success emailSearchBtn" onclick="searchEmail();" value="Go!">
						</form>
					</div>
					
					<hr />
					
					<div class="nickNameArea">
						<label>닉네임 찾기</label>
						<form>
						<input type="email" class="form-control" id="email_nickNameArea" name="" placeholder="이메일을 입력하세요.">
						<input type="button" class="btn btn-outline-success nickNameSearchBtn" onclick="searchNickName();" value="Go!">
						</form>				
					</div>				
				</div>
			
				<div class="block">
					<label>비밀번호 찾기</label>
					<form action="${pageContext.request.contextPath}/sendPwd.do" id="sendPwd">
					<input type="email" class="form-control" id="email_pwdArea" name="email" placeholder="이메일을 입력하세요.">
					<input type="text" class="form-control" id="name_pwdArea" name="name" placeholder="이름을 입력하세요.">	
					<input type="hidden" class="form-control" id="password" name="password" >						
					<input type="button" class="btn btn-outline-success passwordSearchBtn" onclick="searchPwd();" value="Go!">
					</form>					
				</div>
			</div>
		</section>
		<c:import url="../common/footer.jsp"/>
	</div>
	
	<script>
		function searchEmail() {
	    	var nickName = $("#nickname_emailArea").val();
	    	var name = $("#name_emailArea").val();
	    	
	    	console.log(nickName);
	    	console.log(name);
	    	
	    	if(nickName == ""){
	    		alert("닉네임을 입력해주세요.")
	    		$("#nickname_emailArea").focus();
	    	} else if(name == ""){
	    		alert("이름을 입력해주세요.")
	    		$("#name_emailArea").focus();
	    	} else {
				$.ajax({
					data : {
						nickName:nickName,
						name : name
					},
					url : "${pageContext.request.contextPath}/member/chkEmail.do",
					dataType: "json",
					success : function(data) {
						console.log(data);
						switch(data.result){
						case "fail1" :
							alert("존재하지 않은 닉네임입니다.");
							location.reload();
							break;						
						case "fail2" :
							alert("이름 정보가 일치하지 않습니다.");
							$("#chkEmail2").focus();
							break;
						default:
							alert("찾으시는 이메일은 " + data.result + " 입니다.");
							location.reload();
						}
					}, error : function(jqxhr, textStatus, errorThrown){
		                console.log("ajax 처리 실패");
		            }
				});
	    	}
		
		}
		
		function searchNickName(){
			var email = $("#email_nickNameArea").val();		
			
			if(email == ""){
				alert("이메일을 입력해주세요.");
			} else {
				
				$.ajax({
					data : {
						email: email,
					},
					url : "${pageContext.request.contextPath}/member/chkNickName.do",
					dataType: "json",
					success : function(data) {
						console.log(data.result);
						
						if(data.result != ""){
							alert("찾으시는 닉네임은 " + data.result + " 입니다.");
							location.reload();
						} else {
							alert("존재하지 않은 닉네임입니다.");
							location.reload();
						}
						
					}, error : function(jqxhr, textStatus, errorThrown){
		                console.log("ajax 처리 실패");
		            }
				});
				
				
			}	
		}
		
		function searchPwd() {
	    	var name = $("#name_pwdArea").val();
	    	var email = $("#email_pwdArea").val();
	    	
	    	if(name == ""){
	    		alert("이름을 입력해주세요.")
	    		$("#name_pwdArea").focus();
	    	} else if(email == ""){
	    		alert("이메일을 입력해주세요.")
	    		$("#email_pwdArea").focus();
	    	} else {
				$.ajax({
					data : {
						name: name,
						email : email
					},
					url : "${pageContext.request.contextPath}/member/chkPwd.do",
					dataType: "json",
					success : function(data) {
						if(data > 0 ){
							alert("임시 비밀번호를 가입하신 이메일 " + email + " 로 보내드렸습니다.");
							//$("#sendPwd").submit();
							location.reload();
						} else {
							alert("정보가 일치하지 않습니다. 다시 확인해주세요.");
							location.reload();
						}
					}, error : function(jqxhr, textStatus, errorThrown){
		                console.log("ajax 처리 실패");
		            }
				});
	    	}
		
		}
	
	
	</script>
</body>
</html>
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
		
		.dc-content-box{padding: 40px;}
		.btn-container>.btn{width:100%}
		.row label{width: 100%; text-align:left; font-size: 8px;}
		
		#modalBtn>button {width: 40%; text-align:center; margin-bottom: 10px;}
		
		#modalPassword {width: 80%;}
				
	</style>
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
							<c:import url="../mypage/myPageMenu.jsp"/>
						</div>
						
						<div class="dc-content-box">
							<div id="enroll-container">
							<form name="memberEnrollFrm" action="" method="post">								 
								<div class="row email-container" id="email-container">
									<div class="col-md-3">이메일</div>
									<div class="col-md-6"><input type="email" class="form-control" name="email" id="email" value="${member.email}" readonly></div>
									<div class="col-md-3 comment" id="duplicateCheck">
										<label class="guide1"></label>
							    	</div>
								</div>								   
			
							   <div class="row nickName-container" id="nickName-container">
							   		<!-- 닉네임 2~10 글자 허용 -->
							   		<div class="col-md-3">닉네임</div>
							   		<div class="col-md-6">
							   			<input type="text" class="form-control" name="nickName" id="nickName" value="${member.nickName}" readonly>
							   		</div>			   		
							   		<div class="col-md-3 duplicateCheck" id="duplicateCheck2">
							   		<!-- 닉네임 중복 검사 -->
							   			<label class="guide"></label>			            
							   		</div>
							   </div>
							   
							        
							   <div class="row userName-container" id="userName-container">
							   		<div class="col-md-3">이름</div>
							   		<div class="col-md-6">
							   		<input type="text" class="form-control" name="name" id="userName" value="${member.name}" readonly>	
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
							   
							   <c:set var="locationValue" value=""></c:set>
							   
							   <div class="row address-container" id ="address-container2">
							   		<div class="col-md-3"></div>
							   		<div class="col-md-6">
							   			<c:set var="selectedLocationNo" value="${member.locationNo}"></c:set>
								   		<select class="form-control" name="locationNo" id="locationNo" disabled>					   		
								   		<c:forEach items="${locationList}" var="location" >						   			
								   			<option value="${location.no}" ${ (location.no == selectedLocationNo) ? "selected"  :  "" }> ${location.location}</option>
								   		</c:forEach>
								   		</select>
							   		</div>
							   	<div class="col-md-3" id=""></div>				   		
							   </div>
							   
							    <div class="row address-container" id="address-container">
							   		<div class="col-md-3">상세 주소</div>
							   		<div class="col-md-6">
							   		<input type="text" class="form-control" name="address" id="address" value="${member.address}" readonly>	
							   		</div>	
							   		<div class="col-md-3" id="">
							   			<label class=""></label>			            
							   		</div>		   		
							   </div>
							   
							    <div class="row deposit-container" id="deposit-container">
							   		<div class="col-md-3">계좌번호</div>
							   		<div class="col-md-2" style="padding-right:0;">	
							   			<c:set var="selectedBank" value="${member.bank}"></c:set>
								   		<select class="form-control" name="bank" id="bank" style="padding:0;" disabled>					   		
								   		<c:forEach items="${bankList}" var="bank" >						   			
								   			<option value="${bank.id}" ${ (bank.value == selectedBank) ? "selected"  :  "" }> ${bank.value}</option>
								   		</c:forEach>
								   		</select>				   							   			
							   		</div>	
							   		<div class="col-md-4" style="padding-left:0;">
							   		<input type="text" class="form-control" name="deposit" id="deposit" value="${member.deposit}" readonly>	
							   		</div>	
							   		<div class="col-md-3" id="">
							   			<label class=""></label>			            
							   		</div>		   		
							   </div>							   						   
							   <div class="row btn-container">
								   <div class="col-md-3"></div>
								   <div class="col-md-6 btn-container"><input type="button" id="memberUpdateView" class="btn btn-outline-success" value="회원정보 수정" onclick="${pageContext.request.contextPath}/member/memberUpdateView.do"></div>				  
								   <div class="col-md-3" id="">
							   </div>
							   </div>	
							</form>
							
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
	$("#memberUpdateView").on("click", function(){
		location.href= "${pageContext.request.contextPath}/member/memberUpdateView.do";
	});
	
	</script>
</body>
</html>
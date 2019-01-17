<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dc-rightSection.css" />
	
<script>
	var uris = "${pageContext.request.requestURI}".split("/");
	console.log(uris);
	var adPage = "메인";
	var adSection = "우측";
	var adLocation = "하단";
	
	if(uris.length < 6){
		adPage = "메인";
	}else if(uris.length < 7){
		adPage = "관리자";
	}
	$.ajax({
		url : "${pageContext.request.contextPath}/business/ad/getAd.do?adPage=" + adPage + "&adSection=" + adSection + "&adLocation=" + adLocation,
		success : function(data){
			console.log("우측 섹션 광고 ajax 성공");
			console.log(data);
			
			if(data == ""){
				$("#ad-right-bottm-img").attr("src","${pageContext.request.contextPath}/resources/upload/ad/adright.gif");
				$(".ad-right-bottm").attr("onclick", "window.open('" + "http://www.iei.or.kr/main/main.kh" + "');");
			}else{
				$("#ad-right-bottom-img").attr("src",data['adContentPath']);
				$(".ad-right-bottm").attr("onclick", "window.open('" + data['landingPage'] + "');");
			}
			
		}, error : function(){
			console.log("우측 섹션 광고 ajax 에러");
			$(".ad-right").css("width", "258px").css("height", "280px").attr("background-position", "center")
			.css("background-repeat", "no-repeat").css("background-size", "cover").css("margin-left", "auto")
			.css("margin-right", "auto");
			$(".ad-right").css("background-image", 'url("${pageContext.request.contextPath}/resources/upload/ad/260x280.png")');			
		}
	});
	
	function msgPop() {
		window.open("${pageContext.request.contextPath}/message/messageList.do?no=${member.no}", "msgPop", "width=600px;, height=400px;");
	}
</script>	

<div class="dc-content">
	<%-- <img class="adimg" src="${pageContext.request.contextPath}/resources/images/adimg1.jpg" 
						alt="메인_우측_세로배너" width="140" height="800"
						style="margin-left: 1px;margin-right: 1px; margin-top:60px; margin-bottom:60px;
						border:1px solid red"/> --%>
	<div class="dc-content-box dc-border" style="min-height: 0vh;">
		<!-- <h4>
			<span class="board-title">정보</span>
		</h4> -->
		<div class="dc-user-profile" align="center">
			<div class="dc-profile-area-top" style="background:white; padding:10px;">
				<!-- 로그인 안 했을때 -->
				<sec:authorize access="isAnonymous()">
					<button style="width:90%;margin:10px;" class="btn loginBtnSection" id="loginBtn" onclick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
					<span style="font-size: 12px; color: rgb(171, 187, 129); line-height: 0.5;">동커를 더 다양하고 편리하게 <br> 사용하시려면 <b style="color:rgb(244, 126, 96);">로그인</b>해주세요.</span>
				</sec:authorize>
				
				<!-- 로그인 했을때 -->
				<sec:authorize access="isAuthenticated()">
				<c:if test="${!empty member.profile}">
					<img id="profileImg" src="${pageContext.request.contextPath}/resources/upload/profile/${member.profile}"
						style="border-radius: 50px; border: 1px solid lightgray; width: 80px; height: 80px; margin: 0px 0px 10px 0px;"/>					    				
				</c:if>
				<c:if test="${empty member.profile}">
					<img id="profileImg" src="${pageContext.request.contextPath}/resources/upload/profile/profileDefaultImg.png"
						style="border-radius: 50px; border: 1px solid lightgray; width: 80px; height: 80px; margin: 0px 0px 10px 0px;"/>
				</c:if>
				<br />
				<span>
					<a href="${pageContext.request.contextPath}/member/memberView.do?no=${member.no}"
						title="내정보보기" style="color: rgb(244, 126, 96); font-weight: bold; margin-bottom: 10px;">${member.nickName}</a> 님, 안녕하세요!
				</span>

				</sec:authorize>
				
			</div>
			
			<div class="dc-profile-area-bottom" style="padding:8px 0px;">
				<!-- 로그인 안했을때 -->
				<sec:authorize access="isAnonymous()">
					<ul>
						<li><button class="btn loginBtnSection" onclick="location.href='${pageContext.request.contextPath}/member/memberSearch.do'">id/pw 찾기</button></li>
						<li><button class="btn loginBtnSection" id="enrollBtn" type="button" onclick="location.href='/dc/member/memberInsert.do'">회원가입</button></li>
					</ul>
				</sec:authorize>
				
				<!-- 로그인 했을 때 -->
				<sec:authorize access="isAuthenticated()">
					<ul class="afterLoginUl">
						<li><button type="button" class="btn loginBtnSection" onclick="msgPop();"> 
						  쪽지 <span class="badge" id="countUnreadMSG"></span>
						</button>
						<script>
							$(document).ready(function(){
								countMsg();
							});	
							
							function countMsg(){
								$.ajax({
									data : { memNo : ${member.no} },
									url : "${pageContext.request.contextPath}/message/countUnreadMSG.do",
									success : function(data){
										$("#countUnreadMSG").text(data);
									}
								});
							}
						</script>
						</li>
						<li><button class="btn btn-warning loginBtnSection" onclick="location.href='${pageContext.request.contextPath}/logout.do'">로그아웃</button></li>
					</ul>
				</sec:authorize>
			</div>
		</div>
	</div>
	<div class="dc-content-box dc-border" align="center">
		<h4 style="margin: 10px 0px 10px 0px;">
			<span class="board-title">현재 우리동네 날씨</span>
		</h4>
		<hr style="margin:0;">	
		<div class="" style="text-align: center;">
			<label id="village" style="margin-bottom: 10px;"></label><br>
			<img class="loadingImg" alt="" src="${pageContext.request.contextPath}/resources/images/loading1.gif" style="width:100px; height: 100px;"/>
			<i class="" id="weatherIcon" style="font-size: 50px; margin: 10px 0px 15px 0px; color: rgb(244, 126, 96);"></i> <br>
			<b><label class="weatherLabal" style="margin-bottom:0px; color:rgb(244, 126, 96);" id="sky"></label></b>
		
		<hr />
		
		<div class="nowWeather-container" style="display: inline-block; font-weight: bold; margin-bottom: 10px;">	
			<!-- <div class="block" style="text-align: center; width: auto;">
				현재 기온 :	<label id="tc"></label><br>
				최저 기온 :	<label id="tmin"></label><br>
				최고 기온 :	<label id="tmax"></label>
			</div>
			<div class="block" style="text-align: center; width: auto;">
				<label id="tc"></label><br>
				<label id="tmin"></label><br>
				<label id="tmax"></label>
			</div> -->
		</div>
		</div>
		
	</div>
	<div class="dc-content-box dc-border">
		<!-- <h1>광고(AD)</h1> -->
		<div class="ad-right-bottom">
			<img id="ad-right-bottom-img" src="" width="258px" height="290px"/>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
			 
		var url = "";
		var village = "";
		var output = "";
				
		switch("${member.locationNo}"){
			case '2': url="&city=서울&county=강남구&village=역삼1동"; village="역삼동"; break;
			case '5': url="&city=서울&county=성동구&village=성수1가1동"; village="성수동"; break;
			case '8': url="&city=서울&county=마포구&village=상암동"; village="상암동"; break;
			case '11': url="&city=서울&county=중구&village=명동1가"; village="명동"; break;
			case '14': url="&city=서울&county=은평구&village=구산동"; village="구산동"; break;
			default : url="&city=서울&county=강남구&village=역삼1동"; village="역삼동"; break;
		}

		/* $.ajax({
			type: "GET",
			url: "https://api2.sktelecom.com/weather/current/minutely?appKey=a294c267-b2de-41f1-99ee-1a4894a40fdf" + url,
			header:{
				"Accept": "application/json",
				"Content-Type": "application/json; charset=UTF-8"
			},
			success: function(result){
				var sky = result.weather.minutely["0"].sky.name;
				var tc = Math.floor(result.weather.minutely["0"].temperature.tc) + "℃";
				var tmax = Math.floor(result.weather.minutely["0"].temperature.tmax) + "℃";
				var tmin = Math.floor(result.weather.minutely["0"].temperature.tmin) + "℃";
				
				console.log(sky);
				console.log(tc);
				console.log(tmax);
				console.log(tmin);
				
				switch(sky){
					case "맑음": 
						$("#weatherIcon").attr("class", "wi wi-day-sunny"); break;
					case "구름조금": $("#weatherIcon").attr("class", "wi wi-day-sunny-overcast"); break;
					case "구름많음": $("#weatherIcon").attr("class", "wi wi-day-cloudy"); break;
					case "구름많고 비": $("#weatherIcon").attr("class", "wi wi-rain"); break;
					case "구름많고 눈": $("#weatherIcon").attr("class", "wi wi-snow"); break;
					case "구름많고 비 또는 눈": $("#weatherIcon").attr("class", "wi wi-hail"); break;
					case "흐림": $("#weatherIcon").attr("class", "wi wi-cloudy"); break;
					case "흐리고 비": $("#weatherIcon").attr("class", "wi wi-rain"); break;
					case "흐리고 눈": $("#weatherIcon").attr("class", "wi wi-snow"); break;
					case "흐리고 비 또는 눈": $("#weatherIcon").attr("class", "wi wi-hail"); break;
					case "흐리고 낙뢰 ": $("#weatherIcon").attr("class", "wi wi-cloud"); break;
					case "뇌우/비": $("#weatherIcon").attr("class", "wi wi-rain"); break;
					case "뇌우/눈": $("#weatherIcon").attr("class", "wi wi-snow"); break;
					case "뇌우/비 또는 눈": $("#weatherIcon").attr("class", "wi wi-rain-mix"); break;		
				}
				
				$("#sky").text(sky); 
				output += '현재 기온 :	<label class="weatherLabal" id="tc">'+ tc +'</label><br>';
				output += '최저 기온 :	<label class="weatherLabal" id="tmin">'+ tmin +'</label><br>';
				output += '최고 기온 :	<label class="weatherLabal" id="tmax">'+ tmax +'</label>';
				
				$('.nowWeather-container').append(output);
				
			},  error : function(jqxhr, textStatus, errorThrown) {
				console.log("ajax 처리 실패");
				$(".loadingImg").toggle();
			}, complete : function(){
				$(".loadingImg").toggle();
			}
			
		}); */
		
	});


</script>

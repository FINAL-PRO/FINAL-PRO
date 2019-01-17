<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>동커</title>
	<c:import url="../../common/header.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/info/weather/dc-info-weather.css" />
	
	<!-- 기상청 날씨 받아오기 위한 크로스도메인 해결 플러그인 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.ajax-cross-origin.min.js"></script>
</head>
<body>
	<c:import url="../../common/menubar.jsp"/>
	<div class="wrap_inner">
		<main id="container">
			<section>
				<div class="section-left">
					<!-- 내용없음 -->
				</div>
				
				<div class="section-center">
					<div class="dc-content">
						<!-- <div class="dc-content-title">
						</div> -->
						<div class="dc-content-box">
							<div class="weather-container" style="">
								<!-- 오늘 내일 모레 날씨 -->
								<!-- 동네 이름 -->
								<p class="townName" style="margin: 0 0 0 10px; font-size:24px; border-bottom: 2px solid lightgray; font-weight: bold;">
									우리동네 <span style="color:rgb(171, 187, 129);">오늘</span> / 
									<span style="color:rgb(248, 178, 106);">내일</span> / 
									<span style="color:rgb(244, 126, 96);">모레</span> 날씨</p>
								<div class="currentWeather" style="width:100%;"> 
									<div id="loadingTodayWeather" style="padding-top: 20px;"> 
										<h3 id="currentWeatherLabel">현재 날씨를 불러오는 중입니다.</h3>
										<img src="${pageContext.request.contextPath}/resources/images/loading1.gif" style="height: 150px;"/>
									</div>														
								</div>
								
								<div style="margin:50px 0px 50px 0px;">							
								</div>
																
								<!-- 주간 날씨 부분 -->
								<p style="margin: 0 0 0 10px; font-size:24px; border-bottom: 2px solid lightgray; font-weight: bold;"> 우리동네 주간 날씨</p>
								<div class="weekWeather-container" style="display: inline-block; margin-top:10px; width: 100%">	
									<div id="loadingWeekWeather" style="padding-top: 20px;">													
										<h3 id="weekWeatherLabel">주간 날씨를 불러오는 중입니다.</h3>
										<img src="${pageContext.request.contextPath}/resources/images/loading1.gif" style="height: 150px;"/>
									 </div>										
								</div>	
								
													
							</div>
						</div>
					</div>
				</div>
				
				<div class="section-right">
					<c:import url="../../common/rightSection.jsp"/>
				</div>
			</section>
		</main>
	</div>
	<c:import url="../../common/footer.jsp"/>

	<script>
	$(document).ready(function(){
		
		var sky = "";	// 날씨 아이콘 변수
		
		// 날짜 qeury
		var today = new Date();
		
		var dd = today.getDate();
	    var mm = today.getMonth() + 1;
	    var yyyy = today.getFullYear();
	    if (dd < 10) {
	    	dd = "0" + dd;
	    }
	    if (mm < 10) {
	    	mm = "0" + mm;
	    }
		
		today = yyyy+'-'+mm+'-'+dd + ' 00:00';
		
		// 사용자 Location으로 동네 이름 불러오기
		
		var url = "";
		
		<c:if test="${!empty member}">			
			switch("${member.locationNo}"){
				case '2': url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1168064000"; break;
				case '5': url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1120065000"; break;
				case '8': url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1144074000"; break;
				case '11': url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1114055000"; break;
				case '14': url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1138056000"; break;
			}
			
		</c:if> 
		
		<c:if test="${empty member}">
			url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1168064000";
		</c:if> 

 		// 단기 예보(3시간별 오늘, 내일, 모레)
		$.ajax({
			crossOrigin: true,
			url : url,
			dataType: 'jsonp',
	        type: "GET",
	        async: "false",
	        success: function(data) {    	
	        	
	            console.log(data);  
	            var value1 = "";   	            
	            var value2 = "";   	            
	            
	            $(data).find('item').each(function(){
	            	
	            	// 동네 이름 넣기
	            	$('.townName').append(' <span style="font-size: 16px;">(' +$(this).find('category').text() + ')</span>');
	            	
	            	value1 += '<div class="block"><label class="weatherTotalLabel" style="width:65px; margin-bottom: 0; font-weight: bold; line-height: 1.8;">';			
	            	value1 += '날짜<br>시간<br>'
	            	value1 += '<div style="">날씨</div><br>';						
	            	value1 += '<span style="font-size: 8px;">최저온도</span><br>';
	            	value1 += '<span style="font-size: 8px;">최고온도</span><br>';
	            	value1 += '</label></div>';
					
					$('.currentWeather').append(value1);
	            	
	            	$(this).find('data').each(function(){
	            			            		
	            		var day ="";	// 오늘/ 내일/ 모레 
	            		var mintemp = $(this).find('tmn').text();
	            		var maxtemp = $(this).find('tmx').text();
	            		
	            		
	            		// 날짜 구분
	            		switch($(this).find('day').text()){
	            		case '0': day = '<label class="weatherTotalLabel" style="width:65px; margin-bottom: 0; font-weight: bold; color:rgb(171, 187, 129); line-height: 1.8;">오늘'; break;
	            		case '1': day = '<label class="weatherTotalLabel" style="width:65px; margin-bottom: 0; font-weight: bold; color:rgb(248, 178, 106); line-height: 1.8;">내일'; break;
	            		case '2': day = '<label style="width:65px; margin-bottom: 0; font-weight: bold; color:rgb(244, 126, 96); line-height: 1.8;">모레'; break;	            		
	            		}

	            		// 날씨 아이콘 넣기	            		
	            		switch($(this).find('wfKor').text()){
							case "맑음": sky='<i class="wi wi-day-sunny"></i>'; break;
							case "구름 조금": sky='<i class="wi wi-day-sunny-overcast"></i>'; break;
							case "구름 많음": sky='<i class="wi wi-day-cloudy"></i>'; break;
							case "흐림": sky='<i class="wi wi-cloudy"></i>'; break;
							case "비": sky='<i class="wi wi-rain"></i>'; break;
							case "눈": sky='<i class="wi wi-snow"></i>'; break;
							case "눈/비": sky='<i class="wi wi-hail"></i>'; break;
						}
	            		
	            		// 최저 기온 잘못된 정보일 때 구분
	            		if(mintemp == '-999.0'){
	            			mintemp = '-';
	            		}
	            		
	            		if(maxtemp == '-999.0' ){
	            			maxtemp = '-';
	            		}
	            		
	            		if($(this).find('hour').text() == '6' || $(this).find('hour').text() == '12'
	           				|| $(this).find('hour').text() == '18' || $(this).find('hour').text() == '24'){
	             		
		            		value2 += '<div class="block" style="text-align: center;">';
		            		value2 += day + '<br>';
		            		value2 += $(this).find('hour').text() + '시<br>';
		            		value2 += sky + '<br>';	            		
		            		value2 += '<label style="font-size:14px;">' + $(this).find('wfKor').text() + '</label><br>';
		            		value2 += mintemp + '<br>';            		
		            		value2 += maxtemp  + '</label></div>';
	            		
	            		}
	     	            
	 	            });
	            	
	            	$('.currentWeather').append(value2);
	            	
	            }); 
      
	        }, error:function(data){
	        	console.log("날씨 ajax 실패");
	        	$("#loadingTodayWeather").toggle();
	        	
	        }, complete : function(){				
	        	$("#loadingTodayWeather").toggle();
			}
	    });		
		
		
		// 주간날씨(기상청 중기예보 - 10일 예보)
		var apiURI = "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109";
		
	    $.ajax({
	    	crossOrigin: true,
	        url: apiURI,
	        dataType: 'jsonp',
	        jsonp: "callback",
	        type: "GET",
	        async: "false",
	        success: function(data) {
				
	            console.log(data);  
	            var value1 = "";
	            var value2 = "";
	            
	            value1 += '<div class="block"><label style="width:60px; text-align:center; 	margin-bottom: 0; font-weight: bold; line-height: 2.0;">';
	            value1 += '날짜<br>';
	            value1 += '<div style="height: 48px;">날씨</div><br>	';
	            value1 += '<span style="font-size: 8px;">최저온도</span><br>';
	            value1 += '<span style="font-size: 8px;">최고온도</span><br>';
	            value1 += '</label></div>';
	            
	            $('.weekWeather-container').append(value1); 
       
	            $(data).find('location').each(function(){
	            	
	            	var city = $(this).find('city').text();
	            	
	            	if(city=='서울'){
	
			           	$(this).find('data').each(function(){
			           			
			           		//var time = $(this).find('tmEf').text().substring(10);
			           	// 날씨 아이콘 넣기	            		
		            		switch($(this).find('wf').text()){
								case "맑음": sky='<i class="wi wi-day-sunny week" style="margin: 15px 0px 15px 0px;"></i>'; break;
								case "구름조금": sky='<i class="wi wi-day-sunny-overcast week" style="margin: 15px 0px 15px 0px;"></i>'; break;
								case "구름많음": sky='<i class="wi wi-day-cloudy week" style="margin: 15px 0px 15px 0px;"></i>'; break;
								case "흐림": sky='<i class="wi wi-cloudy week" style="margin: 15px 0px 15px 0px;"></i>'; break;
								case "비": sky='<i class="wi wi-rain week" style="margin: 15px 0px 15px 0px;"></i>'; break;
								case "눈": sky='<i class="wi wi-snow week" style="margin: 15px 0px 15px 0px;"></i>'; break;
								case "눈/비": sky='<i class="wi wi-hail week" style="margin: 15px 0px 15px 0px;"></i>'; break;
		            		}			           		
			           		
			           		
			           		if($(this).find('tmEf').text().substring(10) == today.substring(10)){
	       				
			           			value2 += '<div class="block"><label style="width:85px; text-align:center; 	margin-bottom: 0; font-weight: bold; line-height: 1.8;">';
			           			value2 += $(this).find("tmEf").text().substring(5,10) + '</label><br>'; 
			           			value2 += sky + '<br><label style="width:85px; text-align:center; 	margin-bottom: 0; font-weight: bold; line-height: 1.8;">';	 
			           			value2 += $(this).find("wf").text().substring(0,10) + '<br>'; 
			           			value2 += $(this).find('tmn').text() + '<br>'; 
			           			value2 += $(this).find("tmx").text() + '</label></div>';		                				
			            		
			            	}
			           		
			            });
			           	
			           	$('.weekWeather-container').append(value2);
			           	$('.weekWeather-container').append('</div>');
	            		            		
	            	}
	            	
	            });
	        }, error : function(data){
	        	console.log("주간 날씨 ajax 에러");
	        	$("#loadingWeekWeather").toggle();
	        	
	        }, complete : function(){
	        	$("#loadingWeekWeather").toggle();
			}
	    });
	    
			
	});
	
	
	</script>
</body>
</html>
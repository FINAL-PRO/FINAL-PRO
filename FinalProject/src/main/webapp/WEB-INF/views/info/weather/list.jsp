<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<style>
		.block {
			float: left;
			height: auto;
			width: auto;
			/* border: 1px solid lightgray; */
		}
		
		.currentWeather{
			display: inline-block; 
			margin-top:10px; 
			font-size:16px; 
			text-align:center; 
			border: 1px solid lightgray;
		}	
	</style>
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
						<div class="dc-content-title">
							<h1>제목</h1>
						</div>
						<div class="dc-content-box">
							<div class="weather-container" style="margin: 20px;">
								<!-- 오늘 내일 모레 날씨 -->
								<!-- 동네 이름 -->
								<h4 class="townName"></h4>
								<div class="currentWeather">
									<div class="block">									
									날짜  <br>
									시간  <br>
									<div style="height:55px;">날씨 </div><br>	
									최저온도  <br>
									최고온도  <br>									
									</div>					
								</div>
								
								<hr />
								
								<!-- 주간 날씨 부분 -->
								<div class="weekWeather-container" style="display: inline-block; margin-top:10px;">						
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
	        url: url,
	        dataType: "xml",
	        type: "GET",
	        async: "false",
	        success: function(data) {
	        	
	            console.log(data);  
	            var output = "";   	            
	            
	            $(data).find('item').each(function(){
	            	
	            	// 동네 이름 넣기
	            	$('.townName').text($(this).find('category').text());	
	            	
	            	$(this).find('data').each(function(){
	            			            		
	            		var day ="";
	            		var mintemp = $(this).find('tmn').text();
	            		var maxtemp = $(this).find('tmx').text();
	            		var sky = "";
	            		
	            		// 날짜 구분
	            		switch($(this).find('day').text()){
	            		case '0': day = '<label style="background-color:lightblue; width:50px; margin-bottom: 0;">오늘'; break;
	            		case '1': day = '<label style="background-color:lightpink; width:50px; margin-bottom: 0;">내일'; break;
	            		case '2': day = '<label style="background-color:lightgray; width:50px; margin-bottom: 0;">모레'; break;	            		
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
	            		
	             		
	            		output += '<div class="block" style="width: 50px; text-align: center;">';
	            		output += day + '<br>';
	            		output += $(this).find('hour').text() + '시<br>';
	            		output += sky + '<br>';	            		
	            		output += '<div style="height: 30px;">' + $(this).find('wfKor').text() + '</div><br>';
	            		output += mintemp + '<br>';            		
	            		output += maxtemp  + '</label></div>';
	     	            
	 	            });
	            	
	            	$('.currentWeather').append(output);           	
	            }); 
      
	        },error:function(data){
	        	console.log("날씨 ajax 실패");
	        	location.href="/dc";
	        }
	    });		
		
		// 주간날씨(기상청 중기예보 - 10일 예보)
		var apiURI = "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109";
		
	    $.ajax({
	        url: apiURI,
	        type: 'jsonp',
	        type: "GET",
	        async: "false",
	        success: function(data) {
	            console.log(data);  
	            var output = "";
       
	            $(data).find('location').each(function(){
	            	
	            	var city = $(this).find('city').text();
	            	
	            	if(city=='서울'){
	
			           	$(this).find('data').each(function(){
			           			
			           		//var time = $(this).find('tmEf').text().substring(10);
			           		
			           		if($(this).find('tmEf').text().substring(10) == today.substring(10)){
	       				
			               	output += '<div class="block"><label style="width:100px; text-align:center;">';
			               	output += $(this).find("tmEf").text().substring(0,10) + '<br> 최저 : '; 
			               	output += $(this).find('tmn').text() + '<br> 최고 : '; 
			              	output += $(this).find("tmx").text() + '</label></div>';		                				
			            	
			            	$('.weekWeather-container').html(output);
			            		
			            	}
		
			            });
	            		            		
	            	}
	            	
	            });
	        }
	    });
	    
			
	});
	
	
	</script>
</body>
</html>
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
								<h3 class="townName"></h3>
								<div class="currentWeather" style="display: inline-block; margin-top:10px; font-size:16px; text-align:center;">
									<div class="block">
									<label style="font-weight:bold;">
									날짜  <br>
									시간  <br>
									날씨  <br><br>	
									최저온도  <br>
									최고온도  <br>
									</label>
									</div>
									
									
									<!-- <table>
									<thead>
										<tr>
											<th>날짜</th>
											<th>시간</th>
											<th>최저온도</th>
											<th>최고온도</th>
											<th>날씨</th>
										</tr>
									</thead>
									<tbody id="currentWeather">
									
									</tbody>
									</table> -->					
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
		
		
		// 단기 예보(3시간별 오늘, 내일, 모레)
		$.ajax({
	        url: "http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1168064000",
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
	            		var sky = "";
	            		
	            		// 날짜 구분
	            		switch($(this).find('day').text()){
	            		case '0': day = "오늘"; break;
	            		case '1': day = "내일"; break;
	            		case '2': day = "모레"; break;	            		
	            		}
	            		
	            		// 최저 기온 잘못된 정보일 때 구분
	            		if(mintemp == "-999.0"){
	            			mintemp = '-';
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
	            		
	             		
	            		output += '<div class="block currentWeather" style="width: 50px; text-align: center;"><label>';
	            		output += day + '<br>';
	            		output += $(this).find('hour').text() + '시<br>';
	            		output += sky + '<br>';	            		
	            		output += $(this).find('wfKor').text() + '<br>';
	            		output += $(this).find('tmx').text()  + '<br>';
	            		output += mintemp + '</div>';
	            		
	            		
						/* 테이블 형태로 만든 버전 : 세로 테이블이라 사용 불가
	            		output += "<tr>";
	            		output += "<th>" + day + "</th>";
	            		output += "<td>" + $(this).find('hour').text() + "</td>";
	            		output += "<td>" + $(this).find('tmn').text() + "</td>";
	            		output += "<td>" + $(this).find('tmx').text() + "</td>";
	            		output += "<td>" + $(this).find('wfKor').text() + "</td>";
	            		output += "</tr>";	
	            		
	            		$('#currentWeather').html(output);*/	            		
	     	            
	 	            });
	            	
	            	$('.currentWeather').append(output);
	            	
	            	
	            }); 
	            
	            
	            
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
	       				
			               	output += '<div class="block"><label>';
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
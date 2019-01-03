<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="dc-content">
	<%-- <img class="adimg" src="${pageContext.request.contextPath}/resources/images/adimg1.jpg" 
						alt="메인_우측_세로배너" width="140" height="800"
						style="margin-left: 1px;margin-right: 1px; margin-top:60px; margin-bottom:60px;
						border:1px solid red"/> --%>
	<div class="dc-content-box">
		<h1>정보</h1>
	</div>
	<div class="dc-content-box">
		
		<h1>오늘의 날씨</h1>
		<hr />	
		<div class="" style="text-align: center">
			<label style="margin-bottom: 10px;">(일단 default 삼성동 날씨)</label><br>
			<i class="wi wi-night-sleet" id="weatherIcon" style="font-size: 50px; margin-bottom: 10px;"></i> <br>
			<label id="sky"></label>
		
		<hr />
		현재 기온 : <label id="tc"></label><br>
		최저 기온 : <label id="tmin"></label><br>
		최고 기온 : <label id="tmax"></label>
		</div>
		
	</div>
	<div class="dc-content-box">
		<h1>광고(AD)</h1>
	</div>
</div>

<script>
	$(document).ready(function(){
		
		/* var today = new Date();
		
		var dd = today.getDate();
	    var mm = today.getMonth() + 1;
	    var yyyy = today.getFullYear();
	    if (dd < 10) {
	    	dd = "0" + dd;
	    }
	    if (mm < 10) {
	    	mm = "0" + mm;
	    }
		
		
		var uri = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?";
		var ServiceKey = "ServiceKey=sHO7cQ8W9S0IyMdkrHs0mfwGb47lglNNo8mg7IVAWb%2F29x%2BGQDGPPcZ32S03EiWOgTWQgY%2FM8HT7sqCAiK33vA%3D%3D";
		var base_date= "&base_date=" + yyyy + mm + dd;
		var base_time= "&base_time=0500";
		var nx= "&nx=60";
		var ny= "&ny=127";
		var numOfRows= "&numOfRows=10";
		var pageNo= "&pageNo=1";
		var type= "&_type=json";
		
		
		$.ajax({
			   url: "http://weather.yahooapis.com/forecastjson?w=2295424",
			   dataType: "json",
			   success: function(data) {
			      console.log( data.forecast[0].day );
			      }
			 }); */
		
		 $.ajax({
			type: "GET",
			url: "https://api2.sktelecom.com/weather/current/minutely?appKey=a294c267-b2de-41f1-99ee-1a4894a40fdf&city=서울&county=강남구&village=삼성동",
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
					case "맑음": $("#weatherIcon").attr("class", "wi wi-day-sunny"); break;
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
				$("#tc").text(tc);
				$("#tmax").text(tmax);
				$("#tmin").text(tmin);
				
			},  error : function(jqxhr, textStatus, errorThrown) {
				console.log("ajax 처리 실패");
			}
			
		}); 
		
	});


</script>

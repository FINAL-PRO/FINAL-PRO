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
					case "맑음": $("#weatherIcon").attr("class", "wi wi-day-sunny");
					case "구름조금": $("#weatherIcon").attr("class", "wi wi-day-sunny-overcast");
					case "구름많음": $("#weatherIcon").attr("class", "wi wi-day-cloudy");
					case "구름많고 비": $("#weatherIcon").attr("class", "wi wi-rain");
					case "구름많고 눈": $("#weatherIcon").attr("class", "wi wi-snow");
					case "구름많고 비 또는 눈": $("#weatherIcon").attr("class", "wi wi-hail");
					case "흐림": $("#weatherIcon").attr("class", "wi wi-cloudy");
					case "흐리고 비": $("#weatherIcon").attr("class", "wi wi-rain");
					case "흐리고 눈": $("#weatherIcon").attr("class", "wi wi-snow");
					case "흐리고 비 또는 눈": $("#weatherIcon").attr("class", "wi wi-hail");
					case "흐리고 낙뢰 ": $("#weatherIcon").attr("class", "wi wi-cloud");
					case "뇌우/비": $("#weatherIcon").attr("class", "wi wi-rain");
					case "뇌우/눈": $("#weatherIcon").attr("class", "wi wi-snow");
					case "뇌우/비 또는 눈": $("#weatherIcon").attr("class", "wi wi-rain-mix");				
				}
				
				$("#sky").text(sky);
				$("#tc").text(tc);
				$("#tmax").text(tmax);
				$("#tmin").text(tmin);
				
				$("#sky1").text(sky);
				$("#tc1").text(tc);
				$("#tmax1").text(tmax);
				$("#tmin1").text(tmin);
				
			},  error : function(jqxhr, textStatus, errorThrown) {
				console.log("ajax 처리 실패");
			}
			
		});
		
	});


</script>

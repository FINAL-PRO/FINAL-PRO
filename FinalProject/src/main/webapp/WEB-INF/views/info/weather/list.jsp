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
			width: 200px;
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
								<h3>서울특별시 강남구</h3>
								<div class="todayWeather" style="display: inline-block; margin-top:10px;">
									<div class="block">
										<i class="wi wi-night-sleet" id="weatherIcon" style="font-size: 100px; margin:20px; height: auto;"></i> <br>
									</div>
									<div class="block">
										<label id="tc1" style="font-size:40px;"></label> &nbsp;&nbsp;&nbsp;,<label id="sky1"></label> <br>
										최저 기온 : <label id="tmin1"></label><br>
										최고 기온 : <label id="tmax1"></label>
									</div>
								</div>	
								<div class="weekWeather" style="display: inline-block; margin-top:10px;">
									<div class="block"></div>
									<div class="block"></div>
									<div class="block"></div>
									<div class="block"></div>
									<div class="block"></div>							
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
		
		var city = "Seoul";
		var apiURI = "http://apidev.accuweather.com/locations/vl/search?1="+city + "apikey=0vOPJYcq2olPQTOyt2CQyH6bONtPNXjT";
		
	        $.ajax({
	            url: apiURI,
	            dataType: "json",
	            type: "GET",
	            async: "false",
	            success: function(resp) {
	                console.log(resp);
           
	            }
	        })
	    
			
	});
	
	
	</script>
</body>
</html>
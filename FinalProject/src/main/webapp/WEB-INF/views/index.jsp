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
	<c:import url="common/header.jsp"/>
	<script>
		$(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/community/notice/getListData.do",
				success:function(data){
					console.log("공지사항 가져오기 ajax 성공");
					var result = "";
						
					if(data.length == 0){
						result += "<tr style='height:200px'><td align='center'>";
						result += "<span>불러온 데이터가 없습니다.</span>"
						result += "<tr><td>";
					}else{
						for(var i = 0 ; i < data.length; i++){
							result += "<tr><td>";
							result += "<a href='${pageContext.request.contextPath}/community/free/freeView.do?bno=" + data[i]['no'] + "'>" + data[i]['title'] + "</a>";
							result += "</td></tr>";
						}
					}
					
					$("#noticeTable").append(result);
				},error : function(data){
					console.log("공지사항 가져오기 ajax error");	
				},complete : function(){
					$("#loadingNotice").hide();
				}
			});
			
			$.ajax({
				url : "community/free/getListData.do",
				success:function(data){
					console.log("자유게시판 가져오기 ajax 성공");
					var result = "";
					
					if(data.length == 0){
						result += "<tr style='height:200px'><td align='center'>";
						result += "<span>불러온 데이터가 없습니다.</span>"
						result += "<tr><td>";
					}else{
						for(var i = 0 ; i < data.length; i++){
							result += "<tr><td>";
							result += "<a href='${pageContext.request.contextPath}/community/free/freeView.do?bno=" + data[i]['no'] + "'>" + data[i]['title'] + "</a>";
							result += "</td></tr>";
						}
					}
					
					$("#freeTable").append(result);
				},error : function(data){
					console.log("자유게시판 가져오기 ajax error");
				},complete : function(){
					$("#loadingFree").hide();
				}
			});
			
			$.ajax({
				url : "sale/group/getListData.do",
				success:function(data){
					console.log("공동구매 가져오기 ajax 성공");
					var result = "";
					
					if(data.length == 0){
						result += "<tr style='height:200px'><td align='center'>";
						result += "<span>불러온 데이터가 없습니다.</span>"
						result += "<tr><td>";
					}else{
						for(var i = 0 ; i < data.length; i++){
							result += "<tr><td>";
							result += "<a href='${pageContext.request.contextPath}/sale/group/groupView.do?boardNo=" + data[i]['no'] + "'>" + data[i]['title'] + "</a>";
							result += "</td></tr>";
						}
					}
					
					$("#groupTable").append(result);
				},error : function(data){
					console.log("공동구매 가져오기 ajax error");
				},complete : function(){
					$("#loadingGroup").hide();
				}
			});
			
			$.ajax({
				url : "business/ad/getAd.do",
				data : { adPage : "main",
					adSection : "main",
					adLocation : "하단"},
				success : function(data){
					console.log("메인 광고 ajax 성공");
					console.log(data);
					
					if(data == ""){
						$(".ad-main").css("width", "1126px").css("height", "100%").attr("background-position", "center")
						.css("background-repeat", "no-repeat").css("background-size", "cover").css("margin-left", "auto")
						.css("margin-right", "auto");
						$(".ad-main").css("background-image", 'url("${pageContext.request.contextPath}/resources/upload/ad/1200x120.png")');
						
						$(".ad-main").attr("onclick", "window.open('" + "http://www.iei.or.kr/main/main.kh" + "');");
					}else{
						$(".ad-main").css("width", "1126px").css("height", "100%").attr("background-position", "center")
						.css("background-repeat", "no-repeat").css("background-size", "cover").css("margin-left", "auto")
						.css("margin-right", "auto");
						$(".ad-main").css("background-image", 'url("${pageContext.request.contextPath}/resources/upload/ad/1200x120.png")');						
					}
				}, error : function(error){
					console.log("메인 광고 ajax 에러");
					$(".ad-main").css("width", "1126px").css("height", "100%").attr("background-position", "center")
					.css("background-repeat", "no-repeat").css("background-size", "cover").css("margin-left", "auto")
					.css("margin-right", "auto");
					$(".ad-main").css("background-image", 'url("${pageContext.request.contextPath}/resources/upload/ad/1200x120.png")');
				}
			});
		});
	</script>
</head>
<body>
	<%-- <input type="text" name="msg" value="${model.msg}"/> --%>
	<c:import url="common/menubar.jsp"/>
	<div class="wrap_inner">
		<main id="container">
			<section>
				<div class="section-left">
				<!-- <a href="test/select.do">select test</a> -->
				</div>
				
				<div class="section-center">
					<div class="dc-content">
						<div class="dc-content-box">
							<h4>
								<span class="board-title">공지 게시판</span>
							</h4>
							<hr />
							<table class="table">
								<tbody id="noticeTable">
									<div id="loadingNotice" style="background-image: url(${pageContext.request.contextPath}/resources/images/loading.gif);width:250px;height:250px"/>
								</tbody>
							</table>
						</div>
						<div class="dc-ad-box" style="border:1px solid #f1f3f6;height:100px;margin:10px">
							<!-- <h1>메인 광고(AD)</h1> -->
							<div class="ad-main">
								<img id="ad-main-img" src="" alt="" />
							</div>
						</div>
						
						<div class="dc-content-box">
							<h4>
								<span class="board-title">자유 게시판</span>
							</h4>
							<hr />
							<table class="table">
								<tbody id="freeTable">
									<div id="loadingFree" style="background-image: url(${pageContext.request.contextPath}/resources/images/loading.gif);width:250px;height:250px"/>							
								</tbody>
							</table>
						</div>
						
						<div class="dc-content-box">
							<h4>
								<span class="board-title">공동구매 게시판</span>
							</h4>
							<hr />
							<table class="table">
								<tbody id="groupTable">
									<div id="loadingGroup" style="background-image: url(${pageContext.request.contextPath}/resources/images/loading.gif);width:250px;height:250px"/>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="section-right">
					<c:import url="common/rightSection.jsp"/>
				</div>
			</section>
		</main>
	</div>
	<c:import url="common/footer.jsp"/>
	
	
	<script>
		$(".adimg").click(function(){
			$(".adimg").attr("src", "${pageContext.request.contextPath}/resources/images/adimg2.jpg");
		});
	</script>
</body>
</html>
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
						result += "<tr style='height:200px'><td align='center' style='vertical-align:middle;'>";
						result += "<span>불러온 데이터가 없습니다.</span>"
						result += "</tr></td>";
					}else{
						for(var i = 0 ; i < data.length; i++){
							result += "<div class='dc-tb-row'>";
							result += "<span><a href='${pageContext.request.contextPath}/community/free/freeView.do?bno=" + data[i]['no'] + "'>" + data[i]['title'] + "</a></span>";
							result += "</div>";
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
						result += "<tr style='height:200px'><td align='center' style='vertical-align:middle;'>";
						result += "<span>불러온 데이터가 없습니다.</span>"
						result += "</tr></td>";
					}else{
						for(var i = 0 ; i < data.length; i++){
							result += "<div class='dc-tb-row'>";
							result += "<span><a href='${pageContext.request.contextPath}/community/free/freeView.do?bno=" + data[i]['no'] + "'>" + data[i]['title'] + "</a></span>";
							result += "</div>";
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
						result += "<tr style='height:200px'><td align='center' style='vertical-align:middle;'>";
						result += "<span>불러온 데이터가 없습니다.</span>"
						result += "</tr></td>";
					}else{
						for(var i = 0 ; i < data.length; i++){
							result += "<div class='dc-tb-row'>";
							result += "<span><a href='${pageContext.request.contextPath}/sale/group/groupView.do?boardNo=" + data[i]['no'] + "'>" + data[i]['title'] + "</a></span>";
							result += "</div>";
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
						$(".ad-main").css("width", "798px").css("height", "100%").attr("background-position", "center")
						.css("background-repeat", "no-repeat").css("background-size", "cover").css("margin-left", "auto")
						.css("margin-right", "auto");
						$(".ad-main").css("background-image", 'url("${pageContext.request.contextPath}/resources/upload/ad/1200x120.png")');
						
						$(".ad-main").attr("onclick", "window.open('" + "http://www.iei.or.kr/main/main.kh" + "');");
					}else{
						$(".ad-main").css("width", "798px").css("height", "100%").attr("background-position", "center")
						.css("background-repeat", "no-repeat").css("background-size", "cover").css("margin-left", "auto")
						.css("margin-right", "auto");
						$(".ad-main").css("background-image", 'url("${pageContext.request.contextPath}/resources/upload/ad/1200x120.png")');						
					}
				}, error : function(error){
					console.log("메인 광고 ajax 에러");
					$(".ad-main").css("width", "798px").css("height", "100%").attr("background-position", "center")
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
							<div class="dc-con-title">
								<h4>
									<span class="board-title">공지 게시판</span>
								</h4>
							</div>
							<div class="dc-con-content">
								<div class="dc-tb">
									<div class="dc-tb-head">
										<div class="dc-tb-row">
											<!-- head -->
										</div>										
									</div>
									<div id="noticeTable" class="dc-tb-body">
										<div class="dc-tb-row">
											<div id="loadingNotice" style="background-image: url(${pageContext.request.contextPath}/resources/images/loading.gif);width:250px;height:250px"/>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
						
							<div class="dc-ad-box" style="height:100px;">
								<!-- <h1>메인 광고(AD)</h1> -->
								<div class="ad-main">
									<img id="ad-main-img" src="" alt="" />
								</div>
							</div>
							
						<div class="dc-content-box">
							<div class="dc-con-title">
								<h4>
									<span class="board-title">자유 게시판</span>
								</h4>
							</div>
							
							<div class="dc-con-content">
								<table class="table">
									<tbody id="freeTable">
										<div id="loadingFree" style="background-image: url(${pageContext.request.contextPath}/resources/images/loading.gif);width:250px;height:250px"/>							
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="dc-content-box">
							<div class="dc-con-title">
								<h4>
									<span class="board-title">공동구매 게시판</span>
								</h4>							
							</div>
							
							<div class="dc-con-content">
								<table class="table">
									<tbody id="groupTable">
										<div id="loadingGroup" style="background-image: url(${pageContext.request.contextPath}/resources/images/loading.gif);width:250px;height:250px"/>
									</tbody>
								</table>							
							</div>
						</div>
						
						<div class="dc-content-box">
							<div class="dc-con-title">
								<h4>
									<span class="board-title">테스트 게시판</span>
								</h4>							
							</div>
							
							<div class="dc-con-content">
								<div class="dc-tb">
									<div class="dc-tb-head">
										<div class="dc-tb-row">
											<!-- head -->
										</div>										
									</div>
									<div class="dc-tb-body">
										<c:forEach begin="1" end="10">
											<div class="dc-tb-row">
												<span><strong>[공지]</strong> 여러분 오늘 미세먼지가 매우 심합니다. 아이들 외출 자제해주세요. 좋은하루 되세요 ^_____^</span>
											</div>
										</c:forEach>
									</div>
								</div>							
							</div>
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
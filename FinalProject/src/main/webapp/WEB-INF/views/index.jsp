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
	<style>
	div#header-container{
		padding : 35px;
	}
	</style>
	<script>
		$(function(){
			$.ajax({
				url : "business/ad/getAd.do",
				data : { adPage : "main",
					adSection : "main",
					adLocation : "하단"},
				success : function(data){
					console.log("메인 광고 ajax 성공");
					console.log(data);
					
					if(data == ""){
/* 						$(".ad-main").css("width", "798px").css("height", "100%").attr("background-position", "center")
						.css("background-repeat", "no-repeat").css("background-size", "cover").css("margin-left", "auto")
						.css("margin-right", "auto");
						$(".ad-main").css("background-image", 'url("${pageContext.request.contextPath}/resources/upload/ad/main2.png")'); */
						
						$("#ad-main-img").attr("src","${pageContext.request.contextPath}/resources/upload/ad/main2.jpg");
						$("#ad-main-img2").attr("src","${pageContext.request.contextPath}/resources/upload/ad/main1.jpg");
						
						$(".ad-main").attr("onclick", "window.open('" + "http://www.iei.or.kr/main/main.kh" + "');");
					}else{
						$(".ad-main").css("width", "798px").css("height", "100%").attr("background-position", "center")
						.css("background-repeat", "no-repeat").css("background-size", "cover").css("margin-left", "auto")
						.css("margin-right", "auto");
						$(".ad-main").css("background-image", 'url("${pageContext.request.contextPath}/resources/upload/ad/lostark.jpg")');						
					}
				}, error : function(error){
					console.log("메인 광고 ajax 에러");
					$(".ad-main").css("width", "798px").css("height", "100%").attr("background-position", "center")
					.css("background-repeat", "no-repeat").css("background-size", "cover").css("margin-left", "auto")
					.css("margin-right", "auto");
					$(".ad-main").css("background-image", 'url("${pageContext.request.contextPath}/resources/upload/ad/lostark.jpg")');
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
										<c:if test="${!empty noticeList}">
											<c:forEach items="${noticeList}" var="item">
												<div class="dc-tb-row">
													<a href="${pageContext.request.contextPath}/community/notice/noticeView.do?bno=${item.no}">● <strong>[${item.boardType}] </strong><span>${item.title}</span></a>
												</div>
											</c:forEach>
										</c:if>
										
										<c:if test="${empty noticeList}">
											<div class="dc-none-data">
												<div align="center">
													<span>게시물 없음</span>
												</div>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<br>
							<div class="dc-ad-box" style="height:100px;">
								<!-- <h1>메인 광고(AD)</h1> -->
								<div class="ad-main">
									<img id="ad-main-img" src="" alt="" width="798px" height="100px" />
								</div>
							</div>
							
							<br>
						<div class="dc-content-box">
							<div class="dc-con-title">
								<h4>
									<span class="board-title">자유 게시판</span>
								</h4>
							</div>
							
							<div class="dc-con-content">
								<div class="dc-tb">
									<div class="dc-tb-head">
										<div class="dc-tb-row">
											<!-- head -->
										</div>										
									</div>
									<div id="freeTable" class="dc-tb-body">
										<c:if test="${!empty freeList}">
											<c:forEach items="${freeList}" var="item">
												<div class="dc-tb-row">
													<a href="${pageContext.request.contextPath}/community/free/freeView.do?bno=${item.no}">● <span>${item.title}</span></a>
												</div>
											</c:forEach>
										</c:if>
										<c:if test="${empty freeList}">
											<div class="dc-none-data">
												<div align="center">
													<span>게시물 없음</span>
												</div>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						
						<br>
						<div class="dc-content-box">
							<div class="dc-con-title">
								<h4>
									<span class="board-title">공동구매 게시판</span>
								</h4>							
							</div>
							
							<div class="dc-con-content">
								<div class="dc-tb">
									<div class="dc-tb-head">
										<div class="dc-tb-row">
											
										</div>					
									</div>
									<div id="groupTable" class="dc-tb-body" style="">
										<div id="main-img-list" class="main-img-list">
											<c:if test="${!empty groupList}">
												<c:forEach items="${groupList}" var="item">
													<div class="main-img-div">
														<a href="/dc/sale/group/groupView.do?boardNo=${item.boardNo}">
															<span>
																<%-- <img src="${item.thumbnail}" width="190"/> --%>
																<img src="https://wstatic.dcinside.com/main/main2011/2019/01/10/3731839588_a4c4449a.jpg_s" width="190"/>
															</span>
															<div class="img-text">
																<strong>${item.title}</strong><br />
																<span>${item.goodsCategory }</span>
															</div>
													</a></div>
												</c:forEach>
											</c:if>
											<c:if test="${empty groupList}">
												<div class="dc-none-data">
													<div align="center">
														<span>게시물 없음</span>
													</div>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="dc-ad-box" style="height:100px;">
								<!-- <h1>메인 광고(AD)</h1> -->
								<div class="ad-main">
									<img id="ad-main-img2" src="" alt="" width="798px" height="100px" />
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
												<a href="#">● <span><strong>[공지]</strong> 여러분 오늘 미세먼지가 매우 심합니다. 아이들 외출 자제해주세요. 좋은하루 되세요 ^_____^</span></a>
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
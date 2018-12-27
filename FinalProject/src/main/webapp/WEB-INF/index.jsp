<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hello Spring</title>
	<c:import url="views/common/header.jsp"/>
	<script>
		$(function(){
			$.ajax({
				url : "community/free/getListData.do",
				success:function(data){
					console.log("ajax 성공");
					console.log(data);
					
					$("#noticeTable").append(data);
				},error : function(data){
					console.log("ajax error");	
				},complete : function(){
					$("#loadingNotice").hide();
				}
			});
			
			$.ajax({
				url : "community/free/getListData.do",
				success:function(data){
					$("#freeTable").append(data);
				},error : function(data){
					console.log("ajax error");	
				},complete : function(){
					$("#loadingFree").hide();
				}
			});
		});
	</script>
</head>
<body>
	<%-- <input type="text" name="msg" value="${model.msg}"/> --%>
	<c:import url="views/common/menubar.jsp"/>
	<div class="wrap_inner">
		<main id="container">
			<section>
				<div class="section-left">
				<!-- <a href="test/select.do">select test</a> -->
				</div>
				
				<div class="section-center">
					<div class="dc-content">
						<div class="dc-content-box">
							<h1>공지 게시판</h1>
							<hr />
							<table class="table table-striped">
								<tbody id="noticeTable">
									<div id="loadingNotice" style="background-image: url(${pageContext.request.contextPath}/resources/images/loading.gif);width:250px;height:250px"/>
								</tbody>
							</table>
						</div>
						<div class="dc-ad-box" style="border:1px solid black;height:100px;margin:10px">
							<h1>메인 광고(AD)</h1>
						</div>
						
						<div class="dc-content-box">
							<h1>자유 게시판</h1>
							<hr />
							<table class="table table-striped">
								<tbody id="freeTable">
									<div id="loadingFree" style="background-image: url(${pageContext.request.contextPath}/resources/images/loading.gif);width:250px;height:250px"/>							
								</tbody>
							</table>
						</div>
						
						<div class="dc-content-box">
							<h1>거래 게시판</h1>
							<hr />
							<table class="">
								<tbody id="saleTable">
									<div id="loadingSale" style="background-image: url(${pageContext.request.contextPath}/resources/images/loading.gif);width:250px;height:250px"/>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="section-right">
					<c:import url="views/common/rightSection.jsp"/>
				</div>
			</section>
		</main>
	</div>
	<c:import url="views/common/footer.jsp"/>
	
	
	<script>
		$(".adimg").click(function(){
			$(".adimg").attr("src", "${pageContext.request.contextPath}/resources/images/adimg2.jpg");
		});
	</script>
</body>
</html>
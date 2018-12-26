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
				url : "community/free/getList.do",
				success:function(data){
					console.log("ajax 성공");
					console.log(data);
					alert(data);
				},error : function(data){
					console.log("ajax error");	
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
					<img class="adimg" src="${pageContext.request.contextPath}/resources/images/adimg1.jpg" 
					alt="메인_좌측_세로배너" width="140" height="800"
					style="margin-left: 1px;margin-right: 1px; margin-top:60px; margin-bottom:60px;
					border:1px solid red"/>
				</div>
				
				<div class="section-center">
					<div class="dc-content">
						<%-- <div class="dc-table table-striped">
							<div class="dc-table-row dc-table-header">
								<div class="dc-table-col">#</div>
								<div class="dc-table-col">First</div>
								<div class="dc-table-col">Last</div>
								<div class="dc-table-col">Handle</div>
							</div>
							<c:forEach begin="1" end="20">
							<div class="dc-table-row">
								<div class="dc-table-col">
									<h3>첫번째열</h3>
								</div>
								<div class="dc-table-col">
									<h3>두번쨰열</h3>
								</div>
								<div class="dc-table-col">
									<h3>세번째열</h3>
								</div>
								<div class="col">
									<h3>네번째열</h3>
								</div>
							</div>
							</c:forEach>
						</div> --%>
						<div class="dc-content-box">
							<h1>공지 게시판${serverTime}</h1>
							<hr />
							<table>
								<tbody>
								<c:forEach begin="1" end="10">
									<tr>
										<td>첫번째열</td>
										<td>두번째열</td>
										<td>세번째열</td>
										<td>네번째열</td>
									</tr>								
								</c:forEach>
								</tbody>
							</table>
						</div>
						
						<div class="dc-content-box">
							<h1>자유 게시판</h1>
							<hr />
							<table>
								<tbody>
									<tr>
										<td>첫번째열</td>
										<td>두번째열</td>
										<td>세번째열</td>
										<td>네번째열</td>
									</tr>								
								</tbody>
							</table>
						</div>
						
						<div class="dc-content-box">
							<h1>거래 게시판</h1>
							<hr />
							<table>
								<tbody>
									<tr>
										<td>첫번째열</td>
										<td>두번째열</td>
										<td>세번째열</td>
										<td>네번째열</td>
									</tr>								
								</tbody>
							</table>
						</div>
						
						<div class="dc-content-box">
							<h1>정보 게시판</h1>
							<hr />
							<table>
								<tbody>
									<tr>
										<td>첫번째열</td>
										<td>두번째열</td>
										<td>세번째열</td>
										<td>네번째열</td>
									</tr>								
								</tbody>
							</table>
						</div>
						
						
					</div>
				</div>
				
				<div class="section-right">
						<img class="adimg" src="${pageContext.request.contextPath}/resources/images/adimg1.jpg" 
						alt="메인_우측_세로배너" width="140" height="800"
						style="margin-left: 1px;margin-right: 1px; margin-top:60px; margin-bottom:60px;
						border:1px solid red"/>
	<!-- 				<div class="section-item">
						item1
					</div>
					<div class="section-item">
						item2
					</div>
					<div class="section-item">
						item3
					</div>
					<div class="section-item">
						item4
					</div> -->
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
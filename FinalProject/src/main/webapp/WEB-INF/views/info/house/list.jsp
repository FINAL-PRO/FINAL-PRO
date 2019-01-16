<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부동산</title>
<c:import url="../../common/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/info/house/dc-info-house.css" />
</head>
<body>

	<c:import url="../../common/menubar.jsp" />
	<div class="wrap_inner">
		<main id="container">
		<section>
			<div class="section-left">
				<!-- 내용없음 -->
			</div>

			<div class="section-center">
				<div class="dc-content">
					<div class="dc-content-title">
						<span class="dc-list-title">부동산 리스트</span>
						<button class="btn dc-btn dc-btn-right" onclick="insertHouse();">글쓰기</button>
					</div>
					<div class="dc-content-box">
						<div style="display:block">

						<c:forEach items="${list}" var="house" varStatus="hvs">
							<li id="hlist" class="" style="padding-left: 10px; padding-top: 10px;">
								<a onclick="selectHouse(${house.boardNo})" href="#">
									<div class="dc-house-item-box">
										<div class="dc-house-thumbnail">
											<img src="${house.houseImg}" id="" alt="" width="200px" height="220px"/>
										</div>
										<div class="dc-house-description">
											<strong class="name"> 
												<span>${house.title}</span>
											</strong>
											<ul>
												<li>
													<strong>
														<span>크기 </span> :
													</strong> 
														<span>${house.area }</span> <br>
													<strong>
														<span>매매가 </span> :
													</strong> 
													<span>${house.minprice} &nbsp;원</span> <br> 
													<span>${house.hType} &nbsp;/&nbsp; ${house.dealType}</span>
												</li>
											</ul>
										</div>
									</div>
								</a>
							</li>
						</c:forEach>
						</div>
					</div>
					
				</div>
			</div>

			<div class="section-right">
				<c:import url="../../common/rightSection.jsp" />
			</div>

		</section>
		</main>
	</div>
	<c:import url="../../common/footer.jsp" />

	<script>
		function selectHouse(no){
			location.href="${pageContext.request.contextPath}/info/house/view.do?no="+no;
		}
		
		function insertHouse(){
			location.href="${pageContext.request.contextPath}/info/house/insert/view.do";
		}
	</script>
</body>
</html>
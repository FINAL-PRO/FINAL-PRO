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
						<span class="dc-title-text">부동산</span>
						<br />
					</div>
					<div class="dc-content-box">
						<div class="form-inline">
							<div style="width:50%">
							<select id="dealType" name="dealType" class="form-control">
								<c:forEach items="${dealList}" var="deal">
								<option value="${deal.id}"
								<c:if test="${dealType eq deal.id}">selected</c:if>
									>${deal.value}</option>
								</c:forEach>
							</select>
							<select id="hType" name="hType" class="form-control">
								<c:forEach items="${roomList}" var="room">
									<option value="${room.id}"
										<c:if test="${hType eq room.id}">selected</c:if>
									>${room.value}</option>
								</c:forEach>
							</select>
							<select name="" id="" class="form-control">
								<option value="">크기</option>
							</select>
							<select name="" id="" class="form-control">
								<option value="">가격</option>
							</select>
							</div>
							<div style="width:50%">
								<button class="btn dc-btn dc-btn-right" onclick="insertHouse();">글쓰기</button>
							</div>
						</div>
						
						<br />
					
						<div style="display:block">
							<c:if test="${!empty list}">
								<c:forEach items="${list}" var="house" varStatus="hvs">
									<li id="hlist" class="" style="padding-left: 10px; padding-top: 10px;">
										<a onclick="selectHouse(${house.boardNo})" href="#">
											<div class="dc-house-item-box">
												<div class="dc-house-thumbnail">
													<img src="${house.houseImg}" id="" alt="" width="200px" height="220px"/>
												</div>
												<div class="dc-house-description">
													<strong class="name"> 
														<span>${fn:substring(house.title, 0, 10)}..</span>
													</strong>
													<ul>
														<li>
															<strong>
																<span>크기 </span> :
																<span>${house.area } ㎡</span> <br>
															</strong>
															<strong>
																<span>가격 </span> :
																<span><fmt:formatNumber value="${house.minprice }" pattern="#,###" />원</span> <br> 
																<%-- <span>${house.hType} &nbsp;/&nbsp; ${house.dealType}</span> --%>
															</strong>
														</li>
													</ul>
												</div>
											</div>
										</a>
									</li>
								</c:forEach>
							</c:if>
							<c:if test="${empty list}">
								<div class="dc-none-data">
									<span class="dc-none-data-text">데이터가 없습니다.</span>
								</div>
							</c:if>
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
	$(function(){
		$("#hType").on('change',function() {
			location.href = "${pageContext.request.contextPath}/info/house/list.do?hType="
				+ $("#hType").val() + "&dealType=" + $("#dealType").val();
		});
		
		$("#dealType").on('change',function() {
			location.href = "${pageContext.request.contextPath}/info/house/list.do?hType="
				+ $("#hType").val() + "&dealType=" + $("#dealType").val();
		});
	});
		function selectHouse(no){
			location.href="${pageContext.request.contextPath}/info/house/view.do?no="+no;
		}
		
		function insertHouse(){
			location.href="${pageContext.request.contextPath}/info/house/insert/view.do";
		}
	</script>
</body>
</html>
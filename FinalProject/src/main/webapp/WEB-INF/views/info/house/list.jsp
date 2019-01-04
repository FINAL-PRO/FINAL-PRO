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

<style>
* {
	list-style-type: none;
}

li {
	float: left;
	display: block;
	padding: 1px;
	margin: 0px;
	padding: 0px;
}

ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}
</style>
<c:import url="../../common/header.jsp" />
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
						<h1>부동산 리스트</h1>
					</div>
					<div class="dc-content-box">
						<div display="block">
						<c:forEach items="${list}" var="house" varStatus="hvs">
							<li id="hlist" class="" style="padding-left: 10px; padding-top: 10px;">
								<div class="item_box"
									style="width: 220px; height: 355px; border: 1px solid gray; margin-left: auto; margin-right: auto;">

									<div class="thumbnail"
										style="width: 200px; height: 220px; border: 1px solid gray; margin-left: auto; margin-right: auto; margin-top: 12px;">
										<a onclick="selectHouse(${house.boardNo})"><img src=""
											id="" alt="" />img 삽입될 곳</a> <span class="wish"></span>
										<div class="button"></div>
									</div>
									<div style="height: 5px"></div>
									<div class="description"
										style="width: 200px; height: 100px; border: 1px solid gray; margin-left: auto; margin-right: auto;">
										<strong class="name"> 
											<a href="${pageContext.request.contextPath}/info/house/selectOne.do?no=${house.boardNo}" class=""> 
												<span style="font-size: 12px; color: #555555;">${house.title}</span>
											</a>
										</strong>
										<ul class="">
											<li class=" xans-record-">
												<strong class="">
													<span style="font-size: 12px; color: #333333;">크기 </span> :
												</strong> 
													<span style="font-size: 12px; color: #333333;">${house.area }</span> <br>
												<strong class="">
													<span style="font-size: 12px; color: #333333;">매매가 </span> :
												</strong> 
												<span style="font-size: 12px; color: #333333;">${house.minprice} &nbsp;원</span> <br> 
												<span style="font-size: 12px; color: #999999;">${house.hType} &nbsp;/&nbsp; ${house.dealType}</span>
											</li>
										</ul>
									</div>
								</div>
							</li>
						</c:forEach>
						</div>
						<button onclick="insertHouse();">글쓰기</button>
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
			location.href="${pageContext.request.contextPath}/info/house/selectOne.do?no="+no;
		}
		
		function insertHouse(){
			location.href="${pageContext.request.contextPath}/info/house/insertHouseV.do";
		}
	</script>
</body>
</html>
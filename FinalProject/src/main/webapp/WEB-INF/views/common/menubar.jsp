<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
			<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
<!DOCTYPE html>
<header>
	<style>
	 #searchWord{
	 	border: 3px solid green;
	 }
	</style>
	<div id="header-container">
		<div class="header_top" style="display:block;">
			<div class="header_logo" style="display:inline-block;">				
					<div>
					<a class="navbar-brand" href="/dc">
						<h2>DONGKER IMG</h2> <%-- <img src="${pageContext.request.contextPath }/resources/images/test-img.png" alt="로고" width="50px" /> --%>
					</a> 
					</div>
			</div>
			<div class="header_search" style="display:inline-block; width: 40%">
				<form class="" action="${pageContext.request.contextPath}/search/searchView.do?">
					<input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요.">
				</form>
			</div>
		</div>
	</div>
	
	<div class="dc-menubar">
		<div class="dc-manebar-main" style="width: 1080px; margin: 0 auto;">
			<nav class="navbar navbar-expand-lg">
				<%-- <a class="navbar-brand" href="/dc">
					<img src="${pageContext.request.contextPath }/resources/images/test-img.png" alt="로고" width="50px" />
				</a> --%>
				<!-- 반응형으로 width 줄어들경우, collapse버튼관련 -->
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<!-- ul.mr-auto 설정이 없으면, 좌우정렬이 안됨 -->
					<ul class="navbar-nav mr-auto">
						<li class="nav-item dropdown dc-user-menu"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span>커뮤니티</span> 
							<i class="fa fa-heart"></i>
							</a>
							<div class="dropdown-menu dc-user-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/community/notice/list.do"><span>공지</span></a>
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/community/free/list.do"><span>자유게시판</span></a>
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/community/food/list.do"><span>맛집</span></a>
							</div></li>
						<!--https://getbootstrap.com/docs/4.1/components/navbar/#supported-content-->
						<li class="nav-item dropdown dc-user-menu"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span>거래</span></a>
							<div class="dropdown-menu dc-user-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/sale/used/list.do"><span>중고
									거래</span></a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/sale/group/list.do"><span>공동
									구매</span></a>
							</div></li>
						<li class="nav-item dropdown dc-user-menu"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span>정보</span> </a>
							<div class="dropdown-menu dc-user-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/info/region/list.do"><span>지역정보</span></a>
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/info/weather/list.do"><span>날씨</span></a>
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/info/house/list.do"><span>부동산</span></a>
							</div></li>
						<li class="nav-item dropdown dc-user-menu"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span>구인 / 구직 </span></a>
							<div class="dropdown-menu dc-user-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/job/jobBoard/jobBoardList.do"><span>구인구직</span></a>
							</div></li>
						<li class="nav-item dropdown dc-admin-menu">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span>제휴 / 광고 </span></a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/business/partnership/list.do"><span>제휴 신청</span></a> 
									<a class="dropdown-item" href="${pageContext.request.contextPath}/business/ad/list.do"><span>광고 신청</span></a>
								</div>
							</sec:authorize>
						</li>
						
						<li class="nav-item dc-admin-menu">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<a class="nav-link" href="${pageContext.request.contextPath}/admin/index.do?no=${member.no}"> <span>관리자 페이지 </span></a>
							</sec:authorize>
						</li>
					</ul>
					
				</div>
			</nav>
		</div>
	</div>
	
	<script>
	$(function() {
	    $(document).ajaxSend(function(e, xhr, options) {
	    	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    });
	});
	</script>
</header>
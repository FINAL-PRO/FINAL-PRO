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
	<div id="header-container">
		<div class="header_top">

			<div class="header_search">

				<div class="search_div">
					<a class="navbar-brand" href="/dc">
						<h2>DONGKER IMG</h2> <%-- <img src="${pageContext.request.contextPath }/resources/images/test-img.png" alt="로고" width="50px" /> --%>
					</a> <span class="search_span"> <input type="text"
						class="serarh_text" placeholder="" />
					</span>
					<span id="msg-container">

					</span>
				</div>
			</div>
		</div>
	</div>
	<div class="dc-menubar">
		<div class="dc-manebar-main" style="width: 1450px; margin: 0 auto;">
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
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 커뮤니티 
							<i class="fa fa-heart"></i>
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/community/notice/list.do">공지</a>
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/community/free/list.do">자유게시판</a>
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/community/food/list.do">맛집</a>
							</div></li>
						<!--https://getbootstrap.com/docs/4.1/components/navbar/#supported-content-->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 거래 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/sale/used/list.do">중고
									거래</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/sale/group/list.do">공동
									구매</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 정보 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/info/region/list.do">지역정보</a>
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/info/weather/list.do">날씨</a>
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/info/house/list.do">부동산</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 구인 / 구직 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/job/jobBoard/jobBoardList.do">구인구직</a>
							</div></li>
						<li class="nav-item dropdown">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 제휴 / 광고 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/business/partnership/list.do">제휴 신청</a> 
									<a class="dropdown-item" href="${pageContext.request.contextPath}/business/ad/list.do">광고 신청</a>
								</div>
							</sec:authorize>
						</li>
						
						<li class="nav-item">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<a class="nav-link" href="${pageContext.request.contextPath}/admin/index.do?no=${member.no}"> 관리자 페이지 </a>
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
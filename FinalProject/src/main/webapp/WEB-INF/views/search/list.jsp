<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/search/dc-search.css" />
<title>동커</title>
<c:import url="../common/header.jsp" />
</head>
<body>
	<c:import url="../common/menubar.jsp" />
	<div class="wrap_inner">
		<main id="container">
		<section>
			<div class="section-left">
				<!-- 내용없음 -->
			</div>

			<div class="section-center">
				<div class="dc-content">
					<div class="dc-content-title"></div>
					<div class="dc-content-box">
						<div id="search-result-list">	
						<h4>"${searchWord}" 에 대한 검색 결과</h4>					
						<c:set value="${searchResultList}" var="result" />
					    <c:if test="${!empty result}" >
							<c:forEach items="${result}" var="result" varStatus="">
							<div id="result" style="padding:10px; margin: 20px 0px 20px 0px;">
							<c:choose>
						    	<c:when test = "${result.boardType eq '자유게시판'}">
						        	<a class="resultTitle" href="${pageContext.request.contextPath}/community/free/freeView.do?bno=${result.no}">[${result.boardType}] ${result.title}</a>
						        </c:when>
								<c:when test = "${result.boardType eq '맛집'}">
									<a class="resultTitle" href="${pageContext.request.contextPath}/community/food/foodView.do?bno=${result.no}">[${result.boardType}] ${result.title}</a>
								</c:when>
								<c:when test = "${result.boardType eq '공동구매'}">
									<a class="resultTitle" href="${pageContext.request.contextPath}/sale/group/view.do?boardNo=${result.no}">[${result.boardType}] ${result.title}</a>
								</c:when>
								<c:when test = "${result.boardType eq '중고거래'}">
									<a class="resultTitle" href="${pageContext.request.contextPath}/sale/used/view.do?boardNo=${result.no}">[${result.boardType}] ${result.title}</a>
								</c:when>
								<c:when test = "${result.boardType eq '지역정보'}">
									<a class="resultTitle" href="${pageContext.request.contextPath}/info/region/view.do?no=${result.no}">[${result.boardType}] ${result.title}</a>
								</c:when>
								<c:when test = "${result.boardType eq '부동산'}">
									<a class="resultTitle" href="${pageContext.request.contextPath}/info/house/view.do?no=${result.no}">[${result.boardType}] ${result.title}</a>
								</c:when>
								<c:when test = "${result.boardType eq '구인구직'}">
									<a class="resultTitle" href="${pageContext.request.contextPath}/job/jobBoard/jobBoardDetail.do?no=${result.no}">[${result.boardType}] ${result.title}</a>
								</c:when>							                	
							</c:choose>
							<p id="resultContent">
								<c:choose>
								<c:when test="${empty result.content}">내용 없음</c:when>
								<c:when test="${!empty result.content}">${result.content}</c:when>
								</c:choose>
							</p>
								<a href="#" id="resultMemberName">${result.memberName}</a> &nbsp;&nbsp;&nbsp;
								<span id="resultWriteDate">${result.writeDate}</span><br>
							</div>						
							</c:forEach>
						</c:if>
						</div>
						
						<script type="text/javascript">
						
						$(function(){							
							var reg = /${searchWord}/g;
							var searchWord = "${searchWord}";							
							var replaced = $("#search-result-list").html().replace(/${searchWord}/gi, '<b>'+ searchWord +'</b>');
							$("#search-result-list").html(replaced);	
														
						});

						</script>
						
						<c:if test="${empty searchResultList}" >
						<div style="margin-bottom: 10px;">
							<img style="display: inline-block; width: 50px;" src="${pageContext.request.contextPath}/resources/images/search.png"/>
							<h4 style="margin: 30px 10px; font-weight: bold; display: inline-block;">검색 결과가 없습니다.</h4>
						</div>
						
							
							<ul style="list-style-type: square;">
								<li>단어의 철자가 정확한지 확인해 보세요.</li>
								<li>한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.</li>
								<li>검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.</li>
								<li>두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요. </li>
							</ul>
						</c:if>
					</div>
				</div>
			</div>

			<div class="section-right">
				<c:import url="../common/rightSection.jsp" />
			</div>
		</section>
		</main>
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>
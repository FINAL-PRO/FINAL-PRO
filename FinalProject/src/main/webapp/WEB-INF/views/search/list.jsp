<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<c:import url="../common/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/search/dc-search.css" />
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
					<div class="dc-content-title">
						
					</div>
					<div class="dc-content-box">
						<div id="search-result-list">	
						<h3>"${searchWord}" 에 대한 검색 결과</h3>					
						<c:set value="${searchResultList}" var="result" />
					    <c:if test="${!empty result}" >
							<c:forEach items="${result}" var="result" varStatus="">
							<div id="result" style="padding:10px; margin: 20px 0px 20px 0px;">
							<c:choose>
						    	<c:when test = "${result.boardType eq '자유게시판'}">
						        	<a id="resultTitle" href="${pageContext.request.contextPath}/community/free/freeView.do?bno=${result.no}">[${result.boardType}] ${result.title}</a>
						        </c:when>
								<c:when test = "${result.boardType eq '맛집'}">
									<a href="#">${board.title}</a>
								</c:when>
								<c:when test = "${result.boardType eq '공동구매'}">
									<a href="#}">${comment.boardTitle}</a>
								</c:when>
								<c:when test = "${result.boardType eq '중고거래'}">
									<a href="#">${board.title}</a>
								</c:when>
								<c:when test = "${result.boardType eq '부동산'}">
									<a href="#">${board.title}</a>
								</c:when>
								<c:when test = "${result.boardType eq '구인구직'}">
									<a href="#">${board.title}</a>
								</c:when>							                	
							</c:choose>
							<p id="resultContent">
								<c:if test="${empty result.content}">내용 없음</c:if>
								<c:if test="${!empty result.content}">${result.content}</c:if>
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
							<h3>검색 결과가 없습니다.</h3>
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
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
	<c:import url="../../common/header.jsp"/>
</head>
<body>
	<c:import url="../../common/menubar.jsp"/>
	<div class="wrap_inner">
		<main id="container">
			<section>
				<div class="section-left">
					<!-- 내용없음 -->
				</div>
				
				<div class="section-center">
					<div class="dc-content">
						<div class="dc-content-title">
							<h1>광고신청 게시판</h1>
						</div>
						<div class="dc-content-box">
							<form method="post" enctype="multipart/form-data"
								<c:if test="${empty ad}"> action="${pageContext.request.contextPath}/business/ad/insert.do" </c:if>
								<c:if test="${!empty ad}"> action="${pageContext.request.contextPath}/business/ad/update.do" </c:if> >
							<table class="table">
								<tr>
									<td>광고타입</td>
									<td>
										<select name="adType" id="adType" <c:if test="${!empty ad}">disabled</c:if>>
											<c:if test="${!empty ad}">
												<c:forEach items="${adTypeList}" var="code">
													<option value="${code.id}" <c:if test="${code.id eq ad.adContentType}">selected</c:if>>${code.value}</option>
												</c:forEach>											
											</c:if>
											<c:if test="${empty ad}">
												<c:forEach items="${adTypeList}" var="code">
													<option value="${code.id}" <c:if test="${code.id eq adContent}">selected</c:if>>${code.value}</option>
												</c:forEach>											
											</c:if>

										</select>
									</td>
								</tr>
								<tr>
									<td>광고물타입</td>
									<td>
										<select name="adContentType" id="adContentType" <c:if test="${!empty ad}">disabled</c:if>>
											<c:forEach items="${adContentTypeList}" var="code">
												<option value="${code.id}" <c:if test="${code.id eq adContent}">selected</c:if>>${code.value}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>광고 지면</td>
									<td>
										<select name="pageNo" id="" <c:if test="${!empty ad}">disabled</c:if>>
											<c:forEach items="${adPageList}" var="page">
												<option value="${page.no}">${page.name}</option>
											</c:forEach>
										</select>
										<select name="sectionNo" id="" <c:if test="${!empty ad}">disabled</c:if>>
											<c:forEach items="${adSectionList}" var="section">
												<option value="${section.no}">${section.name}</option>
											</c:forEach>
										</select>
										<select name="locationNo" id="" <c:if test="${!empty ad}">disabled</c:if>>
											<c:forEach items="${adLocationList}" var="location">
												<option value="${location.no}">${location.name}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>시작일</td>
									<td>
										<input name="startDate" type="date" required="required" 
										value="<fmt:formatDate value="${ad.startDate}" pattern="yyyy-MM-dd"/>"/>
									</td>
								</tr>	
								<tr>
									<td>종료일</td>
									<td>
										<input name="endDate" type="date" required="required" 
										value="<fmt:formatDate value="${ad.endDate}" pattern="yyyy-MM-dd"/>"/>
									</td>
								</tr>	
								<tr>
									<td>광고물</td>
									<td>
										<c:if test="${empty ad }">
											<input name="adContentPath" type="file" required="required" <c:if test="${!empty ad}">disabled</c:if>/>
										</c:if>
										<c:if test="${!empty ad }">
											<img src="${ad.adContentPath}" alt="" width="200px" height="200px"/>
										</c:if>
									</td>
								</tr>
								<tr>
									<td>연결 페이지</td>
									<td>
										<input name="landingPage" type="text" required="required" 
										value="${ad.landingPage }"/>
										<button type="button" onclick="landingCheck();">랜딩확인</button>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<c:if test="${empty ad}">
											<button type="submit">광고 신청</button>
										</c:if>
										<c:if test="${!empty ad}">
											<button type="submit">광고 수정</button>
										</c:if>
									</td>
								</tr>		
							</table>
							<input type="hidden" name="status" value="ADSTATUS000" />
							<input type="hidden" name="memberNo" value="${member.no}"/>
							</form>
						</div>
					</div>
				</div>
				
				<div class="section-right">
					<c:import url="../../common/rightSection.jsp"/>
				</div>
			</section>
		</main>
	</div>
	<c:import url="../../common/footer.jsp"/>
	
	<script>
		function landingCheck(){
			var url = $("input[name=landingPage]").val();
			
			window.open(url);
		}
	
	</script>
</body>
</html>
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
							<h1>내용</h1>
							<form action="${pageContext.request.contextPath}/business/ad/insert.do" method="post"
								enctype="multipart/form-data">
							<table class="table">
								<tr>
									<td>광고타입</td>
									<td>
										<select name="adType" id="adType">
											<c:forEach items="${adTypeList}" var="code">
												<option value="${code.id}" <c:if test="${code.id eq adContent}">selected</c:if>>${code.value}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>광고물타입</td>
									<td>
										<select name="adContentType" id="adContentType">
											<c:forEach items="${adContentTypeList}" var="code">
												<option value="${code.id}" <c:if test="${code.id eq adContent}">selected</c:if>>${code.value}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>광고 지면</td>
									<td>
										<select name="pageNo" id="">
											<c:forEach items="${adPageList}" var="page">
												<option value="${page.no}">${page.name}</option>
											</c:forEach>
										</select>
										<select name="sectionNo" id="">
											<c:forEach items="${adSectionList}" var="section">
												<option value="${section.no}">${section.name}</option>
											</c:forEach>
										</select>
										<select name="locationNo" id="">
											<c:forEach items="${adLocationList}" var="location">
												<option value="${location.no}">${location.name}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>시작일</td>
									<td>
										<input name="startDate" type="date" />
									</td>
								</tr>	
								<tr>
									<td>종료일</td>
									<td>
										<input name="endDate" type="date" />
									</td>
								</tr>	
								<tr>
									<td>광고물</td>
									<td>
										<input name="adContentPath" type="file" />
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<button type="submit">광고 신청</button>
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
</body>
</html>
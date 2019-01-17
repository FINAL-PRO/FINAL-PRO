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
							<span class="dc-title-text">광고</span>
						</div>
						<div class="dc-content-box">
						<div class="form-inline">
							<div style="width:50%">
								<select id="adContentTypeNo" class="form-control">
									<c:forEach items="${adContentTypeList}" var="code">
										<option value="${code.id}" <c:if test="${code.id eq adContent}">selected</c:if>>${code.value}</option>
									</c:forEach>
								</select>
								<select id="adTypeNo" class="form-control">
									<c:forEach items="${adTypeList}" var="code">
										<option value="${code.id}" <c:if test="${code.id eq adType}">selected</c:if>>${code.value}</option>
									</c:forEach>
								</select>
								<select id="adStatusNo" class="form-control">
									<c:forEach items="${adStatusList}" var="code">
										<option value="${code.id}" <c:if test="${code.id eq adStatus}">selected</c:if>>${code.value}</option>
									</c:forEach>
								</select>
							</div>
							<div style="width:50%">
								<button class="btn dc-btn dc-btn-right" onclick="insertAd();">광고 등록</button>
							</div>			
							</div>
							<br />	
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>신청인</th>
										<th>광고노출위치</th>
										<th>광고타입</th>
										<th>광고물타입</th>
										<th>광고상태</th>
										<th>광고상태 변경</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${!empty adList}">
										<c:forEach items="${adList}" var="ad">
											<tr>
												<td>${ad.no}</td>
												<td>${ad.userName}</td>
												<td>${ad.pageName} / ${ad.sectionName} / ${ad.locationName}</td>
												<td>${ad.adContentType}</td>
												<td>${ad.adType}</td>
												<td>${ad.status}</td>
												<td>
													<div class="form-inline">						
														<select id="adStatus_${ad.no}" class="form-control">
															<c:forEach items="${adStatusList}" var="code">
																<option value="${code.id}" <c:if test="${code.id eq adStatus}">selected</c:if>>${code.value}</option>
															</c:forEach>
														</select>
														<button class="btn dc-btn" onclick="adStatusChange(${ad.no});">변경</button>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty adList}">
										<td colspan="7">
											<div class="dc-none-data">
												<span class="dc-none-data-text">데이터가 없습니다.</span>
											</div>
										</td>
									</c:if>
								</tbody>
							</table>
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
	$("#adContentTypeNo").on('change',function() {
		location.href = "${pageContext.request.contextPath}/business/ad/list.do?adContent="
			+ $("#adContentTypeNo").val() + "&adType=" + $("#adTypeNo").val() + "&adStatus=" + $("#adStatusNo").val();
	});
	
	$("#adTypeNo").on('change',function() {
		location.href = "${pageContext.request.contextPath}/business/ad/list.do?adContent="
			+ $("#adContentTypeNo").val() + "&adType=" + $("#adTypeNo").val() + "&adStatus=" + $("#adStatusNo").val();
	});
	
	$("#adStatusNo").on('change',function() {
		location.href = "${pageContext.request.contextPath}/business/ad/list.do?adContent="
			+ $("#adContentTypeNo").val() + "&adType=" + $("#adTypeNo").val() + "&adStatus=" + $("#adStatusNo").val();
	});
	
	function adStatusChange(no){
		var status = $("#adStatus_" + no).val(); 
		
		$.ajax({
			url : "${pageContext.request.contextPath}/business/ad/status/change.do",
			data : {
				"status" : status,
				"no" : no
			},
			success : function(data){
				alert("광고 상태 변경");
				location.reload()
			},error : function(data){
				alert("광고 상태 실패");
			}
		});
	}
	
	function insertAd(){
		location.href = "${pageContext.request.contextPath}/business/ad/insertForm.do";
	}
	</script>
</body>
</html>
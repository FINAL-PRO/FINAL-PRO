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
</head>
<body>
	<c:import url="../../common/menubar.jsp" />
	<div class="wrap_inner">
		<main id="container">
		<section>
			<div class="section-left">
				<!-- <a href="test/select.do">select test</a> -->
			</div>

			<div class="section-center">
				<div class="dc-content">
					<div class="dc-content-title">
						<div>
							<span class="dc-list-title">전체 회원 리스트</span>
						</div>
						<br />
						
						<div class="form-inline">
							<select class="form-control" id="authNo">
								<c:forEach items="${memberAuthList}" var="auth">
									<option value="${auth.no}"
										<c:if test="${auth.no eq authNo}">selected</c:if>>${auth.content}</option>
								</c:forEach>
							</select>
							<select class="form-control" id="memberStatusNo">
								<c:forEach items="${memberStatusList}" var="status">
										<option value="${status.id}" <c:if test="${status.id eq memberStatus}">selected</c:if>>${status.value}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="dc-content-box">
						<table class="table">
							<thead>
								<th>#</th>
								<th>이름</th>
								<th>가입일</th>
								<th>상태</th>
							</thead>
							<tbody>
								<c:if test="${!empty memberList }">
									<c:forEach var="member" items="${memberList}">
										<tr>
											<td>${member.no}</td>
											<td>
												<a href="${pageContext.request.contextPath}/admin/member/detailView.do?memberNo=${member.no}">${member.name}</a>
											</td>
											<td>${member.enrollDate}</td>
											<td>
												<div class="form-inline">
													<select class="form-control" id="${member.no}_changeStatusNo">
														<c:forEach items="${memberStatusList}" var="status">
															<c:if test="${memberStatus ne status.id}">
																<option value="${status.id}">${status.value}</option>
															</c:if>
														</c:forEach>
													</select>
													<button class="btn dc-btn" onclick="changeMemberStatus(${member.no});">상태변경</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty memberList }">
									<tr>
										<td colspan="4">
											<div class="dc-none-data">
												<span class="dc-none-data-text">데이터가 없습니다.</span>
											</div>
										</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<button class="btn dc-btn" onclick="goAdminIndex();">전체 목록</button>
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
		$("#authNo").on('change',function() {
			location.href = "${pageContext.request.contextPath}/admin/member/list.do?authNo="
				+ $("#authNo").val() + "&memberStatus=" + $("#memberStatusNo").val();
		});
		
		$("#memberStatusNo").on('change',function() {
			location.href = "${pageContext.request.contextPath}/admin/member/list.do?authNo="
				+ $("#authNo").val() + "&memberStatus=" + $("#memberStatusNo").val();
		});
		
		
		
		function changeMemberStatus(memberNo){
			var status = $("#"+ memberNo + "_changeStatusNo").val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/member/changeMemberStatus.do?memberNo="
						+ memberNo + "&status=" + status,
				success : function(data){
					if(data == "1"){
						alert("변경 성공");
						location.reload();
					}else{
						alert("변경 실패");
					}
				},error : function(){
					alert("error");
				}
			});
		}
	</script>
</body>
</html>
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
						<h1>어드민 멤버 리스트</h1>
						<select id="authNo">
							<c:forEach items="${memberAuthList}" var="auth">
								<option value="${auth.no}"
									<c:if test="${auth.no eq authNo}">selected</c:if>>${auth.content}</option>
							</c:forEach>
						</select>
						<select id="memberStatusNo">
							<c:forEach items="${memberStatusList}" var="status">
									<option value="${status.id}" <c:if test="${status.id eq memberStatus}">selected</c:if>>${status.value}</option>
							</c:forEach>
						</select>
					</div>
					<div class="dc-content-box">

						<div>
							<div class="row table-row">
								<div class="col column">번호</div>
								<div class="col column">이름</div>
								<div class="col column">가입일</div>
								<div class="col column">상태</div>
							</div>

							<c:forEach var="member" items="${memberList}">
								<div class="row table-row">
									<div class="col column">${member.no}</div>
									<div class="col column">
										<a
											href="${pageContext.request.contextPath}/admin/member/detailView.do?memberNo=${member.no}">${member.name}</a>
									</div>
									<div class="col column">${member.enrollDate}</div>
									<div class="col column">
										<select id="${member.no}_changeStatusNo">
											<c:forEach items="${memberStatusList}" var="status">
												<c:if test="${memberStatus ne status.id}">
													<option value="${status.id}">${status.value}</option>
												</c:if>
											</c:forEach>
										</select>
									<button onclick="changeMemberStatus(${member.no});">상태변경</button>
									</div>
								</div>
							</c:forEach>
							<div class="table" style="background: red"></div>
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
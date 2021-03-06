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

<style>
table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
    background: #f6f6f6;
}

</style>
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
						<h2>${region.title}</h2>
						<span>작성자 : ${region.userName}</span>
					</div>

					<div class="dc-content-box">
						<table class="table">
							<tr>
								<td>작성일 : ${region.writeDate }</td>
								<td>조회수 : ${region.viewcount} </td>
								<td>추천수 : ${likeCount}</td>
							</tr>
							<tr>
								<td colspan="3">
									<div class="content_text" style="padding-left: 20px; padding-top: 20px;"> ${region.content}</div>
								</td>	
							</tr>
							<tr>
								<td colspan="3">
									<div class="dc-btn-right">
										<button class="btn dc-btn" onclick="goList()" title="목록">목록</button>
										<c:if test="${member.no ==  region.memberNo}">
											<button class="btn dc-btn" onclick ="updateRegion()" title="수정하기">수정하기</button>
											<button class="btn dc-btn" onclick ="deleteRegion()" title="삭제하기">삭제하기</button>
										</c:if>
									</div>
								</td>
							</tr>
						</table>
							<div class="container3">
								<c:import url="../../common/comment.jsp" />
							</div>	
					</div>
				</div>
				<!-- content box end -->
			</div>
			<div class="section-right">
				<c:import url="../../common/rightSection.jsp" />
			</div>
		</section>
		</main>
	</div>
	<c:import url="../../common/footer.jsp" />

	<script>

	function updateRegion(){
		location.href="${pageContext.request.contextPath}/info/region/update/view.do?no=${region.no}";
	}
	
	function deleteRegion(){
		location.href="${pageContext.request.contextPath}/info/region/delete.do?no=${region.no}";
	}
	
	function goList(){
		location.href="${pageContext.request.contextPath}/info/region/list.do";
	}
</script>

</body>
</html>
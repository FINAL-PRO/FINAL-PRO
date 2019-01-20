<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<title>동커</title>
<c:import url="../../common/header.jsp" />

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
						<h1>${house.title}</h1>
					</div>
					<div class="dc-content-box">
						<table class="table">
							<tr>
								<td>작성자 : ${house.userName}</td>
								<td>작성일 : ${house.writeDate }</td>
								<td>조회수 : ${house.viewcount}</td>
							</tr>
							<tr>
								<td colspan="3">
									${house.content}			
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<div class="dc-btn-right">
										<button class="btn dc-btn" onclick="goList()" title="목록">목록</button>
										<c:if test="${member.no ==  house.mNo}">
											<button class="btn dc-btn" onclick ="updateHouse()" title="수정하기">수정하기</button>
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
			</div>

			<div class="section-right">
				<c:import url="../../common/rightSection.jsp" />
			</div>
		</section>
		</main>
	</div>
	<c:import url="../../common/footer.jsp" />
	
<script>

	function updateHouse(){
		location.href="${pageContext.request.contextPath}/info/house/update/view.do?no=${house.boardNo}";
	}
	
	function deleteHouse(){
		location.href="${pageContext.request.contextPath}/info/house/delete.do?no=${house.boardNo}";
	}
	
	function goList(){
		location.href="${pageContext.request.contextPath}/info/house/list.do";
	}
</script>
</body>
</html>
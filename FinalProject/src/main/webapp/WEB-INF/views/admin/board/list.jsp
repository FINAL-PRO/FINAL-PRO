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
				<!-- 내용없음 -->
			</div>

			<div class="section-center">
				<div class="dc-content">
					<div class="dc-content-title">
						<h1>어드민 보드 리스트</h1>
						<a href="${pageContext.request.contextPath}/admin/board/notice/writeView.do">공지글 쓰기</a>
						<br />
						<select id="boardTypeNo">
							<c:forEach items="${boardTypeList}" var="type">
								<option value="${type.id}" <c:if test="${type.id eq boardType}">selected</c:if>>${type.value}</option>
							</c:forEach>
						</select>
						<select id="boardStatusNo">
							<c:forEach items="${boardStatusList}" var="status">
								<option value="${status.id}" <c:if test="${status.id eq boardStatus}">selected</c:if>>${status.value}</option>
							</c:forEach>
						</select>
					</div>
					<div class="dc-content-box">

						<div class="row table-row">
							<div class="col column">번호</div>
							<div class="col column">이름</div>
							<div class="col column">작성일</div>
							<div class="col column">상태</div>
						</div>
						<c:forEach var="board" items="${boardList}">
							<div class="row table-row" id="comment_${board.no}">
								<div class="col column">${board.no}</div>
								<div class="col column">
									<a
										href="${pageContext.request.contextPath}/admin/board/detailView.do?boardNo=${board.no}">${board.title}</a>
								</div>
								<div class="col column">${board.writeDate}</div>
								<div class="col column">
									<select id="${board.no}_changeStatusNo">
										<c:forEach items="${boardStatusList}" var="status">
											<c:if test="${boardStatus ne status.id}">
												<option value="${status.id}">${status.value}</option>
											</c:if>
											
										</c:forEach>
									</select>
									<button onclick="changeBoardStatus(${board.no});">상태변경</button>
								</div>
							</div>
						</c:forEach>
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
		$("#boardTypeNo").on('change',function() {
							location.href = "${pageContext.request.contextPath}/admin/board/list.do?boardType="
									+ $("#boardTypeNo").val() + "&boardStatus=" + $("#boardStatusNo").val();
						});
		$("#boardStatusNo").on('change',function() {
					location.href = "${pageContext.request.contextPath}/admin/board/list.do?boardType="
						+ $("#boardTypeNo").val() + "&boardStatus=" + $("#boardStatusNo").val();
				});
		
		function changeBoardStatus(boardNo){
			var status = $("#"+ boardNo + "_changeStatusNo").val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/board/changeBoardStatus.do?boardNo="
						+ boardNo+ "&status=" + status,
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
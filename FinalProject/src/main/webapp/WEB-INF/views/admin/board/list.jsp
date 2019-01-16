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
						<div>
							<span class="dc-list-title">전체 게시글 리스트</span>
							<button class="btn dc-btn dc-btn-right" onclick="insertNotice();">공지 작성</button>
						</div>
						<br />
						<div class="form-inline">
							<select class="form-control" id="boardTypeNo">
								<c:forEach items="${boardTypeList}" var="type">
									<option value="${type.id}" <c:if test="${type.id eq boardType}">selected</c:if>>${type.value}</option>
								</c:forEach>
							</select>
							<select class="form-control" id="boardStatusNo">
								<c:forEach items="${boardStatusList}" var="status">
									<option value="${status.id}" <c:if test="${status.id eq boardStatus}">selected</c:if>>${status.value}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="dc-content-box">

						<table class="table">
							<thead>
								<th>#</th>
								<th>제목</th>
								<th>작성일</th>
								<th>상태</th>
							</thead>
							<tbody>
								<c:if test="${!empty boardList }">
									<c:forEach var="board" items="${boardList}">
										<tr id="comment_${board.no}">
											<td>${board.no}</td>
											<td>
												<a href="${pageContext.request.contextPath}/${boardUrl}/view.do?no=${board.no}">${board.title}</a>
											</td>
											<td>${board.writeDate}</td>
											<td>
												<div class="form-inline">
													<select class="form-control" id="${board.no}_changeStatusNo">
														<c:forEach items="${boardStatusList}" var="status">
															<c:if test="${boardStatus ne status.id}">
																<option value="${status.id}">${status.value}</option>
															</c:if>
														</c:forEach>
													</select>
													<button class="btn dc-btn" onclick="changeBoardStatus(${board.no});">상태변경</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty boardList }">
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
		
		function insertNotice(){
			location.href = "${pageContext.request.contextPath}/admin/board/notice/insert/view.do";
		}
	</script>
</body>
</html>
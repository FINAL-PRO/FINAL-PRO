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
							<h1>공지글 작성폼</h1>
						</div>
						<div class="dc-content-box">
							<div class="table-form-content">
								<form name="boardFrm" action="${pageContext.request.contextPath}/admin/board/notice/insert.do" method="post">
									<input type="text" id="memberNo" name="memberNo" value="${member.no}"/>
									<table class="table table-bordered">
										<tbody>
											<tr>
												<td>게시판 타입</td>
												<td>						
													<select id="boardTypeNo" name="type">
														<c:forEach items="${boardTypeList}" var="type">
															<option value="${type.id}"
																<c:if test="${type.id eq boardType}">selected</c:if>>${type.value}</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<td>제목</td>
												<td><input type="text" name="title" required="required"/></td>
											</tr>
											<tr>
												<td colspan="2">
													<textarea name="content" id="summernote" class="form-control" rows="20" cols="70" required></textarea>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center">
													<button type="submit">등록</button>
												</td>
											</tr>
										</tbody>					
									</table>
									<input type="hidden" name="status" value="BSTATUS004"/>
									<input type="hidden" name="memberNo" value="${member.no}"/>
								</form>
							</div>
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
		$(document).ready(function() {
			$('#summernote').summernote({
				height: 300,
				lang: 'ko-KR'
			}); 
		});

	</script>	 
</body>
</html>
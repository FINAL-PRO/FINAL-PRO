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
.board_area {
	padding: 20px;
	margin: 20px;
}

.table-div {
	display: table;
}

.tr-div {
	display: table-row;
	text-align: center;
}

.td-div {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
	padding: 5px;
}

.th-div {
	display: table-header-group;
	text-align: center;
}
</style>

</head>
<body>
	<div id="container">
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
							<h1>제목</h1>
						</div>
						<div class="dc-content-box">
							<div class="board_area">
								<form name="boardFrm" action="${pageContext.request.contextPath}/community/free/freeInsertFormEnd.do" method="post">
									<div>
										<b>글쓰기</b>
									</div>
									<div class="table-div">
										<br>
										<div class="tr-div">
											<div class="td-div">제목</div>
											<div class="td-div">
												<input type="text" name="title" id="title" style="width: 100%;" required>
											</div>
											<input type="hidden" id="mno" name="mno" value="${member.no}" required>
										</div>
										<div class="tr-div">
											<div class="td-div">내용</div>
											<div class="td-div">
												<textarea name="content" id="summernote"
													class="form-control" rows="20" cols="70" required></textarea>
												<script>
					                                $(document).ready(function() {
					                                    $('#summernote').summernote({
					                                        height: 300,
					                                        lang: 'ko-KR'
					                                    }); 
					                                });
					                            </script>
											</div>
										</div>
										<div class="tr-div">
											<input type="submit" class="btn btn-outline-success" value="Save">
										</div>
									</div>
									<script>
						                function save(){
						                	location.href="${pageContext.request.contextPath}/community/free/freeInsertFormEnd.do";
						                } 
						                
						                function back(){
						                    location.href="${pageContext.request.contextPath}/community/free/list.do";
						                }
						            </script>
								</form>
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
</body>
</html>
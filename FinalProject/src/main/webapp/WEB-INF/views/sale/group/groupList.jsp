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
	
	<style>
		.content-box {
			width : 800px;
			height : 300px;
			background-color: lightblue;
			position: relative;
		}
		
		.image {
			width: 150px;
			height: 150px;
			background-color: yellow;
			position: relative;
			display: inline-block;
		}
		
		.right {
			width: 650px;
			height: 150px;
			background-color: orange;
			position: relative;
			display: inline-block;
		}
	</style>
	
	<script>
		function goGroupForm(){
			location.href = "${pageContext.request.contextPath}/sale/group/groupForm.do";
		}	
		
		$(function(){
			$('.right').on("click",function(){
				var boardNo = $(this).siblings('input[name="boardNo"]').val();
				location.href = "${pageContext.request.contextPath}/sale/group/groupView.do?boardNo="+boardNo;
			});
		});
	</script>
</head>
<body>

	<div id="container">
		<c:import url="../../common/menubar.jsp" />
		<section id="content">
			<h1>공동구매</h1>
			
			<input type="button" value="글쓰기" onclick="goGroupForm();" /> <br />
			
			<c:forEach items="${list}" var="g">
				<div class="content-box" onclick="selectOne(this);">
					<input type="hidden" name=boardNo value="${g.boardNo}" />
					<div class="content image">
						<img src="${g.thumbnail}" class="image"/></div>
					<div class="content right">
						<p>${g.title}</p>
						<span>${g.goodsName}</span> <span>${g.price}원</span>
						<span>${g.currentCount}명/${g.maxCount}명</span>
						<span>마감일 ${g.endDate}</span>
						<span>${g.memberName}</span>
						<span>${g.writeDate}</span> <span>조회수 ${g.viewCount}</span>
					</div>
				</div>
			</c:forEach>

			<c:out value="${pageBar}" escapeXml="false" />
			
		</section>
		<c:import url="../../common/footer.jsp" />
	</div>

</body>
</html>
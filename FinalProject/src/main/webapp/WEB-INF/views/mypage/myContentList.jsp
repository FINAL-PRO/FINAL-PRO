<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내가 쓴 글/댓글 List</title>	
	<c:import url="../common/header.jsp"/>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="wrap_inner">
		<main id="container">
			<section>
				<div class="section-left">
					<!-- 내용없음 -->
				</div>
				
				<div class="section-center">
					<div class="dc-content">
						<div class="dc-content-title">
							<c:import url="myPageMenu.jsp"/>
						</div>
						<div class="dc-content-box">
							<div class="list" style="width: 800px; margin: auto;">
								<label>내가 쓴 글</label>
					            <table border="1" style="border-spacing:0; text-align:center; border-collapse:collapse; color: #fff; line-height:1.5; border:none;">					        	
						            <thead class="listcol" style="border-color: white;  color: gray;">   						                    
						            <tr style="color:gray;">
						                <th style="width:50px;">번호</th>
						                <th style="width:150px;">게시판 종류</th>
						                <th style="width:200px;">제목</th>
						                <th style="width:200px;">작성일</th>
						                <th style="width:150px;">조회수</th>						
						            </tr>    
						            <c:set value="${boardList}" var="boardList" />
					        		<c:if test="${!empty boardList}" >
						            <c:forEach items="${boardList}" var="board" varStatus="bo">
						            <tr style="background-color:#FFFFFF; color:gray;">
						                <th style="width:50px;" > ${bo.index + 1}</th>
						                <th style="width:150px;" >${board.boardType}</th>
						                <th style="width:200px;" >
						                <c:choose>
						                	<c:when test = "${board.boardType eq '자유게시판'}">
						                	<a href="${pageContext.request.contextPath}/community/free/freeView.do?bno=${board.no}">${board.title}</a>
						                	</c:when>
											<c:when test = "${board.title eq '맛집'}">
								          	<a href="#">${board.title}</a>
								         	</c:when>
								         	<c:when test = "${board.title eq '공동구매'}">
								          	<a href="#">${board.title}</a>
								        	 </c:when>
								        	 <c:when test = "${board.title eq '중고거래'}">
								          	<a href="#">${board.title}</a>
								         	</c:when>
								         	<c:when test = "${board.title eq '부동산'}">
								          	<a href="#">${board.title}</a>
								        	 </c:when>
								         	<c:when test = "${board.title eq '구인구직'}">
								          	<a href="#">${board.title}</a>
								         	</c:when>							                	
						                </c:choose>
						                </th>
						                <th style="width:200px;"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.writeDate}" /></th>
						                <th style="width:150px;">${board.viewCount}</th>
						            </tr>						              
						            </c:forEach>
						            </c:if>
						              <c:if test="${empty boardList}"> 
						              	<th colspan="5" style="width:auto; text-align:center;">작성된 게시물이 없습니다.</th>
						              </c:if>
						            </thead>
					        	</table>
					        	<hr/>
					        	
					        	<label>내가 쓴 댓글</label>
					        	
					        	
					            <table border="1" style="border-spacing:0; text-align:center; border-collapse:collapse; color: #fff; line-height:1.5; border:none;">					        	
						            <thead class="listcol" style="border-color: white;  color: gray;">   						                    
						            <tr style="color:gray;">
						                <th style="width:50px;">번호</th>
						                <th style="width:150px;">게시판</th>
						                <th style="width:200px;">게시물 제목</th>
						                <th style="width:200px;">내용</th>
						                <th style="width:150px;">작성일</th>				
						            </tr>    
						            
						           
						            <c:set value="${commentList}" var="commentList" />
						            <c:if test="${!empty commentList}" >
						            <c:forEach items="${commentList}" var="comment" varStatus="co">						            
						            	<tr style="background-color:#FFFFFF; color:gray;">				            	
						                <th style="width:50px;" > ${co.index + 1}</th>
						                <th style="width:150px;" >${comment.boardType}</th>
						                <th style="width:200px;" >
						                <c:choose>
						                	<c:when test = "${comment.boardType eq '자유게시판'}">
						                	<a href="${pageContext.request.contextPath}/community/free/freeView.do?bno=${comment.boardNo}">${comment.boardTitle}</a>
						                	</c:when>
											<c:when test = "${comment.boardType eq '맛집'}">
								          	<a href="#">${board.title}</a>
								         	</c:when>
								         	<c:when test = "${comment.boardType eq '공동구매'}">
								          	<a href="#}">${comment.boardTitle}</a>
								        	 </c:when>
								        	 <c:when test = "${comment.boardType eq '중고거래'}">
								          	<a href="#">${board.title}</a>
								         	</c:when>
								         	<c:when test = "${comment.boardType eq '부동산'}">
								          	<a href="#">${board.title}</a>
								        	 </c:when>
								         	<c:when test = "${comment.boardType eq '구인구직'}">
								          	<a href="#">${board.title}</a>
								         	</c:when>							                	
						                </c:choose>
						                </th>
						                <th style="width:200px;"><a href="#" onclick="goComment(${comment.boardNo},${comment.no});" id="commentContent">${comment.content}</a></th>
						                <th style="width:150px;"><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.writeDate}" /></th>
						                
						            	</tr>
						            </c:forEach>	
						            </c:if>
						            
						            
						            <c:if test="${empty commentList}">				        		
					        		<tr style="background-color:#FFFFFF; color:gray;">
						                <th colspan="5" style="width:auto; text-align:center;">작성된 댓글이 없습니다.</th>
						               
						            </tr>
						            
					        		</c:if>					              
						            
						            </thead>
					        	</table>
					        	
					        	
					        	
					        </div>
						</div>
					</div>
				</div>
				
				<div class="section-right">
					<c:import url="../common/rightSection.jsp"/>
				</div>
			</section>
		</main>
	</div>
	<c:import url="../common/footer.jsp"/>
	
	<script type="text/javascript">		
		function goComment(bno, cno){
			location.href="${pageContext.request.contextPath}/community/free/freeView.do?bno="+ bno+"#commentArea"+ cno;
		}

	</script>

</body>
</html>
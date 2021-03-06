<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage/dc-mypage-list.css" />
	<title>동커</title>
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
						<div class="dc-content-title" >
							<c:import url="myPageMenubar.jsp"/>
						</div>
						<div class="dc-content-box">
							<div class="boardList" style="width: 100%; min-height: 300px; margin: auto;">								
					        
					        <div class="commentList" style="width: 100%; min-height: 300px; margin: auto;">
					        	<label class="mypageListTitleLabel"># 내가 쓴 댓글</label>					        						        	
					        	
					            <table>					        	
						            <thead class="listcol" style="border-color: white;  color: gray;">   						                    
						            <tr style="color:gray;">
						                <th scope="col" style="width:50px;">#</th>
						                <th scope="col" style="width:100px;">게시판</th>
						                <th scope="col" style="">게시물 제목</th>
						                <th scope="col" style="width:300px;">내용</th>
						                <th scope="col" style="width:120px;">작성일</th>				
						            </tr>    
						            
						           
						            <c:set value="${currentPageCommentlist}" var="commentList" />
						            <c:if test="${!empty commentList}" >
						            <c:forEach items="${commentList}" var="comment" varStatus="co">						            
						            	<tr style="background-color:#FFFFFF; color:gray;">				            	
						                <th scope="row"> ${fn:length(commentList)-co.index}</th>
						                <td>${comment.boardType}</td>
						                <td style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
						                <c:choose>
						                	<c:when test = "${comment.boardType eq '자유게시판'}">
						                	<a href="${pageContext.request.contextPath}/community/free/freeView.do?bno=${comment.boardNo}">${comment.boardTitle}</a>
						                	</c:when>
											<c:when test = "${comment.boardType eq '맛집'}">
								          	<a href="${pageContext.request.contextPath}/community/food/foodView.do?bno=${comment.boardNo}">${comment.boardTitle}</a>
								         	</c:when>
								         	<c:when test = "${comment.boardType eq '공동구매'}">
								          	<a href="${pageContext.request.contextPath}/sale/group/view.do?boardNo=${comment.boardNo}">${comment.boardTitle}</a>
								        	 </c:when>
								        	 <c:when test = "${comment.boardType eq '중고거래'}">
								          	<a href="${pageContext.request.contextPath}/sale/used/view.do?boardNo=${comment.boardNo}">${comment.boardTitle}</a>
								         	</c:when>
								         	<c:when test = "${comment.boardType eq '지역정보'}">
								          	<a href="${pageContext.request.contextPath}/info/region/view.do?no=${comment.boardNo}">${comment.boardTitle}</a>
								        	 </c:when>
								         	<c:when test = "${comment.boardType eq '부동산'}">
								          	<a href="${pageContext.request.contextPath}/info/house/view.do?no=${comment.boardNo}">${comment.boardTitle}</a>
								        	 </c:when>
								         	<c:when test = "${comment.boardType eq '구인구직'}">
								          	<a href="${pageContext.request.contextPath}/job/jobBoard/jobBoardDetail.do?no=${comment.boardNo}">${comment.boardTitle}</a>
								         	</c:when>							                	
						                </c:choose>
						                </td>
						                <td>
						                	<a href="#" onclick="goComment('${comment.boardType}', ${comment.boardNo}, ${comment.no})" id="commentContent">${comment.content}</a>
						                	<!-- <input type="hidden" id="cContent" value=""/></td> -->
						                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.writeDate}" /></td>
						                    
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
					        	<br>
					        	<c:out value="${commentPageBar}" escapeXml="false"/>				        	
					        	
					        </div>
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
		function goComment(bType, bno, cno){
			
			var bType = bType;
			var bno = bno;
			var cno = cno;
			
			switch(bType){
			case '자유게시판' : 
				location.href="${pageContext.request.contextPath}/community/free/freeView.do?bno="+ bno+"#commentArea"+ cno;
				break;
			case '맛집' : 
				location.href="${pageContext.request.contextPath}/community/food/foodView.do?bno="+ bno+"#commentArea"+ cno;
				break;
			case "공동구매" : 
				location.href="${pageContext.request.contextPath}/sale/group/view.do?boardNo="+ bno+"#commentArea"+ cno;
				break;
			case "중고거래" : 
				location.href="${pageContext.request.contextPath}/sale/used/view.do?boardNo="+ bno+"#commentArea"+ cno;
				break;
			case "지역정보" : 
				location.href="${pageContext.request.contextPath}/info/region/view.do?no="+ bno+"#commentArea"+ cno;
				break;
			case "부동산" : 
				location.href="${pageContext.request.contextPath}/info/house/view.do?no="+ bno+"#commentArea"+ cno;
				break;
			case "구인구직" : 
				location.href="${pageContext.request.contextPath}/job/jobBoard/jobBoardDetail.do?no="+ bno+"#commentArea"+ cno;
				break;			
			}
			
		}			

	</script>

</body>
</html>
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

#container2 {
	margin: 8px auto;
}

#container2 .article {
	font-size: 0;
	background-color: #fff;
	text-decoration: none;
	height: 30px;
}

#container2 .article>p.profile>span.title {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: #292929;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#container2 .article>p.profile>span.nickname {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: lightgray;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-right: 8px;
	margin-left: 8px;
	float: right;
}

#container2 .article>p.profile>span.count {
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: lightgray;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-right: 8px;
	margin-left: 8px;
	float: right;
}

.time {
	float: right;
	display: inline-block;
	max-width: 60%;
	line-height: 20px;
	color: lightgray;
	font-size: 14px;
	font-weight: bold;
	margin-left: 8px;
}

#container2 .article>p.status {
	margin-top: 8px;
}
 
p.attach {
	display: inline-block;
	float: right;
	margin-top: 8px;
}

span.attachcount {
	display: inline-block;
	line-height: 18px;
	color: #ffa81f;
	font-size: 12px;
	background-size: 16px 16px;
}

a.article {
	display: block;
	padding: 12px 12px;
	border-bottom: 1px solid #f2f2f2;
	height: 140px;
}

#container2 div.articlelist>ol.group>li>a.article:hover {
	background-color: #f8f8f8;
}

.group {
	list-style: none;
	padding: 0 20px 0 0;
}

hr {
	border: 0.3px solid lightgrey;
}

.notice_btn {
	float: right;
	padding-right: 20px;
}

.groupin{
	height: 35px;
	margin-bottom: 2px;
}

.totalCount{
	font-size:13px; 
	padding-left:10px;
}

.mypageListTitleLabel {
	font-weight: bold;
	font-size: 16px;
	color: gray;
	width: 100%;
	padding: 5px 20px 5px 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
	background: #f6f6f6;
}

th, td {
	border-bottom: 1px solid lightgray;
	padding: 10px;
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
							<h1>공지사항</h1>
						</div>
						<div class="dc-content-box">
							<div id="container2">
								<div class="articlelist">
								<p class="totalCount">총 ${totalContents}건의 공지사항이 있습니다.</p>
										
								<div class="boardList" style="width: 800px; min-height: 300px; margin: auto;">
						            <table>					        	
							            <thead class="listcol" style="border-color: white;  color: gray;">   						                    
							            <tr style="color:gray;">
							                <th scope="col" style="width:50px;">#</th>
							                <th scope="col" style="width:150px;">게시판 종류</th>
							                <th scope="col" style="width:200px;">제목</th>
							                <th scope="col" style="width:200px;">작성일</th>
							                <th scope="col" style="width:150px;">조회수</th>						
							            </tr>    
						        		<c:if test="${!empty nlist}" >
							            <c:forEach items="${nlist}" var="b">
							            <tr style="background-color:#FFFFFF; cursor:pointer; color:gray;" onclick="location.href='${pageContext.request.contextPath}/community/notice/noticeView.do?bno=${b.no}'">
							                <th scope="row"> ${bo.index + 1} </th>
							                <td>${b.boardType}</td>
							                <td>${b.title}</td>
							                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.writeDate}" /></td>
							                <td>${b.viewCount}</td>
							            </tr>
							            </c:forEach>
							            </c:if>
							              <c:if test="${empty nlist}"> 
							              	<th colspan="5" style="width:auto; text-align:center;">작성된 게시물이 없습니다.</th>
							              </c:if>
							            </thead>
						        	</table>
						        	<br>
						        </div>
									<c:out value="${pageBar}" escapeXml="false" />
								</div>
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
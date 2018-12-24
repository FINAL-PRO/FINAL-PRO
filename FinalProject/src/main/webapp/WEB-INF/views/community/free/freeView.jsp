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

    #container2 {
        margin: 8px auto; 
    }

    .article {
        font-size: 0; background-color: #fff; text-decoration:none;
    }
    .picture {
        display: inline-block; width: 20px; height: 20px; vertical-align: top;
    }
    .nickname {
        display: inline-block; line-height: 20px; color: #292929; font-size: 12px; font-weight: bold; white-space: nowrap; overflow: hidden; float:left;
    }
    
    .title{
    	display: inline-block; line-height: 20px; color: #292929; font-size: 15px; font-weight: bold; white-space: nowrap; overflow: hidden;
    }

    .time {
        float: right; display: inline-block; line-height: 20px; color: #a6a6a6; font-size: 12px;
    }

    .text {
        margin-top: 8px; padding: 10px; line-height: 500px; color: #292929; font-size: 14px; word-wrap: break-word; 
    }

    .comment {
        padding: 5px; line-height: 20px; color: #292929; font-size: 14px;
    }

    .status {
        float: right; padding: 10px; 
    }
    span {
        display: inline-block; margin-right: 8px; padding-left: 10px; line-height: 18px; color: #a6a6a6; font-size: 12px; background-repeat: no-repeat; 
    }

    .attach {
        float: right; margin-top: 8px; 
    }

    .article {
        display: block; padding: 12px 12px; border-bottom: 1px solid #f2f2f2; height: 140px; 
    }

	.articlelist{
		padding-top: 15px;
	}

    .group{
        list-style:none;
        padding-top: 20px;
        padding-left: 20px;
        padding-right: 20px;
    }

    .commentgroup{
        padding:20px;
    }

    .commnetlist{
        padding: 20px;
    }

    .commentwriteboard{
        padding: 15px 35px 10px 20px;
    }

    .commentwrite{
        width: 100%;
    }

    .comment_textarea{
        margin-right: 10px; margin-left: 10px;
    }

    hr {
        border: 0.3px solid rgb(178, 182, 187);
    }
    
    .category{
    	float: left;
    	padding-left: 20px;
  	}

    .btn_comment{
        margin-top: 4px;
        float: right;
    }

    .both{
        margin-top: 0px;
        margin-bottom: 0px;
        height: 1px;
    }
</style>
</head>
<body>
	<div id="container">
		<c:import url="../../common/menubar.jsp"/>
		<section id="content">
			<div class="section-left">
				<a href="test/select.do">select test</a>
				<h1>section-left</h1>
			</div>
			<div class="section-center">
				<div id="container2">
                <div class="articlelist" style="border: solid 0.5px red">
				<form name="boardFrm" method="post">
					<input type="hidden" id="bno" name="bno" value="${board.no}" readonly="readonly"/>
				</form>	
                    <div class="group" style="border: solid 0.5px blue">                     
                       	<p class="title">${board.title}</p>
                        <div style="border: solid 0.5px gray"></div>
                        <p class="profile">
                            <img class="picture" src="https://cf-epi.campuspick.com/0.png">
	                        <span class="nickname">${board.memberName}</span>
	                        <span class="count">조회수: ${board.viewCount}</span>
                            <p class="time">
			                	<fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
			                </p>
                        </p>
                        <p class="text">${board.content}</p>
                        <div style="border: solid 0.5px lightgray"></div>
                        <div class="status" style="border: solid 0.5px orange">
                        	<button class="btn_board_edit" id="btn_board_edit">수정</button>
                            <button class="btn_board_delete" id="btn_board_delete">삭제</button>
                            <button class="btn_report">신고하기</button>
                            <button class="btn_like">좋아요</button>
                            <span class="likecount">: 1</span>
                            <span class="commentcount">댓글: ${totalComment}</span>
                        </div>
                        <script>
                       		$("#btn_board_edit").click(function(){
                       			boardFrm.action="${pageContext.request.contextPath}/community/free/freeUpdateForm.do?no=${board.no}"
                       			boardFrm.submit();
                       		});
                       		
                       		$("#btn_board_delete").click(function(){
                       			boardFrm.action="${pageContext.request.contextPath}/community/free/freeDelete.do?no=${board.no}"
                        		boardFrm.submit();
                       		});
                           	
                        </script>
                        <p class="both" style="clear:both;">&nbsp;</p>
                    </div>
                    <div style="border: solid 0.5px gray"></div>
                    <div class="commentlist" style="border: solid 0.5px green">
                        <div class="commentwriteboard">
                            <span class="nickname">${board.memberName}</span><br />
                            <div class="comment_textarea" style="border: solid 0.5px pink">
                            	<form id="commentFrm" action="${pageContext.request.contextPath}/community/free/commentwrite.do?no=${board.no}" method="post">
	                            <textarea name="content" class="commentwrite"></textarea><br />
	                            <input type="text" id="mno" name="mno" value="${member.no}" readonly="readonly"/>
	                            <input type="text" id="bno" name="bno" value="${board.no}" readonly="readonly"/>
	                            </form>                            
                            </div>
                            <div class="btn_comment">
                                <button class="btn_comment_wirte" id="btn_comment_wirte">댓글쓰기</button>
                            </div>
                            <script>
	                            $("#btn_comment_wirte").click(function(){
	                      			alert("작성");
	                      			var c = $("commentwrite").val();
	                      			commentFrm.action="${pageContext.request.contextPath}/comment/commentWrite.do?no=${comment.no}"
	                      			/* boardFrm.action="${pageContext.request.contextPath}/community/free/freeView?no=${no}" */
	                      			commentFrm.submit();
	                      		});
                            </script>
                        <p class="both" style="clear:both;">&nbsp;</p>
                        </div>
                        <div style="border: solid 0.5px gray"></div>
                       	<c:forEach items="${clist}" var="c">
                        <div class="commentgroup" style="border: 1px solid blue">
                            <p class="profile">
                                <img class="picture" src="https://cf-epi.campuspick.com/0.png">
                                <span class="nickname">${c.memberName}</span>
                                <p class="time">
				                	<fmt:formatDate value="${c.writeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				                </p>
                            </p>
                            <p class="comment">${c.content}</p>
                            <div class="btn_comment">
                                <button class="btn_comment_edit" id="btn_comment_edit">수정</button>
                                <button class="btn_comment_delete" id="btn_comment_delete">삭제</button>
                                <button class="btn_comment_rewirte" id="btn_comment_wirte">답글쓰기</button>
                            </div>
                            <p class="both" style="clear:both;">&nbsp;</p>
                        </div>
                           </c:forEach>
                            <script>
                          		$("#btn_comment_edit").click(function(){
                          			alert("수정");
                          			boardFrm.action="${pageContext.request.contextPath}/comment/commentUpdateComment.do"
                          			boardFrm.submit();
                          		});
                          		
                          		$("#btn_comment_delete").click(function(){
                          			alert("삭제");
                          			boardFrm.action="${pageContext.request.contextPath}/comment/commentDelete.do?no=${comment.no}"
                          			boardFrm.submit();
                          		});
                          		
                          		$("#btn_comment_rewirte").click(function(){
                          			alert("답글쓰기");
                          			boardFrm.action="${pageContext.request.contextPath}/community/free/freeReWriteComment.do"
                          			boardFrm.submit();
                          		});
                            </script>
                    </div>
                    <button class="btn_back" id="btn_back">Back</button>
                    <script>
	                    $("#btn_back").click(function(){
	                    	boardFrm.action="${pageContext.request.contextPath}/community/free/list.do"
	                    	boardFrm.submit();
	                    });
                    </script>
                </div>
            </div>
			</div>
			<div class="section-right">
				<h1>section-right</h1>
			<div class="section-item">
				item1
			</div>
			<div class="section-item">
				item2
			</div>
			<div class="section-item">
				item3
			</div>
			<div class="section-item">
				item4
			</div>
		</div>
		</section>
		<c:import url="../../common/footer.jsp"/>
	</div>
</body>
</html>
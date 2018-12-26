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
	                            <form id="commentFrm" method="post">
	                            <textarea name="commentwrite" id="commentwrite" class="commentwrite" placeholder="댓글을 입력하세요."></textarea><br />                           
                            	<input type="text" id="mno" name="mno" value="${member.no}">
	                            <input type="text" id="bno" name="bno" value="${board.no}" readonly="readonly"/> 
	                        </form>
                            </div>
                            <div class="btn_comment">
                                <a href="#" id="btn_comment_wirte" class="btn pull-right btn-success">댓글쓰기</a>
                            </div>
                            <script>
                           
                           		$("#btn_comment_wirte").on("click",function(){	
                            		
                           			alert("댓글");
                            		var bno = $("#bno").val();
                            		var mno = $("#mno").val(); 
                            		var commentwrite = $("#commentwrite").val();
                            	
                            		$.ajax({
                            			url: "${pageContext.request.contextPath}/comment/commentWrite.do",
                            			type:"post",
                            			data: JSON.stringify({
                            				content: commentwrite,
                            				memberNo: mno,
                            				boardNo: bno
                            			}),
                            			contentType: 'application/json; charset=utf-8',
                            			success: function(data){
                            				console.log(data);
                            				if(data=="SUCCESS"){
                            					$("#commentContent").val("");
                            					commentList(bno);
                            					alert("저장완료");
                            					console.log("성공 bno:"+bno);
                            				} else{
                            					alert("등록 실패!");
                            				}
                            			}
                            		});
   	
                            	});
                            
/* 	                            $("#btn_comment_wirte").click(function(){
	                      			alert("작성");
	                      			var c = $("commentwrite").val();
	                      			commentFrm.action="( method = RequestMethod.GET, produces = "application/json")

	                      			출처: http://tadakichi.tistory.com/70 [라자루스의 개발 이야기]/comment/commentWrite.do?no=${comment.no}"
	                      			/* boardFrm.action="${pageContext.request.contextPath}/community/free/freeView?no=${no}" */
	                      			/* commentFrm.submit();
	                      		}); */
	                      		
                            </script>
                        <p class="both" style="clear:both;">&nbsp;</p>
                        </div>
                        <div style="border: solid 0.5px gray"></div>
                        <form id="commentListFrm" name="commentListFrm" method="post"> 
                        <div class="commentList" id="commentList" style="border: 1px solid blue">
	                        <input type="text" id="bno" name="bno" value="${board.no}" readonly="readonly"/>
                            <p class="both" style="clear:both;">&nbsp;</p>
                        </div>
                        </form>
                            <script>
                            
	                            $(function(){	                                
	                            	commentList(); 
	                            });
	                            
                            	function commentList(){
                            		
                            		var bno = $("#bno").val();
                            		
                            		
                            		$.ajax({
                            			type: "get",
                            			url: "${pageContext.request.contextPath}/comment/commentList.do",
                            			data:$("#commentListFrm").serialize(),
                            			dateType:"json",
                            			success: function(data){
                            				
                            				console.log(bno);
                            				console.log(data);
			
                            				var html = "";
                            				var cCnt = data.length;
              
                            				if(data.length>0){
                            					for(i=0; i<data.length; i++){
                            						html += "<p class='profile'>";
                            						html += "<img class='picture' src='https://cf-epi.campuspick.com/0.png'>";
                            						html += "<span class='nickname'>"+data[i].memberName+"</span>";
                            						html += "</p></p>";
                            						html += "<p class='comment'>"+data[i].content+"</p>";
                            						html += "<div class='btn_comment'>";
                            						html += "<button class='btn_comment_edit' id='btn_comment_edit'>수정</button>";
                            						html += "<button class='btn_comment_delete' id='btn_comment_delete'>삭제</button>";
                            						html += "<button class='btn_comment_rewirte' id='btn_comment_wirte'>답글쓰기</button>";
                            						html += "</div>";                        						
                            					}
                            				} else{
                            	                html += "<div>";
                            	                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                            	                html += "</table></div>";
                            	                html += "</div>";
                            				}
                            				
                            				$("#cCnt").html(cCnt);
                            	            $("#commentList").html(html);
                            	            	
                            			}
                            		});
                            	}
                            
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
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
	
	.container3 {
		padding: 15px;
	}
	
	.article {
		font-size: 0;
		background-color: #fff;
		text-decoration: none;
	}
	
	.picture {
		display: inline-block;
		width: 20px;
		height: 20px;
		vertical-align: top;
	}
	
	.nickname {
		display: inline-block;
		line-height: 20px;
		color: #292929;
		font-size: 12px;
		font-weight: bold;
		white-space: nowrap;
		overflow: hidden;
		float: left;
	}
	
	.title {
		display: inline-block;
		line-height: 20px;
		color: #292929;
		font-size: 15px;
		font-weight: bold;
		white-space: nowrap;
		overflow: hidden;
	}
	
	.time {
		float: right;
		display: inline-block;
		line-height: 20px;
		color: #a6a6a6;
		font-size: 12px;
	}
	
	.text {
		margin-top: 8px;
		padding: 10px;
		line-height: 500px;
		color: #292929;
		font-size: 14px;
		word-wrap: break-word;
	}
	
	.comment {
		padding: 5px;
		line-height: 20px;
		color: #292929;
		font-size: 14px;
	}
	
	.status {
		float: right;
		padding: 10px;
	}
	
	span {
		display: inline-block;
		margin-right: 8px;
		padding-left: 10px;
		line-height: 18px;
		color: #a6a6a6;
		font-size: 12px;
		background-repeat: no-repeat;
	}
	
	.attach {
		float: right;
		margin-top: 8px;
	}
	
	.article {
		display: block;
		padding: 12px 12px;
		border-bottom: 1px solid #f2f2f2;
		height: 140px;
	}
	
	.articlelist {
		padding-top: 15px;
	}
	
	.group {
		list-style: none;
		padding-top: 20px;
		padding-left: 20px;
		padding-right: 20px;
	}
	
	.commentgroup {
		padding: 20px;
	}
	
	.commnetlist {
		padding: 20px;
	}
	
	.commentwriteboard {
		padding: 15px 35px 10px 20px;
	}
	
	.commentwrite {
		width: 100%;
	}
	
	.comment_textarea {
		margin-right: 10px;
		margin-left: 10px;
	}
	
	hr {
		border: 0.3px solid rgb(178, 182, 187);
	}
	
	.category {
		float: left;
		padding-left: 20px;
	}
	
	.btn_comment {
		margin-top: 4px;
		float: right;
	}
	
	.both {
		margin-top: 0px;
		margin-bottom: 0px;
		height: 1px;
	}
	
	.commentbox{
		border: 1px solid yellow;
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
							<div id="container2">
								<div class="articlelist" style="border: solid 0.5px red">
									<form name="boardFrm" method="post">
										<input type="hidden" id="bno" name="bno" value="${board.no}" readonly="readonly" />
									</form>
									<div class="group" style="border: solid 0.5px blue">
										<p class="title">${board.title}</p>
										<div style="border: solid 0.5px gray"></div>
										<p class="profile">
											<img class="picture"
												src="https://cf-epi.campuspick.com/0.png"> <span
												class="nickname">${board.memberName}</span> <span
												class="count">조회수: ${board.viewCount}</span>
											<p class="time"><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
										</p>
										<p class="text">${board.content}</p>
										<div style="border: solid 0.5px lightgray"></div>
										<div class="status" style="border: solid 0.5px orange">
											<button class="btn_board_edit" id="btn_board_edit">수정</button>
											<button class="btn_board_delete" id="btn_board_delete">삭제</button>
											<button class="btn_report">신고하기</button>
											<button class="btn_like">좋아요</button>
											<span class="likecount">: 1</span> <span class="commentcount">댓글:
												${totalComment}</span>
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
										<p class="both" style="clear: both;">&nbsp;</p>
									</div>
									<div style="border: solid 0.5px gray"></div>
								    <div class="container3">
								        <label for="content">comment</label>
								        <form name="commentInsertForm">
								            <div class="input-group">
								               <input type="hidden" name="bno" value="${board.no}"/>
								               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
								               <input type="hidden" id="mno" name="mno" value="${member.no}" />
								               <span class="input-group-btn">
								                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
								               </span>
								              </div>
								        </form>
								    </div>
									<div style="border: solid 0.5px gray"></div>
									<form id="commentListFrm" name="commentListFrm" method="post">
										<div class="commentList" id="commentList" style="border: 1px solid blue">
											<p class="both" style="clear: both;">&nbsp;</p>
										</div>
									</form>
									<!--  댓글  -->

									<script>
                            		/* 댓글 스크립트 */
                            		
                            		var mno = $('[name=mno]').val(); 									
                            		var cno = $('[name=cno]').val(); 
                            		var bno = $('[name=bno]').val();
                            		
                            		commentList(bno);
                            		
                            		$('[name=commentInsertBtn]').click(function(){ 
                            		    var insertData = $('[name=commentInsertForm]').serialize(); 
                            		    commentInsert(insertData);
                            		});
                            		
                            		//댓글 등록
                            		function commentInsert(insertData){
                            			
                            			console.log(insertData);
                            			
                            		    $.ajax({
                            		        url : '${pageContext.request.contextPath}/comment/commentWrite.do',
                            		        type : 'post',
                            		        data : insertData,
                            		        success : function(data){
                            		            if(data == 1) {
                            		                commentList(bno); 
                            		                $('[name=content]').val('');
                            		            }
                            		        }
                            		    });
                            		}
		                            
	                            	function commentList(bno){
	                            		
	                            		$.ajax({
	                            			type: "get",
	                            			url: "${pageContext.request.contextPath}/comment/commentList.do",
	                            			data: {bno: bno},
	                            			success: function(data){
	                            				
	                            	            var a =''; 
	                            	            $.each(data, function(key, value){ 
	                            	                a += '<div class="commentArea">';
	                            	                a += '<p class="profile" style="display:inline;">';
                            						a += '<img class="picture" src="https://cf-epi.campuspick.com/0.png">';
                            						a += '<span class="nickname">'+value.memberName+'</span>';
                            						a += '</p>';
	                            	                a += '<input type="hidden" name="bno" value="'+bno+'"/>';
                            						a += '<input type="hidden" name="mno" value="'+mno+'"/>';
                        							a += '<input type="hidden" name="cno" value="'+value.no+'"/>';
                        							a += '<div class="btn_comment">';
	                            	                a += '<a href="#" onclick="commentUpdate('+value.no+',\''+value.content+'\');"> 수정 </a>';
	                            	                a += '<a href="#" onclick="commentDelete('+value.no+');"> 삭제 </a> </div>';
	                            	                a += '</div>';
	                            	                a += '<div class="commentContent'+value.no+'"> <p class="comment">'+value.content +'</p>';
	                            	                a += '</div></div>';
	                            	            });
	                            	            
	                            	            $("#commentList").html(a);

	                            			}
	                            		});
	                            	}
	                            	
                            		function commentDelete(cno){
	                          			
	                            		$.ajax({
	                            			type: "post",
	                            			url: "${pageContext.request.contextPath}/comment/commentDelete.do",
	                            			data: {cno:cno}, 
	                            			dataType: "text",
	                            			success: function(data){
	                            				if(data==1)commentList(bno);
	                            			}
	                            				
	                            		})
                          			}
                            		
                            		function commentUpdate(cno, content){
                						
                						var a ='';
                					    
                					    a += '<div class="input-group">';
                					    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
                					    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
                					    a += '</div>';
                					    
                					    $('.commentContent'+cno).html(a);
                						
                            		}
                            		
                            		//댓글 수정
                            		function commentUpdateProc(cno){
                            		    var updateContent = $('[name=content_'+cno+']').val();
                            		    
                            		    $.ajax({
                            		        url : '${pageContext.request.contextPath}/comment/commentUpdate.do',
                            		        type : 'post',
                            		        data : {
                            		        	'content' : updateContent, 
                            		        	'cno' : cno},
                            		        success : function(data){
                            		            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
                            		        }
                            		    });
                            		}

/* 	                          		$("#btn_comment_edit").click(function(){
	                          			alert("수정");
	                          			boardFrm.action="${pageContext.request.contextPath}/comment/commentUpdateComment.do"
	                          			boardFrm.submit();
	                          		}); 
	                          		

	                          		$("#btn_comment_rewirte").click(function(){
	                          			alert("답글쓰기");
	                          			boardFrm.action="${pageContext.request.contextPath}/community/free/freeReWriteComment.do"
	                          			boardFrm.submit();
	                          		}); */
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
					</div>
				</div>

				<div class="section-right">
					<c:import url="../../common/rightSection.jsp" />
				</div>
			</section>
			</main>
		</div>
		</div>
		<c:import url="../../common/footer.jsp" />
</body>
</html>
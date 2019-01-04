<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	
	.commentFrm{
	 	padding: 15px;
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
	
	.time {
		float: right;
		display: inline-block;
		line-height: 20px;
		color: #a6a6a6;
		font-size: 12px;
	}
	
	.comment {
		padding: 5px;
		line-height: 20px;
		color: #292929;
		font-size: 14px;
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
	
	.btn_comment {
		margin-top: 4px;
		float: right;
	}
	
</style>
</head>
<body>
	<!--  댓글  -->
	<div class="commentFrm">
		<label for="content">comment</label>
		<form name="commentInsertForm">
			<div class="input-group">
				<input type="hidden" id="bno" name="bno" value="${boardList.no}" /> 
				<input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요."/> 
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
   		
   		console.log(bno);
   		
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
       				
    		});
  		}
     		

		function commentUpdate(cno, content) {

			var a = '';

			a += '<div class="input-group">';
			a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
			a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+ cno + ');">수정</button> </span>';
			a += '</div>';

			$('.commentContent' + cno).html(a);

		}

		//댓글 수정
		function commentUpdateProc(cno) {
			
			var updateContent = $('[name=content_' + cno + ']').val();

			$.ajax({
				url : '${pageContext.request.contextPath}/comment/commentUpdate.do',
				type : 'post',
				data : {
					'content' : updateContent,
					'cno' : cno
				},
				success : function(data) {
					if (data == 1)
						commentList(bno); //댓글 수정후 목록 출력 
				}
			});
		}
		
	</script>
</body>
</html>
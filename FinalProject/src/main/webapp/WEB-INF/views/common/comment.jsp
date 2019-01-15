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

.CommentPicture {
	display: inline-block;
	width: 20px;
	height: 20px;
	vertical-align: top;
}

.Cnickname {
	display: inline-block;
	line-height: 20px;
	color: #292929;
	font-size: 12px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	float: left;
}

.Ctime {
	float: right;
	display: inline-block;
	line-height: 20px;
	color: #a6a6a6;
	font-size: 12px;
}

.form-control:focus {
  border-color: inherit;
  -webkit-box-shadow: none;
  box-shadow: none;
}

.Cprofile{
	padding: 2px;
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
	float: right;
	font-size: 12px;
	padding: 2px;
}

#commentSubmit{
	margin-left: 10px;
	background: rgb(244, 126, 96);
	color: white;
}

</style>
</head>
<body>
	<!--  댓글  -->
	<div class="commentFrm">
		<label for="content">comment</label>
		<form name="commentInsertForm">
			<div class="input-group">
				<input type="hidden" id="bno" name="bno" value="${bno}" /> 
				<input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요."/> 
				<input type="hidden" id="mno" name="mno" value="${member.no}" /> 
				<input type="hidden" id="profile" name="profile" value="${member.profile}"/>
				<span class="input-group-btn">
				<button class="btn btn-default" id="commentSubmit" type="button" name="commentInsertBtn">등록</button>
				</span>
			</div>
		</form>
	</div>
	<div style="border: solid 0.5px gray"></div>
	<form id="commentListFrm" name="commentListFrm" method="post">
		<div class="commentList" id="commentList">
			<p class="both" style="clear: both;">&nbsp;</p>
		</div>
	</form>
	<div style="border: solid 0.5px gray"></div>
	<script>
	/* 댓글 스크립트 */
	
	var mno = $('[name=mno]').val(); 									
	var bno = $('[name=bno]').val();
	
	console.log("mno/bno: "+mno+", "+bno);
		
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
	            } else {
	            	console.log("댓글 작성 ajax 실패");
	            }
	        }
	    });
	}
     
   	function commentList(bno){
   		
   		console.log("bno:" + bno);

   		$.ajax({
   			type: "get",
   			url: "${pageContext.request.contextPath}/comment/commentList.do",
   			data: {bno: bno},
   			success: function(data){

   	            var a =''; 
   	            
   	            $.each(data, function(key, value){ 

   	            	var profile = value.profile;
	   	    		
	   	    		if(profile == null){
	   	    			profile = "/dc/resources/upload/profile/profileDefaultImg.png";
	   	    		}else{
	   	    			profile = "/dc/resources/upload/profile/"+profile;
	   	    			console.log("yestprofile: "+profile);
	   	    		}
	   	    		
	   	    	 	var hidden_commnet = "style='display:none;'";
	   	    		if(mno == value.memberNo){
	   	    			hidden_commnet = "";
	   	    		} 
	   	    		
   	                a += '<div class="commentArea" id="commentArea'+value.no+'">';
   	                a += '<p class="Cprofile" style="display:inline;">';
					a += '<img class="CommentPicture" src="'+profile+'" />';
					a += '<span class="Cnickname">'+value.memberName+'</span>';
					a += '</p>';
   	                a += '<input type="hidden" name="bno" value="'+bno+'"/>';
					a += '<input type="hidden" name="mno" value="'+mno+'"/>';
					a += '<input type="hidden" name="cno"  value="'+value.no+'"/>';
					a += '<input type="hidden" name="profile" value="'+value.profile+'"/>'
					a += '<div class="btn_comment">';
   	                a += '<a href="#" onclick="commentUpdate('+value.no+',\''+value.content+'\');" '+hidden_commnet+'> 수정 </a>';
   	                a += '<a href="#" onclick="commentDelete('+value.no+');" '+hidden_commnet+'> 삭제 </a> </div>';
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
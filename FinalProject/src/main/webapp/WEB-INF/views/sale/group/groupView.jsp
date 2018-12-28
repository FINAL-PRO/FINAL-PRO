<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

.dc-content-box {
	padding-left: 50px;
	padding-right: 50px;
	margin-bottom: 50px;
}

.title-box {
	margin-top: 10px;
	margin-bottom: 10px;
}

.img-box {
	height: 250px;
	width: 250px;
}

.info {
	width: 100%;
}

.warn-msg {
	color:red; 
	font-size:12px; 
	padding-top:3px;
}

#goodsImg {
	width: 100%;
	height: 100%;
}

#content {
	width: 100%;
	height: auto;
	padding: 30px;
	border: 1px solid lightgray;
}
</style>

</head>

<body>

<c:import url="../../common/menubar.jsp" />
<div class="wrap_inner">
<main id="container">
<section>

<div class="section-left"><!-- 내용없음 --></div>

<div class="section-center">
<div class="dc-content">
<div class="dc-content-title"><h1>제목</h1></div>
		
<div class="dc-content-box">
<!-- ------------------- 내용 입력 ------------------- -->
	
<div class="title-box">
	<label class="title-label" for="title">제목</label>
	<span class="" id="title">${group.title }</span>
</div> <hr />
	
<div style="display:inline-block; width:100%;">
	<div style="float:left; width:30%;">
		<div class="img-box" style="border:1px solid black;">
			<img id="goodsImg"/>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-2">
			<p class="info-label">물품명</p>
			<p class="info-label">가격</p>
		</div>
		<div class="col-md-4">
			<p>${group.goodsName}</p>
			<p>${group.price}</p>
		</div>
		<div class="col-md-2">
			<p class="info-label">모집인원</p>
			<p class="info-label">거래방법</p>
			<p class="info-label">마감일</p>
		</div>
		<div class="col-md-4">
			<p>${group.maxCount}명 / ${group.currentCount}명</p>
			<p>${group.dealType}</p>
			<p>${group.endDate}</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<p class="info-label">계좌번호</p>
		</div>
		<div class="col-md-6">
			<p id="depMsg">모집 인원이 마감되면 공구 참여자에게만 보입니다.</p>
			<p id="deposit" style="display:none;">ㅇㅇ은행 ${group.deposit }</p>
		</div>
		<div class="col-md-4">
			<input type="button" id="btnApply" value="참여신청"/>
		</div>
	</div>
	
</div> <hr />
	
<div>
	<div id="content">${group.content }</div>
</div>
	
<br /><br />
<input type="button" value="목록" class="" onclick="goGroupList();"/>
<c:if test="${!empty member and member.no eq group.memberNo}">
	<input type="button" value="수정하기" class="" onclick="updateGroup();"/>
	<input type="button" value="삭제하기" class="" onclick="deleteGroup();"/>
</c:if>
<br /><br />

<!-- -------------------------------------------- -->
</div>
</div>
</div>

<div class="section-right"><c:import url="../../common/rightSection.jsp" /></div>
	
</section>
</main>
</div>
<c:import url="../../common/footer.jsp" />



<!-------------------- Script -------------------->
<script>
	
	$(function(){
		var remain = ${group.maxCount-group.currentCount};
		if(remain < 1) {
			$.ajax({
				url : 'showDeposit.do',
	            type : 'get',
	            data : {
	            	groupNo : '${group.no}',
	            	memberNo: '${member.no}'
	            }, 
	            success : function(data){
	            	if(data == 'OK') { //
	                    $("#depMsg").css("display", "none");
	                    $('#deposit').css("display", "block");
					} else {
						$("#depMsg").text("공동구매 참여자에게만 공개되는 정보입니다.");
					}
	            }
			});	
		}
	});
	
	function inGroup() {
		if (confirm("공동구매에 참여하시겠습니까?")) {
		  txt = "공동구매에 참여하였습니다.";
		}
	}
	
	function outGroup() {
		if (confirm("공동구매 참여를 취소하시겠습니까?")) {
		  txt = "공동구매에 참여하였습니다.";
		}
	}
	


	function goGroupList() {
		location.href = "${pageContext.request.contextPath}/sale/group/list.do";
	}
	
	function updateGroup() {
		location.href = "${pageContext.request.contextPath}/sale/group/groupUpdateForm.do?boardNo="+${group.boardNo};
	}
	
	function deleteGroup() {
		location.href = "${pageContext.request.contextPath}/sale/group/groupDelete.do?boardNo="+${group.boardNo};
	}

</script>

</body>
</html>
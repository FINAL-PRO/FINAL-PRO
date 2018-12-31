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

.status {
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
			<p id="depMsg">모집 인원이 마감되면 공동구매 참여자에게만 보입니다.</p>
			<p id="deposit" style="display:none;">ㅇㅇ은행 ${group.deposit }</p>
		</div>
		<div class="col-md-4">
			<c:if test="${!empty member and member.no ne group.memberNo}">
			<input type="button" id="btnApply" value="참여신청" onClick="switchGroup(this);"/>
			</c:if>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-2">
			<p class="info-label">진행상황</p>
		</div>
		<div class="col-md-10">
			<c:forEach items="${statusList}" var="status">
				<span class="status">${status.value} </span>
			</c:forEach>
		</div>
	</div>

</div> <hr />

<c:if test="${!empty member and member.no eq group.memberNo}">
<div class="row" id="ghBox" style="display:block;">
	<p>-- 참여자 목록 --</p>
	<c:forEach items="${ghList}" var="gh">
		<span>${gh.nickName} </span>
	</c:forEach>
	<hr />
</div>
</c:if>
	
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
		
		$.ajax({
			url : 'settingGroup.do',
		    type : 'get',
		    data : {
		    	groupNo : '${group.no}',
		    	memberNo: '${member.no}'
		    }, 
		    success : function(data){				
				if(remain < 1) { // 인원 마감 후
					$('#btnApply').attr({
						"value" : "모집마감",
						"disabled" : "disabled"
					});
					if(data == 'OK') {
						$("#depMsg").css("display", "none");
						$('#deposit').css("display", "block");
					}
				} else { // 인원 마감 전
					if(data == 'OK') {
						console.log("인원 마감 전 & 참여자");
						$('#btnApply').val("참여취소");
						$('#depMsg').html("참여 신청되었습니다. <br>계좌번호는 모집 인원이 마감되면 공개됩니다.");
					}
				}
		    }
		});	
	});
	
	function switchGroup(obj) {
		var req;
		var question;
		
		if($(obj).val() == '참여신청') {
			req = "in";
			question = "공동구매에 참여하시겠습니까?";
		} else if ($(obj).val() == '참여취소') {
			req = "out";
			question = "공동구매 참여를 취소하시겠습니까?";
		}

		if (confirm(question)) {
			$.ajax({
				url : 'gHistorySwitch.do',
			    type : 'get',
			    data : {
			    	groupNo : '${group.no}',
			    	memberNo: '${member.no}',
			    	req: req,
			    }, 
			    success : function(data){				
					location.reload();
			    }
			});	
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
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
	<p id="title">${used.title }</p>
</div> <hr />


<div class="row">
	<div class="col-md-4 img-box">
		<div class="img-box" style="border:1px solid black;">
			<img id="goodsImg" src="${used.goodsPicture}"/>
		</div>
	</div>
	<div class="col-md-2">
		<p class="info-label">물품명</p>
		<p class="info-label">가격</p>
		<p class="info-label">거래방법</p>
		<p class="info-label">판매상태</p> <br />
		<c:if test="${!empty member and member.no ne used.memberNo}">
		<input type="button" value="바로구매" onclick="pay(${used.price});" />
		</c:if>
		<c:if test="${!empty member and member.no eq used.memberNo}">
		<input type="button" value="물품 판매완료" onclick="soldOut();"/>
		</c:if>
	</div>
	<div class="col-md-6">
		<p>${used.goodsName}</p>
		<p>${used.price}<span>원</span></p>
		<p>${used.dealType}</p>
		<p>${used.status}</p>
	</div>
</div> <hr />

<c:if test="${member.no eq used.memberNo }">
<div class="row">
	
</div>
<hr />
</c:if>

<div>
	<div id="content">${group.content }</div>
</div>
	
<br /><br />
<input type="button" value="목록" class="" onclick="goUsedList();"/>
<c:if test="${!empty member and member.no eq group.memberNo}">
	<input type="button" value="수정하기" class="" onclick="updateUsed();"/>
	<input type="button" value="삭제하기" class="" onclick="deleteUsed();"/>
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
		IMP.init("imp48482584");
		
		var uh = "${uh}";
		if(uh != "") {
			$('#btnPay').attr("disabled", "disabled");
		}
	});
	
	function goUsedList() {
		location.href = "${pageContext.request.contextPath}/sale/used/list.do";
	}
	
	function updateUsed() {
		location.href = "${pageContext.request.contextPath}/sale/used/usedUpdateForm.do?boardNo="+${used.boardNo};
	}
	
	function deleteUsed() {
		location.href = "${pageContext.request.contextPath}/sale/used/usedDelete.do?boardNo="+${used.boardNo};
	}
	
	function pay(price) {
		
		$.ajax({
	    	data : { usedNo : "${used.no}" },
			url : "uHistoryCheck.do",
			type : "post",
			success : function(data) {
				if(data == "success") {
					IMP.request_pay({
					    pg : 'html5_inicis',
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : $('#goodsName').text(),
					    amount : parseInt($('#price').text()),
					    buyer_email : "${member.email}",
					    buyer_name : "${member.name}"
					}, function(rsp) {
					    if ( rsp.success ) {
					    	$.ajax({
					        	data : { usedNo : "${used.no}", memberNo : "${member.no}" },
								url : "uHistoryInsert.do",
								type : "post",
								success : function(data) {
									if(data == "success") {
										alert("결제 성공하였습니다.");
									} else {
										alert("결제 실패하였습니다.");
									}
								}
					        });
					    } else alert("결제를 취소하였습니다.");
					});
				} else if (data == "fail") {
					alert("거래가 진행중인 상품입니다..");
				} else {
					alert("구매 실패하였습니다.");
				}
			}
	    });
	}
	
	function soldOut() {
		var status = "${used.status}";
		
		if(status == "판매완료") {
			alert("이미 판매완료 처리된 상태입니다.");
			
		} else if(confirm("판매완료 처리하시겠습니까? 판매완료 처리 후 철회하실 수 없으니 신중히 선택해 주세요!")) {
			$.ajax({
	        	data : { usedNo : "${used.no}", status : "USED002" },
				url : "uStatusUpdate.do",
				type : "post",
				success : function(data) {
					if(data == "success") {
						alert("해당 물품을 판매완료 처리하였습니다.");
					} else {
						alert("오류 발생!");
					}
				}
	        });
		}
	}

</script>

</body>
</html>
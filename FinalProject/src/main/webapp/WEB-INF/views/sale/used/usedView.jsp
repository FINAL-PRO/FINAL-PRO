<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동커</title>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<c:import url="../../common/header.jsp" />

<style>

.title-box {
	width: 100%;
	margin-top: 10px;
	margin-bottom: 10px;
}

.img-box {
	height: 230px;
	width: 230px;
}

#goodsImg {
	width: 100%;
	height: 100%;
}

.info-label {
	font-weight: bold;
}

.warn-msg {
	color:red; 
	font-size:12px; 
	padding-top:3px;
}

#used-content {
	width: 100%;
	height: auto;
	padding: 30px;
	border: 1px solid lightgray;
}

#title {
	overflow: hidden;
    text-overflow: ellipsis;
    word-break: break-all;
    border-right: 1px solid lightgray;
}	

.status-box {
	display: inline-block;
	height: 40px;
	width: 100px;
	border-radius: .35rem;
	background: white;
	border: 2px solid rgb(244, 126, 96);
}

.status-txt {
	font-weight: bold;
	text-align: center;
	padding-top: 6px;
}

.btn {
	background: rgb(248, 178, 106);
	margin: 5px;
	margin-left: 0px;
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

<div class="row title-box">
	<div class="col-md-10">
		<p id="title">${used.title }</p>
	</div>
	<div class="col-md-2">
		<span id="memberName">${used.memberName }</span>
	</div>
</div> <hr style="margin-top:0px;"/>


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
		<c:if test="${member.no ne used.memberNo and used.dealType eq '안전거래'}">
		<input type="button" value="바로구매" onclick="pay(${used.price});" />
		</c:if>
		<c:if test="${member.no eq used.memberNo}">
		<input type="button" value="물품 판매완료" class="btn" onclick="soldOut();"/>
		</c:if>
	</div>
	<div class="col-md-6">
		<p id="goodsName">${used.goodsName}</p>
		<p ><span id="price">${used.price}</span>원</p>
		<p>${used.dealType}</p>
		<p>${used.status}</p>
	</div>
</div> <hr />

<c:if test="${!empty uh and member.no eq used.memberNo or member.no eq uh.memberNo}">
<div class="row flow-chart">
	<div class="col-md-2">
		<p class="info-label">진행상황</p>
	</div>
	<div class="col-md-10">
		<c:forEach items="${statusList}" var="status">
			<div class="status-box" id="${status.id}">
				<p class="status-txt">${status.value}</p>
			</div>
		</c:forEach>
	</div>
</div>
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-10">
		<c:if test="${uh.status eq 'USEDHIT001' and member.no eq used.memberNo}">
			<span>구매자에게 물품을 보내셨습니까? </span>
			<input type="button" value="물품인계" class="btn" onclick="updateUhStatus('USEDHIT002');"/> <br />
		</c:if>
		<c:if test="${uh.status eq 'USEDHIT001'}">
			<span>거래를 취소하시겠습니까? </span>
			<input type="button" value="거래취소" class="btn" onclick="updateUhStatus('USEDHIT005');" />
		</c:if>
		<c:if test="${uh.status eq 'USEDHIT002' and member.no eq uh.memberNo}">
			<span>판매자로부터 물품을 받으셨습니까? </span>
			<input type="button" value="인계확인" class="btn" onclick="updateUhStatus('USEDHIT003');"/>
			<input type="button" value="거래중지" class="btn" onclick="updateUhStatus('USEDHIT006');"/>
		</c:if>
	</div>
</div>
<hr />
</c:if>

<div>
	<div id="used-content">${used.content }</div>
</div>
	
<div style="display:flex; justify-content: center;">
	<c:if test="${!empty member and member.no eq used.memberNo}">
		<input type="button" value="수정하기" class="btn" onclick="updateUsed();"/>
		<input type="button" value="삭제하기" class="btn" onclick="deleteUsed();"/>
	</c:if> 
	<input type="button" value="목록" class="btn" onclick="goUsedList();"/>
</div>

<div class="container3">
	<c:import url="../../common/comment.jsp" />
</div>

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
		
		$(('div[id="${uh.status}"]')).css('background', 'rgb(248, 178, 106)');
	});
	
	function goUsedList() {
		location.href = "${pageContext.request.contextPath}/sale/used/list.do";
	}
	
	function updateUsed() {
		location.href = "${pageContext.request.contextPath}/sale/used/updateForm.do?boardNo="+${used.boardNo};
	}
	
	function deleteUsed() {
		if(confirm("삭제하시겠습니까?")) {
			location.href = "${pageContext.request.contextPath}/sale/used/delete.do?boardNo="+${used.boardNo};
		}
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
	
	function updateUhStatus(st) {
		
		var msg = "";
		
		if(st == 'USEDHIT002') {
			msg = "구매자에게 물품을 보내셨습니까?";
		} else if(st == 'USEDHIT003') {
			msg = "판매자로부터 물품을 확실히 받으셨습니까?";
		} else if(st == 'USEDHIT005') {
			msg = "거래를 취소하시겠습니까?";
		} else if(st == 'USEDHIT006') {
			msg = "판매자로부터 물품을 받지 못하여 거래를 중지합니다. 동의하십니까?";
		}
		
		if(confirm(msg)) {
			$.ajax({
	        	data : { usedNo : "${used.no}", status : st },
				url : "uhStatusUpdate.do",
				type : "post",
				success : function(data) {
					if(data == "success") {
						location.reload();
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
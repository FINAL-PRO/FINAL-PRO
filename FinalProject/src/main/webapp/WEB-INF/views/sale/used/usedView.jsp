<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sale/dc-sale-style.css" />
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<title>동커</title>
<c:import url="../../common/header.jsp" />
</head>

<body>

<c:import url="../../common/menubar.jsp" />
<div class="wrap_inner">
<main id="container">
<section>

<div class="section-left"><!-- 내용없음 --></div>

<div class="section-center">
<div class="dc-content">
<div class="dc-content-title">
	<span class="dc-title-text">중고거래</span>
</div>
		
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
		<input type="button" class="btn btnGroup" value="바로구매" onclick="pay(${used.price});" />
		</c:if>
		<c:if test="${member.no eq used.memberNo}">
		<input type="button" class="btn btnGroup" value="물품 판매완료"  onclick="soldOut();"/>
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
<div class="row" style="margin-top: 10px;">
	<div class="col-md-2">
	</div>
	<div class="col-md-10">
		<c:if test="${uh.status eq 'USEDHIT001' and member.no eq used.memberNo}">
			<div class="status-msg"><span>구매자에게 물품을 보냈습니다. </span></div>
			<input type="button" value="물품인계" class="btn btnGroup" onclick="updateUhStatus('USEDHIT002');"
				style="margin-bottom: 5px;"/> <br />
		</c:if>
		<c:if test="${uh.status eq 'USEDHIT001'}">
			<div class="status-msg"><span>거래를 취소합니다. </span></div>
			<input type="button" value="거래취소" class="btn btnGroup" onclick="updateUhStatus('USEDHIT005');"/> <br />
		</c:if>
		<c:if test="${uh.status eq 'USEDHIT002' and member.no eq uh.memberNo}">
			<div class="status-msg"><span>판매자로부터 물품을 받았습니다. </span></div>
			<input type="button" value="인계확인" class="btn btnGroup" onclick="updateUhStatus('USEDHIT003');"
				style="margin-bottom: 5px;"/> <br />
			<div class="status-msg"><span>판매자로부터 물품을 받지 못하여 거래를 중지합니다. </span></div>
			<input type="button" value="거래중지" class="btn btnGroup" onclick="updateUhStatus('USEDHIT006');"/> <br />
		</c:if>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="status-msg"><span>판매자에게 판매 금액을 지급하였습니다.</span></div>
			<input type="button" value="거래완료" class="btn btnGroup" onclick="updateUhStatus('USEDHIT004');"/> <br />
		</sec:authorize>
	</div>
</div>
<hr />
</c:if>

<div>
	<div class="sale-content">${used.content }</div>
</div> <br />

<div style="display:flex; justify-content: center;">
	<c:if test="${!empty member and member.no eq used.memberNo}">
		<input type="button" value="수정하기" class="btn btnGroup" onclick="updateUsed();"/>
		<input type="button" value="삭제하기" class="btn btnGroup" onclick="deleteUsed();"/>
	</c:if> 
	<input type="button" value="목록" class="btn btnGroup" onclick="goUsedList();"/>
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
		var uh = '${uh}';
		
		if('${used.status}' == '판매완료') {
			alert("판매완료 처리된 글은 수정할 수 없습니다.");
		} else if (uh != null) {
			alert("안전거래 진행중인 글은 수정할 수 없습니다.");
		} else {
			location.href = "${pageContext.request.contextPath}/sale/used/updateForm.do?boardNo="+${used.boardNo};
		}
	}
	
	function deleteUsed() {
		var uhStatus = '${uh.status}';
		
		if(uhStatus != 'USEDHIT004') {
			alert("무사히 거래가 완료되지 않은 경우 글을 삭제할 수 없습니다.");
		} else {
			if(confirm("삭제하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/sale/used/delete.do?boardNo="+${used.boardNo};
			}
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
			
		} else if(confirm("판매완료 처리하시겠습니까? 판매완료 처리 후 철회하실 수 없으니 신중히 선택해 주세요! 판매완료 처리 후에는 글을 수정할 수 없습니다.")) {
			$.ajax({
	        	data : { usedNo : "${used.no}", status : "USED002" },
				url : "uStatusUpdate.do",
				type : "post",
				success : function(data) {
					if(data == "success") {
						alert("해당 물품을 판매완료 처리하였습니다.");
						location.reload();
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
		} else if(st == 'USEDHIT004') {
			msg = "판매자에게 판매 금액을 지급하였습니까?";
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
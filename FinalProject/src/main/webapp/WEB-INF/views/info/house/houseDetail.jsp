<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<title>조회</title>
<c:import url="../../common/header.jsp" />

<script type="text/javascript">//<![CDATA[
            var lb = new Array;
            lb.lang = new Array;
            lb.lang['confirm_report'] = '신고하시겠습니까?';
            lb.lang['select_zip'] = '주소를 선택해주세요.';
            lb.lang['search_isnull'] = '검색어를 입력해주세요.';
            lb.date_option = {
                changeMonth: true,
                changeYear: true,
                gotoCurrent : false,
                yearRange : '-100:+10',
                            dateFormat: 'yy-mm-dd',
                        onSelect : function() {
                    jQuery(this).prev('input[type="hidden"]').val(this.value.replace(/[\.\-\/]/g,""))
                }
                            ,
                    closeText: '닫기',
                    prevText: '이전 달',
                    nextText: '다음 달',
                    currentText: '오늘',
                    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    dayNames: ['일','월','화','수','목','금','토'],
                    dayNamesShort: ['일','월','화','수','목','금','토'],
                    dayNamesMin: ['일','월','화','수','목','금','토'],
                    weekHeader: 'Wk',
                    firstDay: 0,
                    isRTL: false
                    };
//]]></script>
</head>
<body>
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
						<h1>${house.title}</h1>
					</div>
					<div class="dc-content-box">
						<table class="table">
							<tr>
								<td>작성자 : ${house.userName}</td>
								<td>작성일 : ${house.writeDate }</td>
								<td>조회수 : ${house.viewcount}</td>
							</tr>
							<tr>
								<td colspan="3">
									${house.content}			
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<button class="btn dc-btn" onclick="goList()" title="목록">목록</button>
									<c:if test="${member.no ==  house.memberNo}">
										<button class="btn dc-btn" onclick ="updateHouse()" title="수정하기">수정하기</button>
									</c:if>
								</td>
							</tr>
						</table>
						<div class="container3">
							<c:import url="../../common/comment.jsp" />
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
	<c:import url="../../common/footer.jsp" />
	
<script>

	function updateHouse(){
		location.href="${pageContext.request.contextPath}/info/house/update/view.do?no=${house.boardNo}";
	}
	
	function deleteHouse(){
		location.href="${pageContext.request.contextPath}/info/house/delete.do?no=${house.boardNo}";
	}
	
	function goList(){
		location.href="${pageContext.request.contextPath}/info/house/list.do";
	}
</script>
</body>
</html>
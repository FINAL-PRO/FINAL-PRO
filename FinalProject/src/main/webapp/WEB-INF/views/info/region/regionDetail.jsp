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

</head>
<body>
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
						<h2>${region.title}</h2>
						<span>작성자 : ${region.userName}</span>
					</div>

					<div class="dc-content-box">
						<table class="table">
							<tr>
								<td>작성일 : ${region.writeDate }</td>
								<td>조회수 : ${region.viewcount} </td>
								<td>추천수 : ${likeCount}</td>
							</tr>
							<tr>
								<td colspan="3">
									<div class="content_text" style="padding-left: 20px; padding-top: 20px;"> ${region.content}</div>
								</td>	
							</tr>
							<tr>
								<td colspan="3">
									[<a class="" href="${pageContext.request.contextPath}/info/region/list.do" title="목록">목록</a>]
									[<a class="" href="#" accesskey="t" title="상단이동">맨 위로</a>]
									[<a onclick="updateRegion()" href="#" title="수정">수정하기</a>]
									[<a onclick="deleteRegion()" href="#" title="삭제">삭제하기</a>]
								</td>
							</tr>
						</table>
							<div class="container3">
								<c:import url="../../common/comment.jsp" />
							</div>	
					</div>
				</div>
				<!-- content box end -->
			</div>
			<div class="section-right">
				<c:import url="../../common/rightSection.jsp" />
			</div>
		</section>
		</main>
	</div>
	<c:import url="../../common/footer.jsp" />

	<script>

	function updateRegion(){
		location.href="${pageContext.request.contextPath}/info/region/update/view.do?no="+${region.no};
	}
	
	function deleteRegion(){
		location.href="${pageContext.request.contextPath}/info/region/delete.do?no="+${region.no};
	}
</script>

</body>
</html>
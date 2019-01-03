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
						${house.userName} / ${house.writeDate } / 조회수 : ${house.viewcount}
					</div>
					<div class="dc-content-box">${house.content}</div>
					<div class="" style="">
						<ul class=""
							style="list-style-type: none; padding-left: 0px; display: block;">
							<li class=""
								style="display: block; float: left; padding-right: 15px;"><a
								class=""
								href="${pageContext.request.contextPath}/info/house/list.do"
								title="목록">목록</a></li>
							<li class=""
								style="display: block; float: left; padding-right: 15px;"><a
								class="" href="#" accesskey="t" title="상단이동">맨 위로</a></li>
						<a href="${pageContext.request.contextPath}/info/house/updateHouse.do?no=${house.no}">수정하기</a>
						</ul>
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
			function selecthouse(no){
				location.href="${pageContext.request.contextPath}/info/house/selectOne.do?no="+no;
				}
			
			function reComInsert(){
				$("#reComInsert").attr("action","${pageContext.request.contextPath}/info/house/reInserthouse.do");
				$("#reComInsert").attr("method","post");
				$("#reCominsert").submit();
			}
			

		
        </script>


</body>
</html>
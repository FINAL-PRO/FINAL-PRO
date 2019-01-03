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
						<span>${region.userName}</span>${region.writeDate } 조회 수 :
						${likeCount} <br /> 추천 수 : ${region.viewcount}
					</div>

					<div class="dc-content-box">
						<div class="content_text"
							style="padding-left: 20px; padding-top: 20px;">
							${region.content}</div>
					</div>

					<div class="" style="">
						<ul class=""
							style="list-style-type: none; padding-left: 0px; display: block;">
							<li class=""
								style="display: block; float: left; padding-right: 15px;"><a
								class=""
								href="${pageContext.request.contextPath}/info/region/list.do"
								title="목록">목록</a></li>
							<li class=""
								style="display: block; float: left; padding-right: 15px;"><a
								class="" href="#" accesskey="t" title="상단이동">맨 위로</a></li>
							<li class="" style="display: block; float: left;"><a
								onclick="updateRegion()" title="수정">수정하기</a></li>
							<li class="" style="display: block; float: left;"><a
								onclick="deleteRegion()" title="삭제">삭제제하기</a></li>
						</ul>
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
		location.href="${pageContext.request.contextPath}/info/region/updateRegion.do?no="+${region.no};
	}
	
	function deleteRegion(){
		location.href="${pageContext.request.contextPath}/info/region/deleteRegion.do?no="+${region.no};
	}
	
	function selectRegion(no){
		location.href="${pageContext.request.contextPath}/info/region/rgSelectOne.do?no="+no;
	}
	
	function regionLike(no){  
		var lc = no + 1;
		var no = ${region.no}
		console.log(lc);
		console.log(no);
		
		$.ajax({
			url:'${pageContext.request.contextPath}/info/region/regionLikeCount.do',
			data :{'lc' : no},
			
			type : "POST",
			success : function(response){
				alert("좋아요 완료");
				location.href="${pageContext.request.contextPath}/info/region/rgSelectOne.do?no="+no;
			}
		})
	}
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage/dc-mypage-menubar.css" />
</head>
<body>
	<div class="dc-menubar">
		<div class="dc-manebar-main" align="center" style="padding: 12px;">		
			<div class="" id="navbarNav" style="margin: auto;">
					<a class="mypageMenuItem" href="${pageContext.request.contextPath}/member/memberView.do?no=${member.no}">내 정보 보기 </a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="mypageMenuItem" href="${pageContext.request.contextPath}/mypage/list.do?no=${member.no}">내가 쓴 글/댓글 </a>
			</div>
		</div>	
	</div>
	
	<script type="text/javascript">

	</script>
</body>
</html>
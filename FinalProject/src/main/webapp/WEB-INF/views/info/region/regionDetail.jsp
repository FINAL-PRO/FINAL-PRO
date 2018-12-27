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
	<c:import url="../../common/header.jsp"/>
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
	<c:import url="../../common/menubar.jsp"/>
	<div class="wrap_inner">
		<main id="container">
			<section>
				<div class="section-left">
					<!-- 내용없음 -->
				</div>
				
				<div class="section-center">
					<div class="dc-content">
					
						<div class="dc-content-title">
						
							<h2 class="" style="margin-top:50px; margin-bottom: 10px;">${region.title}</h2>
		                    <span class="" style="margin-right: 30px;">${region.userName}</span>${region.writeDate }
		                    <dl class="" style="float:right; display: table; margin:0px;">
		                        <dt class="" style="float: left; margin-left:30px;">조회 수</dt>
		                            <dd class="" style="float:right; margin-inline-start: 15px;">${likeCount}</dd>
		                        <dt class="" style="float: right; margin-left:30px;">추천 수</dt>
		                            <dd class="" style="float:right; margin-inline-start: 15px;">${region.viewcount}</dd>
		                    </dl>
		                    
						</div>
		
						
						
						<div class="dc-content-box">
							            
		                    <div class="content_text" style="padding-left: 20px; padding-top: 20px;">
		                    ${region.content}
		                    </div>

						</div>
						
						
						<div class="" style="">
			                <ul class="" style="list-style-type:none; padding-left:0px; display: block;">
			                    <li class="" style="display: block; float: left; padding-right: 15px;"><a class="" href="${pageContext.request.contextPath}/info/region/list.do" title="목록">목록</a> </li>
			                    <li class="" style="display: block; float: left; padding-right: 15px; "><a class="" href="#" accesskey="t" title="상단이동">맨 위로</a></li>
			                    <li class="" style="display: block; float: left;"><a onclick="updateRegion()"  title="수정">수정하기</a></li>
			                    <li class="" style="display: block; float: left;"><a onclick="deleteRegion()"  title="수정">작제하기</a></li>
			                    		
			                </ul>
			            </div>
			            <br>
			            <div class="" >
			                <ul class="" style="list-style-type:none; padding-left:0px; display: block;">
			                    <li class="" style="display: block; float: left; padding-right: 15px;">
			                    <button class="" title="추천" onclick="regionLike(${likeCount})">
			                        <span class="">추천 (${likeCount})</span>
			                    </button>
			                    </li>				
			                    
			                    <li class="">              
			                        <button class="" title="비추천" onclick="alert('로그인을 하지 않았습니다.'); ">
			                            <span class="">신고하기 </span>
			                        </button>
			                    </li>								
			                </ul>
			            </div>	
						
						<div id="comments" class="" style="margin: auto; margin-left: auto; margin-top: auto; width: 800px; border: 1px solid black;">
				            <div class="">
				                  <span class="">작성자</span>
				                  <span>작성일</span>
				            </div>
				            
				            <div class="">
				                     내용 
				            </div>
				            
				            <form id="reComInsert" >
				            <div class="reCommentInsert" style="display:block; background:gray; height: 80px; text-align: center; padding-top: 10px;">
				            	<textarea id="content" name="content" style="resize: none; heght:80px; width: 700px;">댓글</textarea>
				            	<input type="hidden" name="reComW" value=""/>			<!-- 해당 페이지 접근 멤버 회원 넘버 추가 -->
				            	<input type="hidden" name="boardNo" id="boardNo" value="${region.no}"/>
				            	<button onclick="reComInsert();">작성하기</button>
				            </div>    
				            </form> 
				            
				        </div> <!-- cdatail 끝 -->
				        
				        <br><br><br><br>
		
		
						  <div style="margin: auto; margin-left: auto; margin-top: auto; width: 800px; border:1px solid black; text-align: center; align-content: center; text-align: center;'">
				            <h3 class="">목록</h3>
				
				            
				            <table id="list"  style="display:block; margin-left: auto; margin-right:auto; text-align: center;">
				             
				                    <tr  style="margin: auto; margin-left: auto; margin-top: auto; text-align: center; align-content: center; text-align: center;">															    
				                        <th class=""  >번호</th>																			
				                        <th class="">제목</th>																		
				                        <th class="">글쓴이</th>																		
				                        <th class="">날짜</th>																			
				                        <th class="">조회 수</th>															
				                    </tr>
				             
				                	 <c:forEach items="${list}" var="regionList" varStatus="vs">
				                    <tr>							
				                       <td class=""><span class="">${vs.count}</span></td>
				                        <td class=""><a onclick="selectRegion(${regionList.no})"><span>${regionList.title }</span></a></td>
				                        <td class=""><span class="">${regionList.userName }</span></td>
				                        <td class="">${regionList.writeDate }</td>
				                        <td class="조회수">${regionList.viewcount }</td>
				                    </tr>
				                    </c:forEach>				               
				             </table>
				             
				             		<ul class="" >
				                        <li class="" style="display: block; float: left; padding-right:10px;"><a class="" href="" title="첫 페이지">첫 페이지 </a></li>										
				                        <li class="" style="display: block; float: left; padding-right:10px;"><a class="" href=""></a>1</li>
				                        <li class="" style="display: block; float: left; padding-right:10px;"><a class="" href=""></a>2</li>
				                        <li class="" style="display: block; float: left; padding-right:10px;"><a class="" href=""></a>3</li>
				                        <li class="" style="display: block; float: left; padding-right:10px;"><a class="" href=""></a>4</li>
				                        <li class="" style="display: block; float: left; padding-right:10px;"><a class="" href=""></a>5</li>
				                        <li class="" style="display: block; float: left; "><a class="" href="" title="끝 페이지">끝 페이지</a></li>				
				                    </ul>
				                    <br><br>
				            </div>
				
			                


				
						
					</div>	<!-- content box end -->
					
					
					
				</div>
				
				
				
				
				<div class="section-right">
					<c:import url="../../common/rightSection.jsp"/>
				</div>
			</section>
		</main>
	</div>
	<c:import url="../../common/footer.jsp"/>
	
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="content">
        <div class="centralizer">				<script type="text/javascript">//<![CDATA[
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

        <div id="cdetail" class="" style="margin: auto; margin-left: auto; margin-top: auto; width: 800;">
            <div id="">
            
                <div class="" style="">
                    <h2 class="" style="margin-top:50px; margin-bottom: 10px;"><a class="" href="" rel="">글제목</a></h2>
                    <span class="" style="margin-right: 30px;">작성자</span>111111
                    <dl class="" style="float:right; display: table; margin:0px;">
                        <dt class="" style="float: left; margin-left:30px;">조회 수</dt>
                            <dd class="" style="float:right; margin-inline-start: 15px;">00</dd>
                        <dt class="" style="float: right; margin-left:30px;">추천 수</dt>
                            <dd class="" style="float:right; margin-inline-start: 15px;">00</dd>
                    </dl>
                </div>
                   
                <br>
                <div class="ccontent" style="margin: auto; margin-left: auto; margin-top: auto; width: 800; border:1px solid black; min-height: 600px;">
                    <div class="content_text" style="padding-left: 20px; padding-top: 20px;">
                    내용
                    </div>
                </div>
            </div>


            <div class="" style="">
                <ul class="" style="list-style-type:none; padding-left:0px; display: block;">
                    <li class="" style="display: block; float: left; padding-right: 15px;"><a class="" href="" title="목록">목록</a> </li>
                    <li class="" style="display: block; float: left;"><a class="" href="#" accesskey="t" title="상단이동">맨 위로</a></li>
                </ul>
            </div>
            <br>
            <div class="" >
                <ul class="" style="list-style-type:none; padding-left:0px; display: block;">
                    <li class="" style="display: block; float: left; padding-right: 15px;">
                    <button class="" title="추천" onclick="alert('로그인을 하지 않았습니다.');">
                        <span class="">추천 (0)</span>
                    </button>
                    </li>				
                    
                    <li class="">              
                        <button class="" title="비추천" onclick="alert('로그인을 하지 않았습니다.'); ">
                            <span class="">비추천 (0) </span>
                        </button>
                    </li>								
                </ul>
            </div>	
            
            
            
            <div id="comments" class="" style="margin: auto; margin-left: auto; margin-top: auto; width: 800; border: 1px solid black;">
            <div class="">
                <h3 class="">
                    <strong class="">
                        <span class=""></span><span class=""><span class=""></span></span>
                        <span class=""> 댓글번호 </span>
                    </strong>
                    <span class="">댓글</span>
                </h3>
            </div>
            
            <div class="" id="" style="padding-left: 122px">
                <div class="" style="margin-left: -116px">
                     <h3 class=""><span class="">작성자</span></h3>
                    <p class="">작성일</p>
                </div>

                <div class="">
                    <div class=""></div>
                        <div class="lb-cm-content">
                            내용 
                        </div>

                
                        <div class="">
                                <br>
                            <ul class="">
                                <li class="" style="display: block; float: left; padding-right: 15px;"><br><br>
                                    <button class="" type="button" title="신고" onclick="alert('로그인을 하지 않았습니다.');">
                                        <span class="lb-h">신고</span>
                                    </button>
                                </li>						
                                <li class="lb-li" style="display: block; float: left;"><br><br>
                                    <button class="" type="button" onclick="" style="cursor:pointer;" title="댓글주소"><span class="lb-h">댓글주소</span></button>
                                </li>						
                            </ul>
                              <div id="" style="display:none; width:100%; float:left; clear:both; line-height:120%;">댓글주소 </div>
                            
                        </div>					
                </div>
            
            </div>
            
            </div>
        </div> <!-- cdatail 끝 -->

        <br><br><br><br></br>

        <div style="margin: auto; margin-left: auto; margin-top: auto; width: 800; border:1px solid black; text-align: center; align-content: center;">
            <h3 class="">목록</h3>
                <div class="">
                    <div class=""></div>
                    <div class=""></div>
                    <div class=""></div>
                </div>
            
            <table id="list" cellspacing="0" cellpadding="0">
                <caption class="">page</caption>
                
                <thead>
                    <tr>
                        <th scope="" class=""><span class="">Status</span></th>																			    
                        <th class="">번호</th>																			
                        <th class="">제목</th>																		
                        <th class="">글쓴이</th>																		
                        <th class="">날짜</th>																			
                        <th class="">조회 수</th>															
                    </tr>
                </thead>

                <tbody class="">
                    <tr>
                        <td class=""></td>									
                        <td class=""><span class="">st</span></td>
                        <td class=""><a class="" href="" title=""><span>title</span></a></td>
                        <td class=""><span class="">글쓴이</span></td>
                        <td class="">작성일</td>
                        <td class="조회수"></td>
                    </tr>
                </tbody>

                </table>
            </div>

            <br><br><br><br>
                
            <div class="" style="display:block; margin: auto; margin-left: auto; margin-top: auto; width: 800; border:1px solid black; text-align: center;">
                <h2 class="">Page Navigation</h2>
                    <ul class="">
                        <li class="" style="display: block; float: left; padding-right: 15px;"><a class="" href="" title="첫 페이지">첫 페이지 </a></li>										
                        <li class="" style="display: block; float: left; padding-right: 15px;"><a class="" href=""></a>1</li>
                        <li class="" style="display: block; float: left; padding-right: 15px;"><a class="" href=""></a>2</li>
                        <li class="" style="display: block; float: left; padding-right: 15px;"><a class="" href=""></a>3</li>
                        <li class="" style="display: block; float: left; padding-right: 15px;"><a class="" href=""></a>4</li>
                        <li class="" style="display: block; float: left; padding-right: 15px;"><a class="" href=""></a>5</li>
                        <li class="" style="display: block; float: left; padding-right: 15px;"><a class="" href="" title="끝 페이지">끝 페이지</a></li>				
                    </ul>
            </div>
        
        
        </div>
        </div>


</body>
</html>
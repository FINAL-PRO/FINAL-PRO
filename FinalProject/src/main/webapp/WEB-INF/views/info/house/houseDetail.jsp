<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>houseDetail</title>
</head>
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

        <div id="cdetail" class="">
            <div id="">
            <div class="">
                <div class="">
                    <h1 class=""><a class="" href="" rel="Permalink">글제목</a></h1>
                    <p class=""><span class="">작성자</span>,작성일</p>
                    <dl class="">
                        <dt class="lb-dm-info lb-list-i">조회수</dt>
                            <dd class="lb-dm-info">00</dd>
                        <dt class="lb-dm-info lb-list-i">추천 수</dt>
                            <dd class="lb-dm-info">00</dd>
                    </dl>
                </div>
            </div>								
                <div class="ccontent">
                    <div class="">
                        내용
                    </div>
                </div>
            </div>


            <div class="">
                <div class=""></div><div class=""></div><div class=""></div>
                <ul class="">
                    <li class=""><a class="" href="" title="목록">목록</a> </li>
                    <li class=""><a class="" href="#" accesskey="t" title="상단이동">맨 위로</a></li>
                </ul>
            </div>


            <div class="">
                <div class=""></div><div class=""></div><div class=""></div>
                <ul class="">
                    <li class="">
                    <button class="" title="추천" onclick="alert('로그인을 하지 않았습니다.');">
                        <span class="">
                            <strong class="">
                                <span class=></span><span class=""><span class=""></span></span>
                                <span class=""> 0</span>
                            </strong>             
                            추천</span><span class="">추천 (0)</span>
                    </button>
                    </li>				
                    
                    <li class="">              
                        <button class="" title="비추천" onclick="alert('로그인을 하지 않았습니다.'); ">
                            <span class="lb-ie6n">
                                <strong class="">
                                    <span class=""></span><span class=""><span class=""></span></span>
                                        <span class="lb-i-hack"> 0</span>
                                </strong>
                                비추천</span><span class="">비추천 (0) </span>
                        </button>
                    </li>								
                </ul>
            </div>	
            
            
            
            <div id="comments" class="">
            <div class="">
                <div class=""></div>
                <div class=""></div>
                <div class=""></div>
                <h2 class="">
                    <strong class="">
                        <span class=""></span><span class=""><span class=""></span></span>
                        <span class=""> 댓글번호 </span>
                    </strong>
                    <span class="">댓글</span>
                </h2>
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
                            <ul class="">
                                <li class="">
                                    <button class="" type="button" title="신고" onclick="alert('로그인을 하지 않았습니다.');">
                                        <span class="lb-h">신고</span>
                                    </button>
                                </li>						
                                <li class="lb-li">
                                    <button class="" type="button" onclick="" style="cursor:pointer;" title="댓글주소"><span class="lb-h">댓글주소</span></button>
                                </li>						
                            </ul>
                              <div id="" style="display:none; width:100%; float:left; clear:both; line-height:120%;">댓글주소 </div>
                            
                        </div>					
                </div>
            
            </div>
            
            </div>
        </div> <!-- cdatail 끝 -->


        <div>
            <h2 class="">목록</h2>
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
                        <th scope="col" class="">번호</th>																			
                        <th scope="col" class="">제목</th>																		
                        <th scope="col" class="">글쓴이</th>																		
                        <th scope="col" class="">날짜</th>																			
                        <th scope="col" class="">조회 수</th>															
                    </tr>
                </thead>

                <tbody class="">
                    <tr>
                        <td class=""></td>									
                        <td class=""><span class="">st</span></td>
                        <td class=""><h3 class=""><a class="" href="" title=""><span>title</span></a></h3></td>
                        <td class=""><span class="">글쓴이</span></td>
                        <td class="">작성일</td>
                        <td class="조회수"></td>
                    </tr>
                </tbody>

                </table>
                
            <div class="">
                <h2 class="">Page Navigation</h2>
                    <ul class="">
                        <li class=""><a class="" href="" title="첫 페이지">첫 페이지 </a></li>										
                        <li class=""><a class="" href=""></a>1</li>
                        <li class=""><a class="" href=""></a>2</li>
                        <li class=""><a class="" href=""></a>3</li>
                        <li class=""><a class="" href=""></a>4</li>
                        <li class=""><a class="" href=""></a>5</li>
                        <li class=""><a class="" href="" title="끝 페이지">끝 페이지</a></li>				
                    </ul>
            </div>
        
        </div>
        </div>
        </div>


</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

        <head>
            <title>부동산 list</title>
			<c:import url="../../common/header.jsp"/>
            <style>
           
            </style>
        </head>
        <body >

        <!-- 게시판 list -->
        <c:import url="../../common/menubar.jsp"/>
        
        <div class="titleArea"  style="width: 800px; margin: auto;">
                <h2><font color="#555555">게시판</font> </h2>
                <p>list</p>
            </div>
        <p class="imgArea"><img src=""></p>
       
      
        <div class="list" style="width: 800px; margin: auto;">
            <table border="1" style="border-spacing:0; border-collapse:collapse; color: #fff; line-height:1.5; border:none;">
        <caption>목록</caption>
            <thead class="listcol" style="border-color: white;  color: gray;">   
                    
            <tr style="color:gray;">
                <th style="width:130px;"> 번호</th>
                <th style="width:300px;">제목</th>
                <th style="width:150px;">작성자</th>
                <th style="width:150px;">작성일</th>
                <th style="width:150px;">조회수</th>

            </tr>    
            
            <c:forEach items="${list}" var="house" varStatus="vs">
            <tr style="background-color:#FFFFFF; color:gray;">
                <th style="width:130px;" > ${house.no}</th>
                <th style="width:300px;" ><a onclick="selectHouse(${house.no})">${house.title }</a></th>
                <th style="width:150px;" >${house.userName }</th>
                <th style="width:150px;">${house.writeDate}</th>
                <th style="width:150px;">${house.viewcount }</th>
            </tr>
  
            </c:forEach>
               <c:if test="${list  == null}"> 작성된 게시물이 없습니다</c:if>
            </thead>
        </table>
        </div>
        

        <!-- 글쓰기 영역 / 추후 회원 넘버 들어가도록 수정-->
        <br><br>
        <div class="upbt" style="width: 800px; margin: auto;">
                <a href="${pageContext.request.contextPath}/info/region/insertRegionView.do" class="displaynone btn btnStrong"> 글쓰기</a>
        </div>
        
        
        <!-- 게시물 검색 -->
        <br><br><br><br>
        <form id="boardSearchForm" name="" action="/검색" method="get" enctype="multipart/form-data" style="width: 800px; border: none; margin: auto;">
        <input id="board_no" name="board_no" value="1" type="hidden">
        <input id="page" name="page" value="1" type="hidden">
        <input id="board_sort" name="board_sort" value="" type="hidden">
        <div class="" style="width: 800px; margin: auto; margin-left: auto;">
        <fieldset class="boardSearch" style="border: none; margin: auto;">
        <legend>게시물 검색</legend>
        <p>
        <select id="search_date" name="search_date" >
        <option value="week">일주일</option>
        <option value="month">한달</option>
        <option value="month3">세달</option>
        <option value="all">전체</option>
        </select> 
        
        <select id="search_key" name="search_key" >
        <option value="subject">제목</option>
        <option value="content">내용</option>
        <option value="writer_name">글쓴이</option>
        <option value="member_id">아이디</option>
        <option value="nick_name">별명</option>
        </select> 
        
        <input id="search" name="search"class="inputTypeText" type="text"> <a href="#none" onclick="" alt="찾기">검색bt</a></p>
        </fieldset>
        </div>
        </form>

         <!-- footer -->
		<c:import url="../../common/footer.jsp"/>
		
		<script>
		function selectHouse(no){
			location.href="${pageContext.request.contextPath}/info/house/selectOne.do?no="+no;
			}
		</script>
        </body>


       </html>
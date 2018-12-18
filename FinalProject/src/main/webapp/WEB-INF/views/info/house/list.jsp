<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

        <head>
            <title>부동산 list</title>

            <style>
           
            </style>
        </head>
        <body >

        <!-- header -->
        <header>

        </header>
        
        <br><br><br>
        
        <!-- 게시판 list -->
        <div class="titleArea"  style="width: 800px; margin: auto;">
                <h2><font color="#555555">부동산 list</font> </h2>
                <p>list</p>
            </div>
        <p class="imgArea"><img src=""></p>
        </div>
      
        <div class="list" style="width: 800px; margin: auto;">
            <table border="1" style="border-spacing:0; border-collapse:collapse; color: #fff; line-height:1.5; border:none;">
        <caption>게시판 목록</caption>
            <thead class="listcol" style="border-color: white;  color: gray;">   
                    
            <tr style="color:gray;">
                <th style="width:130px;"> 번호</th>
                <th style="width:200px;">썸네일</th>
                <th style="width:300px;">제목</th>
                <th style="width:150px;">작성자</th>
                <th style="width:150px;">작성일</th>
                <th style="width:150px;">조회</th>
            </tr>    
            
            <tr style="background-color:#FFFFFF; color:gray;">
                <th style="width:130px;"> num</th>
                <th style="width:200px;">썸네일</th>
                <th style="width:300px;">제목 </th>
                <th style="width:150px;">이름</th>
                <th style="width:150px;">작성일</th>
                <th style="width:150px;">조회수</th>
               </tr>
            </thead>
        </table>
        </div>

        <!-- 글쓰기 영역 -->
        <br><br>
        <div class="upbt" style="width: 800px; margin: auto;">
                <a href="/글쓰기 주소" class="displaynone btn btnStrong"> 글쓰기</a>
        </div>
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
        
        <!-- 페이징처리 -->
        
        
        </div>
        </form>

         <!-- footer -->
        <footer>

        </footer>

        </body>


       </html>
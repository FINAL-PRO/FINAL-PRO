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
		<style>

    #container2 {
        margin: 8px auto; 
    }

    .article {
        font-size: 0; background-color: #fff; text-decoration:none;
    }
    .picture {
        display: inline-block; width: 20px; height: 20px; vertical-align: top;
    }
    .nickname {
        display: inline-block; line-height: 20px; color: #292929; font-size: 12px; font-weight: bold; white-space: nowrap; overflow: hidden; float:left;
    }
    
    .title{
    	display: inline-block; line-height: 20px; color: #292929; font-size: 15px; font-weight: bold; white-space: nowrap; overflow: hidden;
    }

    .time {
        float: right; display: inline-block; line-height: 20px; color: #a6a6a6; font-size: 12px;
    }

    .text {
        margin-top: 8px; padding: 10px; line-height: 500px; color: #292929; font-size: 14px; word-wrap: break-word; 
    }

    .comment {
        padding: 5px; line-height: 20px; color: #292929; font-size: 14px;
    }

    .status {
        float: right; padding: 10px; 
    }
    span {
        display: inline-block; margin-right: 8px; padding-left: 10px; line-height: 18px; color: #a6a6a6; font-size: 12px; background-repeat: no-repeat; 
    }

    .attach {
        float: right; margin-top: 8px; 
    }

    .article {
        display: block; padding: 12px 12px; border-bottom: 1px solid #f2f2f2; height: 140px; 
    }

	.articlelist{
		padding-top: 15px;
	}

    .group{
        list-style:none;
        padding-top: 20px;
        padding-left: 20px;
        padding-right: 20px;
    }

    .commentgroup{
        padding:20px;
    }

    .commnetlist{
        padding: 20px;
    }

    .commentwriteboard{
        padding: 15px 35px 10px 20px;
    }

    .commentwrite{
        width: 100%;
    }

    .comment_textarea{
        margin-right: 10px; margin-left: 10px;
    }

    hr {
        border: 0.3px solid rgb(178, 182, 187);
    }
    
    .category{
    	float: left;
    	padding-left: 20px;
  	}

    .btn_comment{
        margin-top: 4px;
        float: right;
    }

    .both{
        margin-top: 0px;
        margin-bottom: 0px;
        height: 1px;
    }
</style>
</head>
<body>
	<div id="container">
		<c:import url="../../common/menubar.jsp"/>
		<section id="content">
			<div class="section-left">
				<a href="test/select.do">select test</a>
				<h1>section-left</h1>
			</div>
			<div class="section-center">
				<div id="container2">
                <div class="articlelist" style="border: solid 0.5px red">
                    <div class="group" style="border: solid 0.5px blue">                     
                       	<p class="title">${board.title}</p>
                        <div style="border: solid 0.5px gray"></div>
                        <p class="profile">
                            <img class="picture" src="https://cf-epi.campuspick.com/0.png">
	                        <span class="nickname">${member.nickName}</span>
                            <p class="time">${board.writeDate}</p>
                        </p>
                        <p class="text">${board.content}</p>
                        <div style="border: solid 0.5px lightgray"></div>
                        <div class="status" style="border: solid 0.5px orange">
                            <button class="btn_report">신고하기</button>
                            <button class="btn_like">좋아요</button>
                            <span class="likecount">: 1</span>
                            <span class="commentcount">댓글: 0</span>
                        </div>
                        <p class="both" style="clear:both;">&nbsp;</p>
                    </div>
                    <div style="border: solid 0.5px gray"></div>
                    <div class="commentlist" style="border: solid 0.5px green">
                        <div class="commentwriteboard">
                            <span class="nickname">접속한닉네임</span><br />
                            <div class="comment_textarea" style="border: solid 0.5px pink">
	                            <textarea class="commentwrite"></textarea><br />                            
                            </div>
                            <div class="btn_comment">
                                <button class="btn_comment_wirte">댓글쓰기</button>
                            </div>
                        <p class="both" style="clear:both;">&nbsp;</p>
                        </div>
                        <div style="border: solid 0.5px gray"></div>
                        <div class="commentgroup">
                            <p class="profile">
                                <img class="picture" src="https://cf-epi.campuspick.com/0.png">
                                <span class="nickname">댓글닉네임</span>
                                <time>12/13 12:51</time>
                            </p>
                            <p class="comment">댓글내용입니다.</p>
                            <div class="btn_comment">
                                <button class="btn_comment_edit">수정</button>
                                <button class="btn_comment_delete">삭제</button>
                                <button class="btn_comment_wirte">답글쓰기</button>
                            </div>
                            <p class="both" style="clear:both;">&nbsp;</p>
                            <br>
                            <div style="border: solid 0.5px lightgray"></div>
                            <br />
                            <p class="profile">
                                <img class="picture" src="https://cf-epi.campuspick.com/0.png">
                                <span class="nickname">댓글닉네임</span>
                                <time>12/13 12:51</time>
                            </p>
                            <p class="comment">댓글내용입니다.</p>
                            <div class="btn_comment">
                                <button class="btn_comment_edit">수정</button>
                                <button class="btn_comment_delete">삭제</button>
                                <button class="btn_comment_wirte">답글쓰기</button>
                            </div>
                            <p class="both" style="clear:both;">&nbsp;</p>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
			</div>
			<div class="section-right">
				<h1>section-right</h1>
			<div class="section-item">
				item1
			</div>
			<div class="section-item">
				item2
			</div>
			<div class="section-item">
				item3
			</div>
			<div class="section-item">
				item4
			</div>
		</div>
		</section>
		<c:import url="../../common/footer.jsp"/>
	</div>
</body>
</html>
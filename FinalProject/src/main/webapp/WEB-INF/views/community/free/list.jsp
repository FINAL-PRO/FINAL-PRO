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

    #container2 .article {
        font-size: 0; background-color: #fff; text-decoration:none;
    }
    #container2 .article > p.profile > img.picture {
        display: inline-block; margin-right: 6px; width: 20px; height: 20px; vertical-align: top;
    }
    #container2 .article > p.profile > span.nickname {
        display: inline-block; max-width: 60%; line-height: 20px; color: #292929; font-size: 14px; font-weight: bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
    }
    #container2 .article > p.profile > span.nickname.disabled {
        color: #a6a6a6;
    }

    #container2 .article > p.profile > time {
        float: right; display: inline-block; line-height: 20px; color: #a6a6a6; font-size: 12px;
    }

    #container2 .article > p.text {
        margin-top: 8px; line-height: 18px; color: #292929; font-size: 14px; word-wrap: break-word; 
    }

    #container2 .article > p.status {
        float: left; margin-top: 8px;
    }
    #container2 .article > p.status > span {
        display: inline-block; margin-right: 8px; padding-left: 19px; line-height: 18px; color: #a6a6a6; font-size: 12px; background-repeat: no-repeat; background-size: 16px 16px;
    }

    #container2 .article > p.attach {
        float: right; margin-top: 8px;
    }
    #container2 .article > p.attach > span.attachcount {
        display: inline-block; padding-left: 19px; line-height: 18px; color: #ffa81f; font-size: 12px; background: transparent url('/images/community.board.article.attachcount.png') no-repeat; background-size: 16px 16px;
    }

    #container2 div.articlelist > ol.group > li > a.article {
        display: block; padding: 12px 12px; border-bottom: 1px solid #f2f2f2; height: 140px; 
    }

    #container2 div.articlelist > ol.group > li > a.article:hover {
        background-color: #f8f8f8;
    }

	.articlelist{
		padding-top: 15px;
	}

    .group{
        list-style:none;
        padding: 20px;
    }

    hr {
        border: 0.3px solid lightgrey;
    }
    
    .category{
    	float: left;
    	padding-left: 20px;
  	}
  	
  	.free_btn{
  		float: right;
  		padding-right:20px;
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
					<div class="free_top">
					  <div class="category">					  
			          <select>
			            <option value="서버넘길값">최신 순 정렬</option>
			            <option value="서버넘길값">좋아요 순 정렬</option>
			            <option value="서버넘길값">댓글 많은 순 정렬</option>
			          </select>
					  </div>
					  <div class="free_btn">
					  	<input type="button" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/community/free/freeWrite.do'"/>
					  </div>
			        </div>
			        <div class="articlelist">
			            <ol class="group">
			                <li class="groupin"><a class="article" href="#">
			                    <p class="profile">
			                        <img class="picture" src="https://cf-epi.campuspick.com/0.png">
			                        <span class="nickname">닉네임</span>
			                        <time>12/13 12:51</time>
			                    </p>
			                    <hr>
			                    <p class="text short">글내용입니다.</p>
			                    <p class="status">
			                        <span class="votecount">좋아요: 1</span>
			                        <span class="commentcount">댓글: 0</span>
			                    </p>
			                    <p class="attach"><span class="attachcount">이미지</span></p>
			                </a></li>
			                <li class="groupin"><a class="article" href="#">
			                    <p class="profile">
			                        <img class="picture" src="https://cf-epi.campuspick.com/0.png">
			                        <span class="nickname">닉네임</span>
			                        <time>12/13 12:51</time>
			                    </p>
			                    <hr>
			                    <p class="text short">글내용입니다.</p>
			                    <p class="status">
			                        <span class="votecount">좋아요: 1</span>
			                        <span class="commentcount">댓글: 0</span>
			                    </p>
			                    <p class="attach"><span class="attachcount">이미지</span></p>
			                </a></li>
			            </ol>
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
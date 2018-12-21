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

    .board_area{
        padding: 20px;
        margin: 20px;
    }

    .table-div{
        display:table;
    }

    .tr-div{
        display:table-row;
        text-align: center;
    }

    .td-div{
        display:table-cell;
        text-align: center;
        vertical-align: middle;
        padding: 5px;
    }

    .th-div{
        display: table-header-group;
        text-align: center;
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
				<div class="board_area">
				<form name="boardFrm" action="${pageContext.request.contextPath}/community/free/freeInsertFormEnd.do" method="post">
	            <div>
	                <b>글쓰기</b>
	            </div>
	            <div class="table-div">
	                <br>
	                <div class="tr-div">
	                    <div class="td-div">제목</div>
	                    <div class="td-div"><input type="text" class="form-control" name="title" id="title" required></div>
	                    <input type="text" class="form-control" name="memberNo" required>
	                </div>
	                <div class="tr-div">
	                    <div class="td-div">내용</div>
	                    <div class="td-div">
                           <!--  <div id="summernote" style="resize: none;" name="content"></div> -->
                            <textarea name="content" id="summernote" class="form-control" rows="20" cols="70" required></textarea>
                            <script>
                                $(document).ready(function() {
                                    $('#summernote').summernote({
                                        height: 300,
                                        lang: 'ko-KR'
                                    }); 
                                });
                            </script>	                        
	                    </div>
	                </div>
	                <div class="tr-div">
	                <input type="submit" class="btn btn-outline-success" value="Save" >
<!-- 	                    <div class="td-div"></div>
	                    <div class="td-div">
	                        <button class="btn btn-primary" onclick="save();">Save</button>
	                        <button class="btn btn-primary" onclick="back();">Back</button> 
	                    </div> -->
	                </div>
	            </div>
	            <script>
	                function save(){
	                	location.href="${pageContext.request.contextPath}/community/free/freeInsertFormEnd.do";
	                } 
	                
	                function back(){
	                    location.href="${pageContext.request.contextPath}/community/free/list.do";
	                }
	            </script>
	            </form>
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
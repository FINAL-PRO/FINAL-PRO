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
				<form name="boardFrm" action="${pageContext.request.contextPath}/community/free/freeUpdateFormEnd.do?no=${board.no}" method="post">
	            <div>
	                <b>글쓰기</b>
	                <input type="text" id="bno" name="bno" value="${board.no}" readonly="readonly"/>
	            </div>
	            <div class="table-div">
	                <br>
	                <div class="tr-div">
	                    <div class="td-div">제목</div>
	                    <div class="td-div"><textarea name="title" rows="1" cols="105" style="resize: none;">${board.title}</textarea></div>
	                </div>
	                <div class="tr-div">
	                    <div class="td-div">내용</div>
	                    <div class="td-div">
	                    	<%-- <div id="summernote">${board.content}</div> --%>
                            <%-- <div id="summernote" style="resize: none;" value="${board.content}"></div> --%>
                            <textarea name="content" id="summernote" class="form-control" rows="20" cols="70" required>${board.content}</textarea>
                            <script>
                                $(document).ready(function() {
                                    $('#summernote').summernote({
                                        height: 300
                                    }); 
                                });
                            </script>	                        
	                    </div>
	                </div>
	                <div class="tr-div">
	                    <div class="td-div"></div>
	                    <div class="td-div">
	                        <button class="btn_board_save" id="btn_board_edit">Save</button>
	                        <button class="btn_board_back" id="btn_board_back">Back</button> 
	                    </div>
	                </div>
	            </div>
	            <script>
		            $("#btn_board_save").click(function(){
	           			boardFrm.action="${pageContext.request.contextPath}/community/free/freeUpdateFormEnd.do?no=${board.no}"
	           			boardFrm.submit();
	           		});
	           		
	           		$("#btn_board_back").click(function(){
	           			boardFrm.action="${pageContext.request.contextPath}/community/free/list.do"
	            		boardFrm.submit();
	           		});
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
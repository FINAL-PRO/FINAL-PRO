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
<c:import url="../../common/header.jsp" />

<style>

.board_area {
	padding: 20px;
	margin: 20px;
}

.table-div {
	display: table;
}

.tr-div {
	display: table-row;
	text-align: center;
}

.td-div {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
	padding: 5px;
}

.th-div {
	display: table-header-group;
	text-align: center;
}

#zipCode{
 	display: inline-block;
}

.starRev{
	display: inline-block;
}

.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}

.starR.on{background-position:0 0;}

#foodImg{
	width: 100%;
	height: 100%
}

</style>

</head>
<body>
	<div id="container">
		<c:import url="../../common/menubar.jsp" />
		<div class="wrap_inner">
			<main id="container">
			<section>
				<div class="section-left">
					<!-- 내용없음 -->
				</div>

				<div class="section-center">
					<div class="dc-content">
						<div class="dc-content-title">
							<h1>맛집게시판</h1>
						</div>
						<div class="dc-content-box">
							<div class="board_area">
								<form name="boardFrm" action="${pageContext.request.contextPath}/community/food/foodUpdateFormEnd.do?no=${foodList.no}&fno=${foodList.fno}&pno=${foodList.pno}" method="post">
									<b>글쓰기</b> 
									<input type="text" id="no" name="no" value="${foodList.no}" readonly="readonly" />
									<input type="text" id="fno" name="fno" value="${foodList.fno}" readonly="readonly" />
									<input type="text" id="pno" name="pno" value="${foodList.pno}" readonly="readonly"/>
									<div>
										<div>제목</div>
											<div>
												<input type="text" name="title" id="title" value="${foodList.title}" style="width: 100%;" required>
											</div>
										</div>
										<div class="table-div" style="display:inline-block; border:1px soild black;">
											<div class="tr-div">
													<div class="td-div">카테고리</div>
													<div class="td-div" style="text-align:left;">
														<select id="category" name="category"> 
															<option value="FOOD001">한식</option>
															<option value="FOOD002">일식</option>
															<option value="FOOD003">중식</option>
															<option value="FOOD004">양식</option>
															<option value="FOOD005">카페</option>
															<option value="FOOD006">디저트</option>
														</select>
														<input type="hidden" id="categoryCheck" name="categoryCheck" value="${foodList.category}" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
													</div>
												</div>
											<div class="tr-div">
													<div class="td-div">평점</div>
													<div class="td-div" style="text-align:left;">
														<div class="starRev">
														  <span class="starR" value="1">1</span>
														  <span class="starR" value="2">2</span>
														  <span class="starR" value="3">3</span>
														  <span class="starR" value="4">4</span>
														  <span class="starR" value="5">5</span>
														</div>
														<div>
															&nbsp;
															<input type="hidden" id="point" name="point" value="${foodList.point}" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
														</div>
													</div>
												</div>
												<div class="tr-div">
													<div class="td-div">우편번호</div>
													<div class="td-div" style="text-align:left;">
														<input type="text" id="zipCode" name="zipCode" style="width: 100px;">
														<input type="button" id="ckZip" onclick="addrSearch();" value="검색"/>
													</div>
												</div>
												<div class="tr-div">
													<div class="td-div">주소</div>
													<div class="td-div" style="text-align:left;">
														<input type="text" id="address1" name="address" value="${foodList.address}" style="width: 500px;" required>
													</div>
												</div>
												<div class="tr-div">
													<div class="td-div">상세주소</div>
													<div class="td-div" style="text-align:left;">
														<input type="text" id="address2" name="address2" style="width: 500px;">
													</div>
												</div>
											</div>
										</div>
										<div>
											<div>내용</div>
											<div>
												<textarea name="content" id="summernote" class="form-control" rows="20" cols="70" required>
													${foodList.content}
												</textarea>
												
												<script>
												
													$(document).ready(function(){
														
											    	  var starPoint = $('[name=point]').val();
											    	  console.log("starPoint: "+starPoint);
											    	  
											    	  var j = $('.starRev span');
											    	  
											    	  for(var i=0; i<starPoint; i++){
											    		  $('.starRev span').eq(i).addClass('on');
											    		  console.log(i);
											    	  }

											    	  var categoryCheck = $('[name=categoryCheck]').val();
											    	  console.log("categoryCheck: "+categoryCheck);
											    	  
											    	  $('.category').val('categoryCheck').attr("selected", "selected");
											        	  
														
													});
												
													$('#summernote').summernote({
					                            		height : 300,
					                            		minHeight : 500,
					                            		maxHeight : 500,
					                            		focus : false,
					                            		callbacks : {
					                            			onImageUpload : function(files) {
					                            				for (var i = files.length - 1; i >= 0; i--) {
					                            					sendFile(files[i]);
					                            		}}},
					                            		placeholder: '이미지를 반드시 입력해주세요.'
					                            	});
			                                
					                            	function sendFile(file) {
					                            		var form_data = new FormData();
					                            		form_data.append('file', file);

					                            		$.ajax({
					                            			url : '${pageContext.request.contextPath}/common/summernote/convertImage.do',
					                            			data : form_data,
					                            			type : "POST",
					                            			cache : false,
					                            			contentType : false,
					                            			enctype : 'multipart/form-data',
					                            			processData : false,
					                            			success : function(url) {
					                            				$('#summernote').summernote('editor.insertImage', url);
					                            				console.log("url: "+url);
					                            			},
					                            			error : function() {
					                            				console.log("이미지 업로드 실패");
					                            			}
					                            		});
					                            	}
					                                
					                                function addrSearch() {
					                			        new daum.Postcode({
					                			            oncomplete: function(data) {
					                			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					                			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
					                			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                			                var fullAddr = ''; // 최종 주소 변수
					                			                var extraAddr = ''; // 조합형 주소 변수

					                			                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					                			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					                			                    fullAddr = data.roadAddress;

					                			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
					                			                    fullAddr = data.jibunAddress;
					                			                }

					                			                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					                			                if(data.userSelectedType === 'R'){
					                			                    //법정동명이 있을 경우 추가한다.
					                			                    if(data.bname !== ''){
					                			                        extraAddr += data.bname;
					                			                    }
					                			                    // 건물명이 있을 경우 추가한다.
					                			                    if(data.buildingName !== ''){
					                			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                			                    }
					                			                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					                			                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					                			                }

					                			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
					                			                $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
					                			                
					                			                $('#address1').val(fullAddr);

					                			                // 커서를 상세주소 필드로 이동한다.
					                			                $('#address2').focus();
					                			            }
					                			        }).open();
					                			    };
					                                
					                                $('.starRev span').click(function(){
											        	  $(this).parent().children('span').removeClass('on');
											        	  $(this).addClass('on').prevAll('span').addClass('on');
											        	  var star = 0;
											        	  
											        	  star = Number($(this).text());
											        	  
											        	  console.log("별 값: "+star);
											        
											        	  $('#point').val(star);
											        	  
											        	  return false;
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
										$("#btn_board_save").click(function() {
												boardFrm.action = "${pageContext.request.contextPath}/community/food/foodUpdateFormEnd.do?bno=${foodList.no}"
												boardFrm.submit();
											});

										$("#btn_board_back").click(function() {
												boardFrm.action = "${pageContext.request.contextPath}/community/food/list.do"
												boardFrm.submit();
											});
									</script>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="section-right">
					<c:import url="../../common/rightSection.jsp" />
				</div>
			</section>
			</main>
		</div>
		<c:import url="../../common/footer.jsp" />
</body>
</html>
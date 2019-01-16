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
	margin-left: 10px;
	margin-right: 10px;
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
  width: 25px;
  height: 25px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}

.starR.on{background-position:0 0;}

#foodImg{
	width: 100%;
	height: 100%
}

.btitleBox{
	margin-top: 7px;
}

.bcategoryBox{
	margin-top: 6px;
}

.bscoreBox{
	margin-top: 6px;
}

.bzipCodeBox{
	margin-top: 6px;
}

.baddress1Box{
	margin-top: 6px;
}

.baddress2Box{
	margin-top: 6px;
}

.bcontentBox{
	margin-top: 7px;
}

.bSaveBox{
	text-align: center; 
	padding:10px;
}

.btn-save{
	background: rgb(171, 187, 129);
    color: white;
}

</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
								<form name="boardFrm" action="${pageContext.request.contextPath}/community/food/foodInsertFormEnd.do" method="post">
									<div>
										<b>글쓰기</b>
									</div>
									<div class="btitleBox">
										<input type="text" name="title" id="title" style="width: 100%;" required>
									</div>
									<input type="hidden" id="mno" name="memberNo" value="${member.no}" required>
									
										<div class="add">
											<div style="display:none;">
												<img id="foodImg"/>
												<input type="hidden" name="thumbnail" id="thumbnail" value="" required/>
											</div>
										</div> 
										<div>
											<div class="bcategoryBox">
												<div style="display:inline-block;">카테고리</div>
												<select id="category" name="category"> 
													<option value="" selected disabled hidden>카테고리 선택</option>
													<option value="FOOD001">한식</option>
													<option value="FOOD002">일식</option>
													<option value="FOOD003">중식</option>
													<option value="FOOD004">양식</option>
													<option value="FOOD005">카페</option>
													<option value="FOOD006">디저트</option>
												</select>
											</div>
									
											<div class="bscoreBox">
												<div style="display:inline-block; width:61px;"">평점</div>
												<div style="text-align:left; display:inline-block;">
													<div class="starRev">
													  <span class="starR on">1</span>
													  <span class="starR">2</span>
													  <span class="starR">3</span>
													  <span class="starR">4</span>
													  <span class="starR">5</span>
													<input type="text" id="point" name="point" value="0" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
													</div>
												</div>
											</div>
											
											<div class="bzipCodeBox">
												<div style="display:inline-block;">우편번호</div>
												<div style="display:inline-block;">
													<input type="text" id="zipCode" name="zipCode" style="width: 100px;" required>
													<input type="button" id="ckZip" onclick="addrSearch();" value="검색"/>
												</div>
											<div>
											
											<div class="baddress1Box">
												<div style="display:inline-block; width:61px;">주소</div>
												<div style="text-align:left; display:inline-block;">
													<input type="text" id="address1" name="address1" style="width: 500px;" required>
												</div>
											</div>
											
											<div class="baddress2Box">
												<div style="display:inline-block;">상세주소</div>
												<div style="text-align:left; display:inline-block;">
													<input type="text" id="address2" name="address2" style="width: 500px;" required>
												</div>
											</div>	
											<input type="hidden" id="address" name="address" />
										</div>
									</div>
									<div>
										<div class="bcontentBox">
											<textarea name="content" id="summernote"
												class="form-control" rows="20" cols="70" required></textarea>
										</div>
											<script>
											
												$('#address2').keyup(function(){
												
													var add0 = $('[name=zipCode]').val();
													var add1 = $('[name=address1]').val();
													var add2 = $('[name=address2]').val();
													
													var address = add0 + "  " + add1 + "  " + add2;
													
													console.log("address: "+address);
													
													$('#address').attr('value', address);
																						
												}); 
											
				                                $('#summernote').summernote({
				                            		minHeight : 400,
				                            		maxHeight : 500,
				                            		focus : true,
				                            		callbacks : {
				                            			onImageUpload : function(files) {
				                            				for (var i = files.length - 1; i >= 0; i--) {
				                            					sendFile(files[i]);
				                            		}}},
				                            		placeholder: '이미지를 반드시 입력해주세요. <br> 마지막 이미지가 썸네일이 됩니다.',
				                            		toolbar: [
				                            		    ['style', ['bold', 'italic', 'underline', 'clear']],
				                            		    ['fontsize', ['fontsize']],
				                            		    ['color', ['color']],
				                            		    ['para', ['ul', 'ol', 'paragraph']],
				                            		    ['height', ['height']],
				                            		    ['picture', ['picture', 'video']]
				                            		  ]
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
				                            				
				                            				
				                            				$('#foodImg').attr('src', url);
				                            				$('#thumbnail').attr('value', url);
				                            				
				                            			},
				                            			error : function() {
				                            				console.log("이미지 업로드 실패");
				                            			}
				                            		});
				                            	}
				                            	
				                                $('#foodThumbsnail').on("click", function(){
				                                	$('#inputFile').click();
				                                });
				                                
				                                function inputPicture(value){
				                                	
				                                	if(value.files && value.files[0]) {
				                            			var reader = new FileReader();
				                            			var form_data = new FormData();
				                            			form_data.append('file', value.files[0]);

				                            			$.ajax({
				                            				url : '${pageContext.request.contextPath}/common/summernote/convertImage.do',
				                            				data : form_data,
				                            				type : "POST",
				                            				cache : false,
				                            				contentType : false,
				                            				enctype : 'multipart/form-data',
				                            				processData : false,
				                            				success : function(url) {
				                            					$('#foodImg').attr('src', url);
				                            					$('#thumbnail').attr('value', url);
				                            				}
				                            			});
				                            		}
				                                	
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
									<div class="bSaveBox">
										<input type="submit" class="btn btn-save btn-sm" value="Save">
									</div>
								</div>
								<script>
					                function save(){
					                	location.href="${pageContext.request.contextPath}/community/food/foodInsertFormEnd.do";
					                } 
					                
					                function back(){
					                    location.href="${pageContext.request.contextPath}/community/food/list.do";
					                }
					            </script>
							</form>
							</div>
							</div>
						</div>
					</div>
					<div class="section-right">
						<c:import url="../../common/rightSection.jsp" />
					</div>
				</div>
			</section>
			</main>
		</div>
		<c:import url="../../common/footer.jsp" />
</body>
</html>
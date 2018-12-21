<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Spring</title>
<c:import url="views/common/header.jsp" />
</head>
<body>
	<div id="container" class="col-lg-12 col-md-12">
		<div id="header">
			<c:import url="views/common/menubar.jsp" />
		</div>
		<div id="body" class="col-lg-10">
			<section id="content">
				<div class="m-section-left">
					block-m-left
				</div>
	
				<div class="section-left section-block col-xl-2 col-sm-3">
					block-left
				</div>
	
				<div class="section-center section-block col-xl-8 col-sm-6">
					<table class="table">
						<thead>
							<tr>
								<th>@</th>
								<th>@</th>
								<th>@</th>
								<th>@</th>
							</tr>
						</thead>
							<tbody>
								<c:forEach begin="1" end="25"> 
									<tr>
										<td>asd</td>
										<td>asd</td>
										<td>asd</td>
										<td>asd</td>
									</tr>
								</c:forEach>
							</tbody>
						
					</table>
				</div>
	
				<div class="m-section-right col-12">
					block-m-right
				</div>
	
				<div class="section-right section-block col-xl-2 col-sm-3">
					block-right
				</div>
			</section>
		</div>
		<div id="footer">
		<c:import url="views/common/footer.jsp" />
	</div>
	</div>
</body>
</html>
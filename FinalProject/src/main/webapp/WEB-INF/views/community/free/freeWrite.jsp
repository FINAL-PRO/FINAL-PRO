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
		
		.write_detail{
			background-color: white;
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
				
				<div class="write_detail">
					dfdfd
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
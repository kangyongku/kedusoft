<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="divMenu menus">
	<ul>
		<li><a href="/orginfo/outline" >서비스 개요</a></li>
		<li><a href="/orginfo/content" >서비스 내용</a></li>
		<li><a href="/orginfo/map" >찾아오시는 길</a></li>
	</ul>
</div>
<section class="sub_con">
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
		<div class="content">
			<div class="contentTitleArea">
				<h3>${menuDto.title }</h3>
				<span class="directory">서비스 분야 >　${menuDto.title  }</span>
			</div>
			
			<div style="width: 100%; text-align: center; padding: 10px;">
			<img src=/images/main/map.jpg class=w540>
			</div>
		</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
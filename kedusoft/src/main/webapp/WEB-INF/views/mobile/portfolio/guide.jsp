<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="divMenu menus">
		<ul>
			<li><a href="/portfolio/guide" >포트폴리오 안내</a></li>
			<li><a href="/portfolio/content" >포트폴리오 내용</a></li>
		</ul>
	</div>
	<section class="sub_con">
		<%@ include file="/WEB-INF/views/include/left.jsp"%>
		<div class="content">
			<div class="contentTitleArea">
				<h3>${menuDto.title }</h3>
				<span class="directory">포트폴리오 >　${menuDto.title  }</span>
			</div>
			
			<br><br><br><br><br>
			<div style="text-align: center;">
			<font style="font-size: 22px;">"등록된 게시글이 없습니다."</font>
			</div>
		
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
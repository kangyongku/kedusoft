<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="pragma" content="no-cache" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>케듀소프트 홈페이지에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="/css/kor/basic.css" media="all">
<link rel="stylesheet" type="text/css" href="/css/kor/layout.css" media="all">
<link rel="stylesheet" type="text/css" href="/css/kor/content.css" media="all">
<link rel="stylesheet" type="text/css" href="/css/kor/added_sub.css" media="all">
<link rel="stylesheet" type="text/css" href="/css/kor/jquery.fullpage.min.css" media="all">

<link rel="stylesheet" type="text/css" href="/css/common/xeicon.min.css" media="all">
<link rel="stylesheet" type="text/css" href="/css/common/swiper.css" media="all">

<link rel="stylesheet" type="text/css" href="/css/common/mainSlide.css" media="all">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/kor/common.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/kor/jquery.fullPage.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/common/swiper.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/kor/slider.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/kor/koglOpen.js" charset="utf-8"></script>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
  
	<div class="slide slide_wrap">
		<div class="sildeBg11 slide_item">
			<div class="silideInner01">
				<a href="/project/contact">
				<div class="silideInner02">
					<div class="mainCenterFont">맞춤형 솔루션</div>
					<div class="mainRoundBox">AI혁신기반구축</div>
					<div class="mainBnExplain">친화적인 AAL(Active  Assisted Living) 기반의<br>맞춤형 솔루션 구축 및 안정적인 유지보수</div>
					<div class="mainSquareBox">프로젝트 문의</div>
				</div>
				</a>
			</div>
		</div>
		<!--
		<div class="slide_prev_button slide_button"><img src="/images/main/arrow_left.png"></div>
		<div class="slide_next_button slide_button"><img src="/images/main/arrow_right.png"></div>
		<ul class="slide_pagination"></ul>
		-->
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
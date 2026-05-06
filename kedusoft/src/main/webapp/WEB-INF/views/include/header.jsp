<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function(){
	if (navigator.userAgent.toUpperCase().indexOf('TRIDENT') == -1) {
		$('#fullpage').fullpage({
			sectionSelector: 'section',
			anchors: ['firstPage', 'secondPage', '3rdPage','footerPage'],
			menu: '#menu',
			responsiveWidth:1400,
			responsiveHeight:900,
			recordHistory: true,
			animateAnchor: false,
			afterLoad: function (anchorLink, index) {
				if (index) {
					$('#menu').show();
					$('#menu li a').removeClass("color");
					$('#header').removeClass('white');
				}
				if(index==3){
					$('#header').addClass('white');
					$('#menu li a').addClass("color");
				}
				if(index==4){
					$('#header').addClass('white');
					$('#menu').hide();
				}
			},
			afterResponsive: function(isResponsive){
				$('#header').css('position','absolute');
			}
		});
	}
	
	if(location.pathname == '/'){
		$(".subVisual").css("display","none");
	}
});
</script>
<!-- Mobile Gnb -->
<div class="menuMo">
	<div class="hd">
		<div class="logo"><a href="/" title="메인화면"><span class="blind">로고</span></a></div>
		<div class="rb">
			<c:choose>
				<c:when test="${not empty loginInfo }">
					<a href="/member/info" class="all_menu" title="회원정보수정"><img src="/images/main/icoLoginfo.png" width="25"></a>
					<a href="/member/logout" class="all_menu" title="로그아웃"><img src="/images/main/icoLogout.png" width="25"></a>
					
				</c:when>
				<c:otherwise>
					<a href="/member/login" class="all_menu" title="로그인">
						<img src="/images/main/icoLogin.png?a=1" width="25">
					</a>
				</c:otherwise>
			</c:choose>
			<a href="#" class="trigger" title="사이트맵" style="padding-top:3px;"><font size=6>≡</font></a>
			<button class="close" title="닫기"><span class="blind">닫기</span></button>
		</div>
	</div>
	<div class="menu_cont">
		<nav id="mo_gnb">
		<ul>
			<li class="more">
				<li class="more"><button>서비스 분야</button>
					<ul class="mo_gnb_depth2">
						<li><a href="/orginfo/outline" >서비스 개요</a></li>
						<li><a href="/orginfo/content" >서비스 내용</a></li>
						<li><a href="/orginfo/map" >찾아오시는 길</a></li>
					</ul>
				</li>
			</li>
			<li class="more">
				<li class="more"><button>포트폴리오 안내</button>
					<ul class="mo_gnb_depth2">
						<li><a href="/portfolio/guide">포트폴리오 안내</a></li>
						<li><a href="/portfolio/content">포트폴리오 내용</a></li>
					</ul>
				</li>
			</li>
			<li class="more">
				<li class="more"><button>프로젝트 문의</button>
					<ul class="mo_gnb_depth2">
						<li><a href="/project/contact">프로젝트 문의</a></li>
						<li><a href="/project/application">프로젝트 내역 확인</a></li>
					</ul>
				</li>
			</li>
			<li class="more">
				<li class="more"><button>고객지원</button>
					<ul class="mo_gnb_depth2">
						<li><a href="/support/notice">공지사항</a></li>
						<li><a href="/support/press">보도자료</a></li>
						<li><a href="/support/qna">Q&A</a></li>
					</ul>
				</li>
			</li>

		</ul>
		</nav>
	</div>
</div>
<div class="menuMo_bg"></div>
<!--//Mobile Gnb-->

<header id="header">
	<div class="bg"></div>
	<h1 class="logo"><a href="/" title="케듀소프트">케듀소프트</a></h1>
	<nav id="gnb">
		<ul>
			<li><a href="/orginfo/outline">서비스 분야</a>
				<div class="depth02_menu_wrap">
					<div class="inner">
						<ul class="gnb_depth2" style="margin-right: 210px;">
							<li><a href="/orginfo/outline" >서비스 개요</a></li>
							<li><a href="/orginfo/content" >서비스 내용</a></li>
							<li><a href="/orginfo/map" >찾아오시는 길</a></li>
						</ul>
					</div>
				</div>
			</li>
			<li><a href="/portfolio/guide">포트폴리오</a>
				<div class="depth02_menu_wrap">
					<div class="inner">
						<ul class="gnb_depth2">
							<li><a href="/portfolio/guide">포트폴리오 안내</a></li>
							<li><a href="/portfolio/content">포트폴리오 내용</a></li>
						</ul>
					</div>
				</div>
			</li>
			<li><a href="/project/contact">프로젝트 문의</a>
				<div class="depth02_menu_wrap">
					<div class="inner">
						<ul class="gnb_depth2">
							<li><a href="/project/contact">프로젝트 문의</a></li>
							<li><a href="/project/application">프로젝트 내역 확인</a></li>
						</ul>
					</div>
				</div>
			</li>
			<li><a href="/support/notice">고객지원</a>
				<div class="depth02_menu_wrap">
					<div class="inner">
						<ul class="gnb_depth2">
							<li style="border:0px;"></li>
							<li></li>
							<li><a href="/support/notice">공지사항</a></li>
							<li><a href="/support/notice">보도자료</a></li>
							<li><a href="/support/qna">Q&A</a></li>
						</ul>
					</div>
				</div>
			</li>
		</ul>
	</nav>
	<div class="rb">
		<c:choose>
			<c:when test="${not empty loginInfo }">
				<a href="/member/info" class="all_menu" title="회원정보수정"><img src="/images/main/icoLoginfo.png" width="25"></a>
				<a href="/member/logout" class="all_menu" title="로그아웃"><img src="/images/main/icoLogout.png" width="25"></a>
			</c:when>
			<c:otherwise>
				<a href="/member/login" class="all_menu" title="로그인">
					<img src="/images/main/icoLogin.png?a=1" width="25">
				</a>
			</c:otherwise>
		</c:choose>
		<a href="#" class="trigger" title="사이트맵"><font size=6>≡</font></a>
	</div>
	<button type="button" class="mobile_menu" title="모바일 메뉴"></button>
</header>
<div class="subVisual">
	<div class="visualAreaItem">
		<div class="visualAreaItemTitle">
		<span>맞춤형 솔루션 </span><span>기반구축</span>
		</div>
		정교한 솔루션 구축 및 안정적인 유지보수
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script type="text/javascript" src="/js/common/mainSlide.js" charset="utf-8"></script>

<div class="footerArea">
	<div class="footerInner01">
		<div class="footerInner02">
			<div class="mfooter1">
				<a href="/policy/terms">이용약관</a><a>|</a>
				<a href="/policy/privacy">개인정보처리방침</a><a>|</a>
				<a href="#" class="trigger">사이트맵</a>
				<br>서울 금천구 가산디지털1로168 우림라이온스밸리 A동 1004호 TEL.02-2026-5221
				<br>COPYRIGHT ⓒ 케듀소프트. All Rights Reserved.
			</div>
			<div class="mfooter2">
				<select name=familySite style="width: 180px; font-size:16px; text-align:center;" onchange="javascript:if(this.value!='') {var newWinSize1=window.open(this.value);newWinSize1.focus();}">
					<option>Family Site</option>
					<option value="https://www.kedui.com">(주)케듀아이</option>
				</select>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
$( document ).ready(function() {
	$('.trigger').click(function(){
		$('#popup_layer, #overlay_t').show();
		$('#popup_layer').css("top", "0px");
	});
	$('#overlay_t, .closeSM').click(function(e){
		e.preventDefault();
		$('#popup_layer, #overlay_t').hide();
	});
});
</script>
<div id="overlay_t"></div>
<div id="popup_layer">
	<div class="divSitemap">
		<div class="divSitemapCenter">
			<div class="smCon">
				<div class="smX">
					<a href="#" class="closeSM">X</a>
				</div>
			</div>
			<div class="smCon">
				<div class="smLogo">
					<img src="/images/main/logoW.png">
				</div>
			</div>
			<div class="smCon">
				<div class="smMenu">서비스 분야</div>
				<div class="smList">
					<a href="/orginfo/outline" >서비스 개요</a>
					<a href="/orginfo/content" >서비스 내용</a>
					<a href="/orginfo/map" >찾아오시는 길</a>
				</div>
			</div>
			<div class="smCon">
				<div class="smMenu">포트폴리오</div>
				<div class="smList">
					<a href="/portfolio/guide">포트폴리오 안내</a>
					<a href="/portfolio/content">포트폴리오 내용</a>
				</div>
			</div>
			<div class="smCon">
				<div class="smMenu">프로젝트 문의</div>
				<div class="smList">
					<a href="/project/contact">프로젝트 문의</a>
					<a href="/project/application">프로젝트 내역 확인</a>
				</div>
			</div>
			<div class="smCon">
				<div class="smMenu">고객지원</div>
				<div class="smList">
					<a href="/support/notice">공지사항</a>
					<a href="/support/notice">보도자료</a>
					<a href="/support/qna">Q&A</a>
				</div>
			</div>
			<div class="smCon">
				<div class="smMenu">정책</div>
				<div class="smList">
					<a href="policy/terms">이용약관</a>
					<a href="policy/privacy">개인정보처리방침</a>
				</div>
			</div>
			<div class="smCon">
				<div class="smMenu">계정</div>
				<div class="smList">
					<a href="member/login">로그인</a>
					<a href="member/join">회원가입</a>
					<a href="member/find">계정찾기</a>
				</div>
			</div>
		</div>
	</div>
</div>
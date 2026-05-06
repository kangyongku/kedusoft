<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="divMenu menus">
	<ul>
		<li><a href="/member/login" >로그인</a></li>
		<li><a href="/member/join" >회원가입</a></li>
		<li><a href="/member/find" >계정찾기</a></li>
	</ul>
</div>
<section class="sub_con">
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
		<div class="content">
			<div class="contentTitleArea">
				<h3>${menuDto.title }</h3>
				<span class="directory">${menuDto.title  }</span>
			</div>
			
			<form name="f" method="post">
			<input type=hidden name="searTypeId">
			<h4>ㆍ아이디 찾기</h4>
			<div class="bbsWidth writeArea">
				<div class="writeLine">
					<div class="writeLeftTitle">성　명<fcr>*</fcr></div>
					<div class="writeRight tl"><input type="text" name=userName class="writeSubject"></div>
				</div>
				<div class="writeLine">
					<div class="writeLeftTitle">휴대폰<fcr>*</fcr></div>
					<div class="writeRight tl"><input type="text" name=mtel class="writeSubject"> '-' 포함</div>
				</div>
			</div>
			<br><br><br>
			<div class="bbsWidth">
				<div class="board_search" style="text-align:center;">
					<a href="javascript:searchIdpw(1);"><span class=bbsSearch>확 인</span></a>
				</div>
			</div>
			<br><br><br><h4>ㆍ비밀번호 찾기</h4>
			<div class="bbsWidth writeArea">
				<div class="writeLine">
					<div class="writeLeftTitle">아이디<fcr>*</fcr></div>
					<div class="writeRight tl"><input type="text" name=userId class="writeSubject"></div>
				</div>
				<div class="writeLine">
					<div class="writeLeftTitle">휴대폰<fcr>*</fcr></div>
					<div class="writeRight tl"><input type="text" name=mtel2 class="writeSubject"> '-' 포함</div>
				</div>
			</div>
			<br><br><br>
			<div class="bbsWidth">
				<div class="board_search" style="text-align:center;">
					<a href="javascript:searchIdpw(2);"><span class=bbsSearch>확 인</span></a>
				</div>
			</div>
			</form>
		</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
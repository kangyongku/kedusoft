<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="divMenu menus">
		<ul>
			<li><a href="/project/contact" >프로젝트 문의</a></li>
			<li><a href="/project/application" >프로젝트 내역 확인</a></li>
		</ul>
	</div>
	<section class="sub_con">
		<%@ include file="/WEB-INF/views/include/left.jsp"%>
		<div class="content">
			<div class="contentTitleArea">
				<h3>${menuDto.title }</h3>
				<span class="directory">프로젝트 문의 >　${menuDto.title  }</span>
			</div>
			
			<h4>ㆍ문의절차</h4>
			<img src=/images/main/process.gif style="border:1px solid silver;">
			
			<form name="f" method="post">
				<input type="hidden" name="nextPage" value="/sub/menu32.asp">
				<input type="hidden" name="appId" value="${appId }">
				<input type="hidden" name="appTypeId" value="${appTypeId}">
				<input type="hidden" name="upTypeId">
				<br><br><br><h4>ㆍ기본정보</h4>
				<div class="bbsWidth writeArea">
					<div class="writeLine">
						<div class="writeLeftTitle">내용<fcr>*</fcr></div>
						<div class="writeRight tl">
							<select name=reqType style="width: 80%;">
							<option value="자격검정">자격검정 시스템 구축</option>
							<option value="행정관리">행정관리 시스템 구축</option>
							<option value="업무시스템">업무시스템 구축</option>
							<option value="기타">기타</option>
							</select>
						</div>
					</div>
					<div class="writeLine">
						<div class="writeLeftTitle">소속기업<fcr>*</fcr></div>
						<div class="writeRight tl"><input name="compName" type="text" class="writeSubject" value=""></div>
					</div>
					<div class="writeLine">
						<div class="writeLeftTitle">담당자 성명<fcr>*</fcr></div>
						<div class="writeRight tl"><input name="userName" type="text" class="writeSubject" value=""></div>
					</div>
					<div class="writeLine">
						<div class="writeLeftTitle">소속부서<fcr>*</fcr></div>
						<div class="writeRight tl"><input name="compPart" type="text" class="writeSubject" value=""></div>
					</div>
					<div class="writeLine">
						<div class="writeLeftTitle">직위<fcr>*</fcr></div>
						<div class="writeRight tl"><input name="compPosition" type="text" class="writeSubject" value=""></div>
					</div>
					<div class="writeLine">
						<div class="writeLeftTitle">연락처(사무실)</div>
						<div class="writeRight tl">
							<select name="tel1" class="writeText" style="width:75px; ">
								<option value="">선택</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="070">070</option>
							</select>-
							<input name="tel2" type="text" class="writeText2" maxlength=4 value="">-
							<input name="tel3" type="text" class="writeText2" maxlength=4 value="">
							</div>
					</div>
					<div class="writeLine">
						<div class="writeLeftTitle">연락처(휴대폰)<fcr>*</fcr></div>
						<div class="writeRight tl">
							<select name="mtel1" class="writeText" style="width:60px; ">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="016">016</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>-
							<input name="mtel2" type="text" class="writeText2" maxlength=4 value="">-
							<input name="mtel3" type="text" class="writeText2" maxlength=4 value="">
							</div>
					</div>
					<div class="writeLine" style="height: 110px;">
						<div class="writeLeftTitle">이메일<fcr>*</fcr></div>
						<div class="writeRight tl">
						<input name="mailId" type="text" class="writeText" value="" style="width: 35%;"> @ 
						<input name="mailDomain" id="domain" type="text" class="writeText" value="" style="width: 35%;">
						<br/>
						<select onchange="javascript:document.getElementById('domain').value=this.value;" class="writeText" style="width: 50%;">
							<option value="">직접입력</option>
							<option value='naver.com'>naver.com</option>
							<option value='hanmail.net'>hanmail.net</option>
							<option value='daum.net'>daum.net</option>
							<option value='nate.com'>nate.com</option>
							<option value='hotmail.com'>hotmail.com</option>
							<option value='kakao.com'>kakao.com</option>
							<option value='paran.com'>paran.com</option>
							<option value='yahoo.com'>yahoo.com</option>
						</select>
						</div>
					</div>
					<div class="writeLine" style="height: 300px;">
						<div class="writeLeftTitle">상세내용<fcr>*</fcr></div>
						<div class="writeRight tl">
							<textarea style="width:100%; height:270px; padding:15px; font-size:16px; line-height:20px; border:1px solid silver;"></textarea>
						</div>
					</div>
				</div>
				<br><br><br><h4>ㆍ개인정보수집동의</h4>
				<div class="bbsWidth">
					<textarea style="width:100%; height:270px; padding:15px; font-size:16px; line-height:20px; border:1px solid silver;">
	케듀소프트 개인정보취급방침
	'케듀소프트'은 (이하 '사업단'은) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 사업단은 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 사업단은 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
	
	[수집하는 개인정보 항목]
	사업단은 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
	수집항목 : 담당자 성명 , 이메일, 연락처(전화번호 또는 휴대폰번호)
	서비스 이용 과정이나 서비스 제공 업무 처리 과정에서 다음과 같은 정보들이 자동으로 생성되어 수집될 수 있습니다. : 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보
	개인정보 수집방법 : 홈페이지</textarea>
								</div>
								<input id="agreePolicy" type="checkbox"> 동의합니다.<br><br><br>
								<div id="divConfirm" class="bbsWidth">
									<div class="board_search" style="text-align:center;">
						<a href="javascript:regApp();"><span class=bbsSearch>확 인</span></a>
					</div>
				</div>
				</form>
			
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
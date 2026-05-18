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
			
			<script src="/include/aes.js"></script>
							<script>
							function funcCheckId() {
								// 20260518 Y.C.H 수정
								var f = document.f;
								
								// 아이디 값 확인
								if (f.userId.value=="") {
									alert("아이디를 입력해 주세요."); 
									f.userId.focus(); return; 
								}
								
					            $.ajax({
					                url : "/member/checkId", // 결과를 처리할 JSP 페이지
					                type : "post",
					                data : { "memberId" : f.memberId.value },
					                success : function(res){

					                    alert(res.msg);
					                    if(res.success != true){
					                        return false;
					                    }
					                    
					                    // ---------- 아이디 사용가능시 처리 로직 START ----------
					                    
					                    // ---------- 아이디 사용가능시 처리 로직 END ----------
					                    
					                },
					                error : function(){
					                    alert("에러가 발생했습니다.");
					                }
					            });								
							}
							
							function goNext() {
							
/* 								if(!document.getElementById("agreePolicy").checked) {
									document.getElementById("agreePolicy").focus();
									alert('개인정보수집동의에 체크해 주세요.');
									return;
								} */

								var f = document.f;
							
								//console.log(f);
								
/* 								if (f.memberId.value=="") {alert("아이디를 입력해 주세요."); f.memberId.focus(); return; }
								if (f.pw1.value=="") {alert("비밀번호를 입력해 주세요."); f.pw1.focus(); return; }
								if (f.pw2.value=="") {alert("비밀번호를 입력해 주세요."); f.pw2.focus(); return; }
								if (f.pw1.value.length<8) {alert("비밀번호는 8자리 이상입니다."); f.pw1.focus(); return; }
								if (f.pw1.value!=f.pw2.value) {alert("비밀번호를 확인해 주세요."); f.pw2.focus(); return; }
								if (f.memberName.value=="") {alert("성명을 입력해 주세요."); f.memberName.focus(); return; }
								if (f.mtel1.value=="") {alert("휴대폰번호를 입력해 주세요."); f.mtel1.focus(); return; }
								if (f.mtel2.value=="") {alert("휴대폰번호를 입력해 주세요."); f.mtel2.focus(); return; }
								if (f.mtel3.value=="") {alert("휴대폰번호를 입력해 주세요."); f.mtel3.focus(); return; }
								if (!f.mailId.value) { alert("이메일 주소를 입력하세요!"); form1.mailId.focus(); return; }
								if (!f.mailDomain.value) { alert("이메일 주소를 입력하세요!"); form1.mailDomain.focus(); return; }

								f.passwd.value = CryptoJS.MD5(f.pw1.value);
								f.pw1.value = "";
								f.pw2.value = "";
								 
								f.target="_self";
								f.action="/member/memberJoin"
								f.submit();*/
								
						        let formDataArray = $('#myForm').serializeArray();
						        let formDataObj = {};
						        
						        $.each(formDataArray, function(i, field) {
						            formDataObj[field.name] = field.value;
						        });			
						        
						        console.log(formDataObj);
								
					            $.ajax({
					                url : "/member/memberJoin", // 결과를 처리할 JSP 페이지
					                type : "post",
					                data : JSON.stringify(formDataObj),
					                contentType: 'application/json; charset=UTF-8',
					                success : function(res){

					                    alert(res.msg);
					                    if(res.success != true){
					                        return false;
					                    }
					                    
					                    // ---------- 아이디 사용가능시 처리 로직 START ----------
					                    
					                    // ---------- 아이디 사용가능시 처리 로직 END ----------
					                    
					                },
					                error : function(){
					                    alert("에러가 발생했습니다.");
					                }
					            });	
							}
							</script>
							<form name=f method=post id="myForm">
							<h4>ㆍ기본정보</h4>
							<div class="bbsWidth writeArea">
								<div class="writeLine">
									<div class="writeLeftTitle">아이디<fcr>*</fcr></div>
									<div class="writeRight tl"><input name="memberId" id="memberId" type="text" class="writeSubject">
										&nbsp;<a href="javascript:funcCheckId();">[검색]</a>
										</div>
								</div>
								<div class="writeLine">
									<div class="writeLeftTitle">비밀번호<fcr>*</fcr></div>
									<div class="writeRight tl"><input name="pw1" type="password" class="writeSubject"></div>
									<input type="hidden" name="passwd">
								</div>
								<div class="writeLine">
									<div class="writeLeftTitle">비밀번호 확인<fcr>*</fcr></div>
									<div class="writeRight tl"><input name="pw2" type="password" class="writeSubject"></div>
								</div>
								<div class="writeLine">
									<div class="writeLeftTitle">성 명<fcr>*</fcr></div>
									<div class="writeRight tl"><input name="memberName" type="text" class="writeSubject"></div>
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
										</select>-<input name="mtel2" type="text" class="writeText2" maxlength=4>-<input name="mtel3" type="text" class="writeText2" maxlength=4>
										</div>
								</div>
								<div class="writeLine">
									<div class="writeLeftTitle">이메일<fcr>*</fcr></div>
									<div class="writeRight tl"><input name="mailId" type="text" class="writeText">@<input name="mailDomain" id="domain" type="text" class="writeText">
										<select onchange="javascript:document.getElementById('domain').value=this.value;" class="writeText">
										<option value="">직접입력</option>
										<option value='naver.com'>naver.com</option>
										<option value='hanmail.net'>hanmail.net</option>
										<option value='daum.net'>daum.net</option>
										<option value='nate.com'>nate.com</option>
										<option value='hotmail.com'>hotmail.com</option>
										<option value='kakao.com'>kakao.com</option>
										<option value='paran.com'>paran.com</option>
										<option value='yahoo.com'>yahoo.com</option>
										</select></div>
								</div>
							</div>
							<br><br><br><h4>ㆍ개인정보수집동의</h4>
							<div class="bbsWidth">
								<textarea style="width:100%; height:270px; padding:15px; font-size:16px; line-height:20px; border:1px solid silver;">
지능형 홈케어 통합지원 기반구축 사업단 개인정보취급방침
'지능형 홈케어 통합지원 기반구축 사업단'은 (이하 '사업단'은) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 사업단은 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 사업단은 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

[수집하는 개인정보 항목]
사업단은 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
수집항목 : 담당자 성명 , 이메일, 연락처(전화번호 또는 휴대폰번호)
서비스 이용 과정이나 서비스 제공 업무 처리 과정에서 다음과 같은 정보들이 자동으로 생성되어 수집될 수 있습니다. : 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보
개인정보 수집방법 : 홈페이지</textarea>
							</div>
							<input id="agreePolicy" type=checkbox> 동의합니다.<br><br><br>
							<div class="bbsWidth">
								<div class="board_search" style="text-align:center;">
									<a href='javascript:goNext();'><span class=bbsSearch>확 인</span></a>
								</div>
							</div>
							</form>
		</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
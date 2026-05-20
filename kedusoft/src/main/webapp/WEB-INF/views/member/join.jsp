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
	
		let isIdChecked = false;   // 중복체크 여부
		let checkedId = "";        // 체크 완료된 아이디
		
		// 아이디 체크 후 변경시 초기화 
		$("#memberId").on("input", function(){
		    isIdChecked = false;
		    checkedId = "";
		    
		    // css 없어서 위로 체크 함
		});		
	
		// 20260518 Y.C.H 수정 ( 회원가입 아이디 검색 ) 
		function funcCheckId() {
			
			var f = document.f;
			
			// 아이디 값 확인
			if (f.memberId.value=="") {
				alert("아이디를 입력해 주세요."); 
				f.memberId.focus(); return; 
			}
			
			let formDataObj = { "memberId" : f.memberId.value };
			
            $.ajax({
                url : "/member/checkId", // 결과를 처리할 JSP 페이지
                type : "post",
                data : JSON.stringify(formDataObj),
                contentType: 'application/json; charset=UTF-8',
                success : function(res){
					console.log(res);
                    alert(res.message);
                    if(res.success != true){
                    	
                    	isIdChecked = false;
                    	checkedId = "";
                    	$("#memberId").focus();
                    	
                        return false;
                    }
                    
                    // ---------- 아이디 사용가능시 처리 로직 START ----------
                        isIdChecked = true;
    					checkedId = $("#memberId").val();
    					
    				    // 입력창 readonly 처리 (선택)
    				    // $("#memberId").prop("readonly", true);  					
    					
                    // ---------- 아이디 사용가능시 처리 로직 END ----------
                    
                },
                error : function(){
                    alert("에러가 발생했습니다.");
                }
            });								
		}
		
		// 회원가입 등록
		function goNext() {
			
			// fomr Data
			var f = document.f;
	        // 공백제거
	        const trim = (val) => $.trim(val);
	        
	        let formDataArray = $('#joinForm').serializeArray();
	        let formDataObj = {};	        

	        // 값 가져오기
	        let memberId   = trim($("#memberId").val());
	        let pw1        = trim($("input[name='pw1']").val());
	        let pw2        = trim($("input[name='pw2']").val());
	        let memberName = trim($("input[name='memberName']").val());
	        let mtel1      = trim($("input[name='mtel1']").val());
	        let mtel2      = trim($("input[name='mtel2']").val());
	        let mtel3      = trim($("input[name='mtel3']").val());
	        let mailId     = trim($("input[name='mailId']").val());
	        let mailDomain = trim($("input[name='mailDomain']").val());

	        // =========================
	        // 1. 아이디 체크
	        // =========================
	        let idReg = /^[a-zA-Z0-9]{4,12}$/;
	        if(memberId === ""){
	            alert("아이디를 입력하세요.");
	            $("#memberId").focus();
	            return false;
	        }
	        if(!idReg.test(memberId)){
	            alert("아이디는 영문/숫자 4~12자리입니다.");
	            $("#memberId").focus();
	            return false;
	        }
	        
	        if(!isIdChecked){
	            alert("아이디 중복체크를 해주세요.");
	            $("#memberId").focus();
	            return false;
	        }	        
	        
	        // 체크 이후 아이디 변경 방지( 중복체크 )
	        if(checkedId !== $("#memberId").val()){
	            alert("아이디 중복체크를 다시 해주세요.");
	            $("#memberId").focus();
	            return false;
	        }	        
			
	        // =========================
	        // 2. 비밀번호 체크
	        // =========================
	        let pwReg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,16}$/;
	        if(pw1 === ""){
	            alert("비밀번호를 입력하세요.");
	            $("input[name='pw1']").focus();
	            return false;
	        }
/* 	        if(!pwReg.test(pw1)){
	            alert("비밀번호는 영문, 숫자, 특수문자 포함 8~16자리입니다.");
	            $("input[name='pw1']").focus();
	            return false;
	        } */

	        if(pw2 === ""){
	            alert("비밀번호 확인을 입력하세요.");
	            $("input[name='pw2']").focus();
	            return false;
	        }
	        if(pw1 !== pw2){
	            alert("비밀번호가 일치하지 않습니다.");
	            $("input[name='pw2']").focus();
	            return false;
	        }
	        formDataObj['memberPassword'] = pw1;
	        
	        // =========================
	        // 3. 이름 체크
	        // =========================
	        let nameReg = /^[가-힣a-zA-Z]+$/;
	        if(memberName === ""){
	            alert("이름을 입력하세요.");
	            $("input[name='memberName']").focus();
	            return false;
	        }
	        if(!nameReg.test(memberName)){
	            alert("이름은 한글 또는 영문만 입력 가능합니다.");
	            $("input[name='memberName']").focus();
	            return false;
	        }
	        
	        // =========================
	        // 4. 휴대폰 체크
	        // =========================
	        let telReg = /^[0-9]{3,4}$/;

	        if(mtel2 === "" || mtel3 === ""){
	            alert("휴대폰 번호를 입력하세요.");
	            $("input[name='mtel2']").focus();
	            return false;
	        }

	        if(!telReg.test(mtel2) || !telReg.test(mtel3)){
	            alert("휴대폰 번호는 숫자 3~4자리로 입력하세요.");
	            $("input[name='mtel2']").focus();
	            return false;
	        }
	        formDataObj['memberPhone'] = (mtel1 + mtel2+ mtel3);
	        
	        // =========================
	        // 5. 이메일 체크
	        // =========================
	        let email = mailId + "@" + mailDomain;
	        let emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,}$/;

	        if(mailId === "" || mailDomain === ""){
	            alert("이메일을 입력하세요.");
	            $("input[name='mailId']").focus();
	            return false;
	        }

	        if(!emailReg.test(email)){
	            alert("올바른 이메일 형식이 아닙니다.");
	            $("input[name='mailId']").focus();
	            return false;
	        }
	        formDataObj['memberEmail'] = email;

	        // =========================
	        // 6. 개인정보 동의 체크
	        // =========================
	        if(!$("#agreePolicy").is(":checked")){
	            alert("개인정보 수집에 동의해야 합니다.");
	            $("#agreePolicy").focus();
	            return false;
	        }else{
	        	formDataObj['privacyAgree'] = 'Y'
	        }	        
			
	        $.each(formDataArray, function(i, field) {
	            formDataObj[field.name] = field.value;
	        });
	        
	        if(confirm("입력하신 정보로 회원 가입 하시겠습니까?")){
	            $.ajax({
	                url : "/member/userJoin", // 결과를 처리할 JSP 페이지
	                type : "post",
	                data : JSON.stringify(formDataObj),
	                contentType: 'application/json; charset=UTF-8',
	                success : function(res){
	
	                    alert(res.message);
	                    if(res.success != true){
	                        return false;
	                    }
	                    // ---------- 아이디 사용가능시 처리 로직 START ----------
	                    	 location.href = '/member/login';	// 로그인 페이지로 이동
	                    // ---------- 아이디 사용가능시 처리 로직 END ----------
	                },    
	                error : function(){
	                    alert("에러가 발생했습니다.");
	                }
	            });	
	        }	        
		}
	</script>
	
	<form name=f method=post id="joinForm">
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
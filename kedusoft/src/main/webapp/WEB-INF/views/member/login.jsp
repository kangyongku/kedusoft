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
			
			<div class="loginArea">
				<div class="loginTitle w600">
					<img src=/images/main/logoB.png><br>사이트에 방문하신 것을 환영합니다.
				</div>
				<form id="loginForm" name="loginForm" action="/member/userLogin" method="post">
					<div class="loginBox">
						<div class="loginIdPw">
							<div class="loginId">
								<input type=text name=userId maxlength=20 style="width:250px; height:35px;" id=inputId>
							</div>
							<div class="loginPw">
								<input type=password name=userPw maxlength=20 onkeypress='javascript:enter();' style="width:250px; height:35px;" id=inputPw>
								<input type=hidden name=passwd>
							</div>
						</div>
						<div class="loginIdPw">
							<div class="confirmBox">
								<a href='javascript:funcLogin();'><div class="confirmButton">확 인</div></a>
							</div>
						</div>
					</div>
				</form>		
				<div class="loginText tl">
					<input type=checkbox name=saveId style="border:0"> 아이디 저장　
					<input type="checkbox" name="ssl_use" value="1" style="border:0" checked> 보안접속　
				</div>
				<div class="loginText tl">
				</div>
				<div class="loginText tl">
				</div>
				<div class="loginTitle w600">
				</div>
				<div class="loginText tl loginBox2">
					ㆍ아직 회원이 아니세요?
					<div class="confirmBox">
						<a href="/member/join"><div class="confirmButton2">회원가입</div></a>
					</div>
				</div>
				<div class="loginText tl loginBox2">
					<div>
					ㆍ아이디와 비밀번호 기억나지 않아요
					</div>
					<div class="confirmBox">
						<a href="/member/find"><div class="confirmButton2">ID/PW찾기</div></a>
					</div>
				</div>
			</div>
		</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>
	// 유효성 검사 및 서브밋 처리
	function funcLogin() {
	    var id = $("#inputId").val();
	    var pw = $("#inputPw").val();
	
	    if($.trim(id) === "") {
	        alert("아이디를 입력해주세요.");
	        $("#inputId").focus();
	        return;
	    }
	    
	    if($.trim(pw) === "") {
	        alert("비밀번호를 입력해주세요.");
	        $("#inputPw").focus();
	        return;
	    }
	
	    //$("#loginForm").submit();
	    

	    // 서버로 전송
        $.ajax({
            url : "/member/userLogin", // 결과를 처리할 JSP 페이지
            type : "post",
            data : JSON.stringify({"memberId" : id, "memberPassword" : pw}),
            contentType: 'application/json; charset=UTF-8',
            success : function(res){
				
				alert(res.message);
                // 로그인
               	if(res.success == false){
               		return false;
               	}else {
               		
                	var $form = $('<form></form>');
               		$form.attr('action', '/');	  // 전송할 URL
               		$form.attr('method', 'get');             // 전송 방식 (post/get)
               		
               		$form.appendTo('body').submit(); 
               	}
            },
            error : function(){
                alert("에러가 발생했습니다.");
            }
        });
	    
	    
	}
	
	// 엔터키 입력 처리
	function enter() {
	    if(window.event.keyCode == 13) {
	        funcLogin();
	    }
	}
</script>
</body>
</html>
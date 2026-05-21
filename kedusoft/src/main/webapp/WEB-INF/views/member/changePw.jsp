<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<h3>${menuDto.title}</h3>
				<span class="directory">${menuDto.title}</span>
			</div>
			
			<form name="pwForm" id="pwForm" method="post" action="">
                <input type="hidden" name="userId" value="${param.memberId}">
                <input type="hidden" name="mtel2" value="${param.mtel2}">
			
                <h4>ㆍ새로운 비밀번호 설정</h4>
                <div class="bbsWidth writeArea">
                    <div class="writeLine">
                        <div class="writeLeftTitle">새 비밀번호<fcr>*</fcr></div>
                        <div class="writeRight tl"><input type="password" name="newPw" id="newPw" class="writeSubject" placeholder="새 비밀번호 입력"></div>
                    </div>
                    <div class="writeLine">
                        <div class="writeLeftTitle">비밀번호 확인<fcr>*</fcr></div>
                        <div class="writeRight tl"><input type="password" name="newPwConfirm" id="newPwConfirm" class="writeSubject" placeholder="새 비밀번호 재입력"></div>
                    </div>
                </div>
                <br><br><br>
                <div class="bbsWidth">
                    <div class="board_search" style="text-align:center;">
                        <a href="javascript:void(0);" id="btnChangePw"><span class="bbsSearch">비밀번호 변경</span></a>
                    </div>
                </div>
			</form>
		</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>
$(document).ready(function() {
	
    $("#btnChangePw").click(function() {
    	
		var f = document.pwForm;
		let formDataObj = {};    	
    	
        var newPw = $("#newPw").val();
        var newPwConfirm = $("#newPwConfirm").val();
        
        if(newPw === "") {
            alert("새 비밀번호를 입력해주세요.");
            $("#newPw").focus();
            return false;
        }
        
        if(newPwConfirm === "") {
            alert("비밀번호 확인을 입력해주세요.");
            $("#newPwConfirm").focus();
            return false;
        }
        
        if(newPw !== newPwConfirm) {
            alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
            $("#newPwConfirm").focus();
            return false;
        }
        
        // 서버 전달값 셋팅
        formDataObj = {"memberId" : f.userId.value, "memberPassword" : f.newPw.value, "memberPhone" :  f.mtel2.value};
        
        if(confirm("비밀번호를 변경하시겠습니까?")) {
            //$("#pwForm").submit(); // 서버의 /member/updatePwProc (argon2 암호화 처리 컨트롤러) 로 전송
            
    	    // 서버로 전송
            $.ajax({
                url : "/member/updatePw", // 결과를 처리할 JSP 페이지
                type : "post",
                data : JSON.stringify(formDataObj),
                contentType: 'application/json; charset=UTF-8',
                success : function(res){
    				
    				alert(res.message);
                    // 비밀번호 변경
                   	if(res.success == false){
                   		return false;
                   	}else {
                   		
                   		var $form = $('<form></form>');
                   		$form.attr('action', '/member/login');	  // 전송할 URL
                   		$form.attr('method', 'get');             // 전송 방식 (post/get)
                   		
                   		$form.appendTo('body').submit();
                   	}
                },
                error : function(){
                    alert("에러가 발생했습니다.");
                }
            });	            
            
            
        }
    });
});
</script>
</body>
</html>
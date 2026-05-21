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
					<div class="writeRight tl"><input type="text" name=memberName class="writeSubject"></div>
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
					<div class="writeRight tl"><input type="text" name=memberId class="writeSubject"></div>
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

<script>
	function searchIdpw(type) {
		
		var f = document.f;
		let formDataObj = {};
		let requestUrl = '';
		
		let $form = $("form[name='f']");
	    $form.find("input[name='searTypeId']").val(type);
	
	    if (type === 1) {
	        // 아이디 찾기 유효성 검사
	        let name = $("input[name='memberName']").val();
	        let tel = $("input[name='mtel']").val();
	
	        if (!name) {
	            alert("성명을 입력해주세요.");
	            $("input[name='memberName']").focus();
	            return;
	        }
	        if (!tel) {
	            alert("휴대폰 번호를 입력해주세요.");
	            $("input[name='mtel']").focus();
	            return;
	        }
	        
	        // 하이픈 제거 후 값 변경
	        $("input[name='mtel']").val(tel.replace(/-/g, ""));
			
	        // 서버 요청 값 셋팅
	        requestUrl = '/member/userId';
	        formDataObj = {"memberId" : '', "memberName" : f.memberName.value, "memberPhone" :  f.mtel.value};
	        
	    } else if (type === 2) {
	        // 비밀번호 찾기 유효성 검사
	        let id = $("input[name='memberId']").val();
	        let tel = $("input[name='mtel2']").val();
	
	        if (!id) {
	            alert("아이디를 입력해주세요.");
	            $("input[name='memberId']").focus();
	            return;
	        }
	        if (!tel) {
	            alert("휴대폰 번호를 입력해주세요.");
	            $("input[name='mtel2']").focus();
	            return;
	        }
	
	        // 하이픈 제거 후 값 변경
	        $("input[name='mtel2']").val(tel.replace(/-/g, ""));
	        
	        // 서버 요청값 셋팅
	        requestUrl = '/member/userPw';
	        formDataObj = {"memberId" : f.memberId.value, "memberName" : '', "memberPhone" :  f.mtel2.value};
	    }
	
	    // 서버로 전송
        $.ajax({
            url : requestUrl, // 결과를 처리할 JSP 페이지
            type : "post",
            data : JSON.stringify(formDataObj),
            contentType: 'application/json; charset=UTF-8',
            success : function(res){
				
				alert(res.message);
                // 아이디 찾기
                if(type == 1){
                	if(res.success == false){
                		return false;
                	}
                	
                // 비밀번호 찾기	
                }else if(type == 2){
                	if(res.success == false){
                		return false;
                	// 비밀번호 변경 페이지 이동
                	}else{
                		console.log(formDataObj);
                		
	               		f.action = "/member/changePw";
                        f.submit();                	
                    }              	
                }
            },
            error : function(){
                alert("에러가 발생했습니다.");
            }
        });		    
	    
	}
</script>

</body>
</html>
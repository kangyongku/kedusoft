<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="divMenu menus">
	<ul>
		<li><a href="/member/info" class="color">회원정보수정</a></li>
	</ul>
</div>
<section class="sub_con">
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
		<div class="content">
			<div class="contentTitleArea">
				<h3>회원정보수정</h3>
				<span class="directory">회원정보수정</span>
			</div>
			
			<form name="f" id="infoForm" method="post">
			<h4>ㆍ기본정보 수정</h4>
			<div class="bbsWidth writeArea">
				<div class="writeLine">
					<div class="writeLeftTitle">아이디<fcr>*</fcr></div>
					<div class="writeRight tl">
						<input name="memberId" id="memberId" type="text" class="writeSubject" value="${loginInfo.memberId}" readonly style="background-color:#eee; color:#666;">
					</div>
				</div>
				<div class="writeLine">
					<div class="writeLeftTitle">새 비밀번호</div>
					<div class="writeRight tl">
						<input name="pw1" id="pw1" type="password" class="writeSubject" placeholder="변경할 경우에만 입력하세요">
					</div>
				</div>
				<div class="writeLine">
					<div class="writeLeftTitle">새 비밀번호 확인</div>
					<div class="writeRight tl">
						<input name="pw2" id="pw2" type="password" class="writeSubject" placeholder="변경할 경우에만 입력하세요">
					</div>
				</div>
				<div class="writeLine">
					<div class="writeLeftTitle">성 명<fcr>*</fcr></div>
					<div class="writeRight tl">
						<input name="memberName" id="memberName" type="text" class="writeSubject" value="${loginInfo.memberName}">
					</div>
				</div>
				<div class="writeLine">
					<div class="writeLeftTitle">연락처(휴대폰)<fcr>*</fcr></div>
					<div class="writeRight tl">
						<c:set var="phoneArr" value="${fn:split(loginInfo.memberPhone, '-')}" />
						<select name="mtel1" id="mtel1" class="writeText" style="width:60px;">
							<option value="010" <c:if test="${phoneArr[0] == '010'}">selected</c:if>>010</option>
							<option value="011" <c:if test="${phoneArr[0] == '011'}">selected</c:if>>011</option>
							<option value="016" <c:if test="${phoneArr[0] == '016'}">selected</c:if>>016</option>
							<option value="017" <c:if test="${phoneArr[0] == '017'}">selected</c:if>>017</option>
							<option value="018" <c:if test="${phoneArr[0] == '018'}">selected</c:if>>018</option>
							<option value="019" <c:if test="${phoneArr[0] == '019'}">selected</c:if>>019</option>
						</select>-
						<input name="mtel2" id="mtel2" type="text" class="writeText2" maxlength="4" value="${phoneArr[1]}">-
						<input name="mtel3" id="mtel3" type="text" class="writeText2" maxlength="4" value="${phoneArr[2]}">
					</div>
				</div>
				<div class="writeLine">
					<div class="writeLeftTitle">이메일<fcr>*</fcr></div>
					<div class="writeRight tl">
						<c:set var="emailArr" value="${fn:split(loginInfo.memberEmail, '@')}" />
						<input name="mailId" id="mailId" type="text" class="writeText" value="${emailArr[0]}">@
						<input name="mailDomain" id="domain" type="text" class="writeText" value="${emailArr[1]}">
						<select onchange="javascript:document.getElementById('domain').value=this.value;" class="writeText">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="kakao.com">kakao.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</div>
				</div>
			</div>
			
			<br><br><br>
			<div class="bbsWidth">
				<div class="board_search" style="text-align:center;">
					<a href="javascript:void(0);" id="btnUpdateInfo"><span class="bbsSearch">수정 완료</span></a>
				</div>
			</div>
			</form>
		</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
// 2. jQuery 유효성 검사 및 AJAX 전송 로직
$(document).ready(function() {
    $("#btnUpdateInfo").click(function() {
        var pw1 = $("#pw1").val();
        var pw2 = $("#pw2").val();
        var memberName = $("#memberName").val();
        var mtel1 = $("#mtel1").val();
        var mtel2 = $("#mtel2").val();
        var mtel3 = $("#mtel3").val();
        var mailId = $("#mailId").val();
        var mailDomain = $("#domain").val();

        // 비밀번호를 입력한 경우에만 검사
        if(pw1 !== "") {
            if(pw1.length < 8) {
                alert("비밀번호는 8자리 이상이어야 합니다.");
                $("#pw1").focus();
                return;
            }
            if(pw1 !== pw2) {
                alert("비밀번호가 일치하지 않습니다.");
                $("#pw2").focus();
                return;
            }
        }

        if($.trim(memberName) === "") {
            alert("성명을 입력해 주세요.");
            $("#memberName").focus();
            return;
        }

        if($.trim(mtel2) === "" || $.trim(mtel3) === "") {
            alert("휴대폰 번호를 정확히 입력해 주세요.");
            $("#mtel2").focus();
            return;
        }

        if($.trim(mailId) === "" || $.trim(mailDomain) === "") {
            alert("이메일 주소를 입력해 주세요.");
            $("#mailId").focus();
            return;
        }

        if(!confirm("회원정보를 수정하시겠습니까?")) {
            return;
        }

        // 서버 DTO 형태에 맞게 데이터 조합 (전화번호, 이메일 합치기)
        var memberData = {
            memberId: $("#memberId").val(),
            memberName: memberName,
            memberPhone: mtel1 + "-" + mtel2 + "-" + mtel3,
            memberEmail: mailId + "@" + mailDomain
        };

        // 비밀번호를 변경하고자 할 때만 DTO에 세팅
        if (pw1 !== "") {
            memberData.memberPassword = pw1;
        }

        // AJAX 통신
        $.ajax({
            url: "/member/updateInfo",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(memberData),
            dataType: "json",
            success: function(response) {
                // 커스텀 응답 ResultResponse의 성공 여부 체크 (구현하신 로직에 따라 조건문 변경 가능)
                if(response.success || response.code === "SUCCESS") { 
                    alert("회원정보가 성공적으로 수정되었습니다.");
                    location.href = "/"; // 메인 혹은 마이페이지로 이동
                } else {
                    alert(response.message || "정보 수정에 실패했습니다.");
                }
            },
            error: function() {
                alert("서버 통신 중 오류가 발생했습니다.");
            }
        });
    });
});
</script>
</body>
</html>
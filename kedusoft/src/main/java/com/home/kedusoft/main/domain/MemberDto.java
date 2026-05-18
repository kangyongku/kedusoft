package com.home.kedusoft.main.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemberDto {
	
	private int memberNo;              /* 회원번호 */
	private String memberId;           /* 회원아이디 */
	private String memberName;         /* 회원이름 */
	private String memberPassword;     /* 회원비밀번호 */
	private String memberPhone;        /* 회원연락처 */
	private String memberEmail;        /* 회원 이메일 */
	private String privacyAgreeYn;     /* 개인정보수집동의여부 */
	private LocalDateTime privacyAgreeDate; /* 개인정보수집동의일자 */
	

}

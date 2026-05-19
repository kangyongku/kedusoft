package com.home.kedusoft.member.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemberDto {

    /** 회원번호 (PK) */
    private Integer memberSeq;

    /** 회원아이디 */
    private String memberId;

    /** 회원이름 */
    private String memberName;

    /** 비밀번호 */
    private String memberPassword;

    /** 휴대폰번호 */
    private String memberPhone;

    /** 이메일 */
    private String memberEmail;

    /** 사업자번호 */
    private String businessNumber;

    /** 대표자이름 */
    private String ceoName;

    /** 회사이름 */
    private String companyName;

    /** 회사전화번호 */
    private String companyPhone;

    /** 개인정보수집동의 (Y/N) */
    private String privacyAgree;

    /** 개인정보수집동의일자 */
    private LocalDateTime privacyAgreeDate;

    /** 비밀번호 오류횟수 */
    private Integer passwordFailCount;

    /** 비밀번호 변경일자 */
    private LocalDateTime passwordChangeDate;

    /** 최종등록일자 */
    private LocalDateTime createdAt;

    /** 최종수정일자 */
    private LocalDateTime updatedAt;

}
package com.home.kedusoft.project.domain;

import com.home.kedusoft.main.domain.BaseDto;

import lombok.Data;

@Data
public class ProjectContactDto extends BaseDto {
	private Long contactNo;          // 문의 일련번호 (PK)
    private String companyName;      // 고객사명
    private String customerName;     // 담당자명
    private String contactTel;       // 연락처
    private String contactEmail;     // 이메일
    private String contactBizrno;    // 사업자번호
    private String contactTitle;     // 프로젝트 제목
    private String contactContent;   // 요구사항 내용
    private String contactBudget;    // 예상 예산
    private String contactPeriod;    // 예상 기간
    private String udtDate;          // 수정일시
    private String regDate;          // 등록일시
}
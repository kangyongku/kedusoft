package com.home.kedusoft.member.service;

import java.util.Map;

import com.home.kedusoft.common.response.ResultResponse;
import com.home.kedusoft.member.domain.MemberDto;

import jakarta.servlet.http.HttpServletRequest;

public interface MemberService {
	
	// 회원가입 아이디 중복체크
	ResultResponse<Map<String, Object>> memberIdCheck(MemberDto memberDto) throws Exception;

	// 회원가입 등록
	ResultResponse<Map<String, Object>> memberJoin(MemberDto memberDto) throws Exception;

	// 회원아이디 찾기
	ResultResponse<String> memberIdFind(MemberDto memberDto) throws Exception;
	
	// 회원비밀번호 찾기
	ResultResponse<Map<String, Object>> memberPasswordFind(MemberDto memberDto) throws Exception;

	// 회원비밀번호 수정
	ResultResponse<Map<String, Object>> memberPasswordUpdate(HttpServletRequest request, MemberDto memberDto) throws Exception;
	
	// 회원정보 조회
	MemberDto getMemberInfo(MemberDto memberDto) throws Exception;

}

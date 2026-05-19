package com.home.kedusoft.member.service;

import java.util.Map;

import com.home.kedusoft.common.response.ResultResponse;
import com.home.kedusoft.member.domain.MemberDto;

public interface MemberService {
	
	// 회원가입 아이디 중복체크
	ResultResponse<Map<String, Object>> memberIdCheck(MemberDto memberDto) throws Exception;

	// 회원가입 등록
	ResultResponse<Map<String, Object>> memberJoin(MemberDto memberDto) throws Exception;

}

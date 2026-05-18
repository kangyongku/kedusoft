package com.home.kedusoft.member.service;

import java.util.Map;

import com.home.kedusoft.main.domain.MemberDto;

public interface MemberService {
	
	// 회원가입 아이디 중복체크
	public Map<String, Object> memberIdCheck(MemberDto memberDto) throws Exception;

	// 회원가입 등록
	public Map<String, Object> memberJoin(MemberDto memberDto) throws Exception;

}

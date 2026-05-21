package com.home.kedusoft.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.home.kedusoft.member.domain.MemberDto;

@Mapper
public interface MemberMapper {
	
	// 회원가입정보 유무
	int selMemberCheck(MemberDto dto) throws Exception;
	
	// 회원등록
	int insMember(MemberDto dto) throws Exception;
	
	// 회원정보 조회
	MemberDto selMember(MemberDto dto) throws Exception;

	// 회원정보 수정
	int updMember(MemberDto dto) throws Exception;
	
	// 회원비밀번호 수정
	int updMemberPw(MemberDto dto) throws Exception;
}

package com.home.kedusoft.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.home.kedusoft.member.domain.MemberDto;

@Mapper
public interface MemberMapper {
	
	/**
	 * 회원가입 아이디 중복체크
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	int memberIdCheck(MemberDto dto) throws Exception;

	int insertMember(MemberDto dto) throws Exception;
	
	String selMemberId(MemberDto dto) throws Exception;
	
	String selMemberPassword(MemberDto dto) throws Exception;

}

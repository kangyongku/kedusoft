package com.home.kedusoft.member.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.home.kedusoft.common.exception.ErrorCode;
import com.home.kedusoft.common.response.ResultResponse;
import com.home.kedusoft.mapper.MemberMapper;
import com.home.kedusoft.member.domain.MemberDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper memberMapper;
	
	@Override
	public ResultResponse<Map<String, Object>> memberIdCheck(MemberDto memberDto) throws Exception {
		
		// 입력 아이디 확인
		if(memberDto.getMemberId().isEmpty() || memberDto.getMemberId() == null) {
			return ResultResponse.success(false, "아이디가 입력되지 않았습니다.");
		}
		
		// 입력 아이디 조회
		int checkCnt = memberMapper.memberIdCheck(memberDto);
		
		if(checkCnt > 0) {
			return ResultResponse.fail(ErrorCode.USER_ID_DUPLICATED);
		}else {
			return ResultResponse.success(ErrorCode.USER_ID_AVAILABLE);
		}
	}

	@Override
	public ResultResponse<Map<String, Object>> memberJoin(MemberDto memberDto) throws Exception {
		
		int intCnt = 0;
		
		if(memberDto == null) {
			return ResultResponse.success(false, "회원정보가 입력되지 않았습니다.");
		}
		
		// 서버에서 입력 값 체크 추가 
		
//		boolean boMember = memberValidation(memberDto);
//		if(!boMember) {
//			
//		}

		// 서버에서 입력 값 체크 추가 
		
		log.info("memberDto {}", memberDto);
		
		// 회원가입 등록
		intCnt = memberMapper.insertMember(memberDto);
		
		if(intCnt > 0) {
			return ResultResponse.success(ErrorCode.USER_REGISTER_SUCCESS);
		}else {
			return ResultResponse.fail(ErrorCode.USER_REGISTER_FAIL);
		}
	}

}

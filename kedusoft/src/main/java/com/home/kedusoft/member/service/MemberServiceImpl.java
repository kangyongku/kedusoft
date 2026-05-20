package com.home.kedusoft.member.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.home.kedusoft.common.exception.ErrorCode;
import com.home.kedusoft.common.response.ResultResponse;
import com.home.kedusoft.common.util.PasswordUtil;
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
		
		// DTO NULL 체크
		if(memberDto == null) {
			return ResultResponse.success(false, "회원정보가 입력되지 않았습니다.");
		}
		
        // =========================
        // 1. parameter validation 
        // =========================			
//		boolean boMember = memberValidation(memberDto);
//		if(!boMember) {
//			
//		}
		
        // =========================
        // 1. 아이디 체크
        // =========================		
		int checkCnt = memberMapper.memberIdCheck(memberDto);
		if(checkCnt > 0) {
			return ResultResponse.fail(ErrorCode.USER_ID_DUPLICATED);
		}
        // =========================
        // 2. 사용자 입력 패스워드 체크
        // =========================
		String userPw = String.valueOf(memberDto.getMemberPassword());
		if(userPw.isEmpty()) {
			return ResultResponse.fail(ErrorCode.USER_REGISTER_FAIL);
		}
		memberDto.setMemberPassword(PasswordUtil.encode(userPw));	// 사용자 패스워워드 encode (Argon)
        // =========================
        // 3. 휴대폰 번호 
        // =========================		
		//String userPhNum = String.valueOf(memberDto.getMemberPhone());
		
		// 서버에서 입력 값 체크 추가 
		log.info("memberDto {}", memberDto);
		
        // =========================
        // 10. 회원가입 등록
        // =========================		
		int intCnt = memberMapper.insertMember(memberDto);
		if(intCnt > 0) {
			return ResultResponse.success(ErrorCode.USER_REGISTER_SUCCESS);
		}else {
			return ResultResponse.fail(ErrorCode.USER_REGISTER_FAIL);
		}
	}

	@Override
	public ResultResponse<String> memberIdFind(MemberDto memberDto) throws Exception {
		
		String memberId = String.valueOf(memberMapper.selMemberId(memberDto));
		if("null".equals(memberId) || memberId == null) {
			return ResultResponse.fail("입력하신 정보로 아이디가 확인 되지 않습니다.");
		}else {
			return ResultResponse.success("가입하신 아이디는" + memberId + " 입니다.", memberId);
		}
	}

	@Override
	public ResultResponse<Map<String, Object>> memberPasswordFind(MemberDto memberDto) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

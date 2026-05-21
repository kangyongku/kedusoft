package com.home.kedusoft.member.service;

import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Service;

import com.home.kedusoft.common.exception.ErrorCode;
import com.home.kedusoft.common.response.ResultResponse;
import com.home.kedusoft.common.util.PasswordUtil;
import com.home.kedusoft.mapper.MemberMapper;
import com.home.kedusoft.member.domain.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
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
		int checkCnt = selectMemberCheck(memberDto);
		
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
		int checkCnt = selectMemberCheck(memberDto);
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
		int intCnt = memberMapper.insMember(memberDto);
		if(intCnt > 0) {
			return ResultResponse.success(ErrorCode.USER_REGISTER_SUCCESS);
		}else {
			return ResultResponse.fail(ErrorCode.USER_REGISTER_FAIL);
		}
	}

	@Override
	public ResultResponse<String> memberIdFind(MemberDto memberDto) throws Exception {

		// 이름
		if("".equals(memberDto.getMemberName()) || memberDto.getMemberName() == null) {
			return ResultResponse.fail("아이디 찾기 성명이 입력되지 않았습니다..");
		}
		// 휴대폰번호
		if("".equals(memberDto.getMemberPhone()) || memberDto.getMemberPhone() == null) {
			return ResultResponse.fail("아이디 찾기 휴대폰 번호가 입력되지 않았습니다.");
		}
		
		// 아이디 찾기 조회
		MemberDto memDto = selectMember(memberDto);
		
		if(Objects.isNull(memDto)) {
			return ResultResponse.fail(ErrorCode.USER_INFO_NOT_FOUND);	// 입력 하신 정보로 조회가 되지 않습니다.
		}else {
			return ResultResponse.success("가입하신 아이디는 " + memDto.getMemberId() + " 입니다.", "");
		}
	}

	@Override
	public ResultResponse<Map<String, Object>> memberPasswordFind(MemberDto memberDto) throws Exception {
		
		// 아이디
		if("".equals(memberDto.getMemberId()) || memberDto.getMemberId() == null) {
			return ResultResponse.fail("비밀번호 찾기 아이디가 입력되지 않았습니다..");
		}
		// 휴대폰번호
		if("".equals(memberDto.getMemberPhone()) || memberDto.getMemberPhone() == null) {
			return ResultResponse.fail("아이디 찾기 휴대폰 번호가 입력되지 않았습니다.");
		}		
		
		// 비밀번호 찾기 조회
		int intCnt = memberMapper.selMemberCheck(memberDto);
		if(intCnt > 0) {
			return ResultResponse.success(ErrorCode.USER_PW_FIND_SUCCESS);
		}else {
			return ResultResponse.fail(ErrorCode.USER_INFO_NOT_FOUND);	// 입력 하신 정보로 조회가 되지 않습니다.
		}		
	}
	
	@Override
	public ResultResponse<Map<String, Object>> memberPasswordUpdate(HttpServletRequest request, MemberDto memberDto) throws Exception {
	
		log.info(" memberDto : {} ", memberDto);
		
		// 아이디
		if("".equals(memberDto.getMemberId()) || memberDto.getMemberId() == null) {
			return ResultResponse.fail("비밀번호 찾기 아이디가 입력되지 않았습니다..");
		}
		// 휴대폰번호
		if("".equals(memberDto.getMemberPhone()) || memberDto.getMemberPhone() == null) {
			return ResultResponse.fail("비밀번호 찾기 휴대폰 번호가 입력되지 않았습니다.");
		}
		// 비밀번호
		if("".equals(memberDto.getMemberPassword()) || memberDto.getMemberPassword() == null) {
			//return ResultResponse.fail("비밀번호가 입력되지 않았습니다.");
			return ResultResponse.fail(ErrorCode.USER_REGISTER_FAIL);
		}
		
		memberDto.setMemberPassword(PasswordUtil.encode(memberDto.getMemberPassword()));	// 사용자 패스워워드 encode (Argon)		
		
		// 비밀번호 찾기 조회
		int intCnt = memberMapper.updMemberPw(memberDto);
		if(intCnt > 0) {
			return ResultResponse.success(ErrorCode.USER_UPDATE_SUCCESS);
		}else {
			return ResultResponse.fail(ErrorCode.USER_UPDATE_FAIL);	
		}
	}
	
	@Override
	public MemberDto getMemberInfo(MemberDto memberDto) throws Exception {
		return selectMember(memberDto);
	}
	
	
	private int selectMemberCheck(MemberDto memberDto) throws Exception  {
		return memberMapper.selMemberCheck(memberDto);
	}

	private MemberDto selectMember(MemberDto memberDto) throws Exception  {
		return memberMapper.selMember(memberDto);
	}



}

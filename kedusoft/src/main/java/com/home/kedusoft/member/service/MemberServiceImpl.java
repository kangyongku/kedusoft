package com.home.kedusoft.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.kedusoft.main.domain.MemberDto;
import com.home.kedusoft.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public Map<String, Object> memberIdCheck(MemberDto memberDto) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<>();
		int checkCnt = 0;
		
		String checkId = String.valueOf(memberDto.getMemberId());
		
		if(checkId.isEmpty()) {
			returnMap.put("msg", "아이디가 입력되지 않았습니다.");
			returnMap.put("success", false);
			return returnMap;
		}
		
		checkCnt = memberMapper.memberIdCheck(memberDto);
		if(checkCnt > 0) {
			returnMap.put("msg", "이미 사용 중인 아이디입니다.");
			returnMap.put("success", false);
		}else {
			returnMap.put("msg", "사용가능한 아이디 입니다.");
			returnMap.put("success", true);			
		}
		
		return returnMap;
	}

	@Override
	public Map<String, Object> memberJoin(MemberDto memberDto) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<>();
		int intCnt = 0;
		
		if(memberDto == null) {
			returnMap.put("msg", "입력하신 내용을 다시 확인 바랍니다.");
			returnMap.put("success", false);
			return returnMap;
		}
		

		//
		
		boolean boMember = memberValidation(memberDto);
		if(!boMember) {
			
		}
		
		log.info("memberDto {}", memberDto);
		
		// 회원가입 등록
		intCnt = memberMapper.insertMember(memberDto);
		
		if(intCnt > 0) {
			returnMap.put("msg", "회원가입이 완료 되었습니다.");
			returnMap.put("success", true);
		}else {
			returnMap.put("msg", "회원가입이 실패하였습니다.");
			returnMap.put("success", false);			
		}
		
		return returnMap;
	}
	
	private boolean memberValidation(MemberDto memberDto) {
		
		// 아이디
		if(memberDto.getMemberId().isEmpty()) {
			return false;
		}
		if(memberDto.getMemberName().isEmpty()) {
			return false;
		}
		if(memberDto.getMemberPassword().isEmpty()) {
			return false;
		}
		if(memberDto.getMemberPhone().isEmpty()) {
			return false;
		}
		if(memberDto.getMemberEmail().isEmpty()) {
			return false;
		}
		if(memberDto.getPrivacyAgreeYn().isEmpty()) {
			return false;
		}
		
		return true;
		
	}

}

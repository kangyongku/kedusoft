package com.home.kedusoft.member;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.home.kedusoft.common.response.ResultResponse;
import com.home.kedusoft.common.util.CommonUtil;
import com.home.kedusoft.main.domain.MenuDto;
import com.home.kedusoft.member.domain.MemberDto;
import com.home.kedusoft.member.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberService;

	/* 로그인 */
	@GetMapping(value = {"/login", "/mobile/login"} )
	public String login(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(5);
		menuDto.setMenuLeft(1);
		menuDto.setTitle("로그인");
		return CommonUtil.deviceReturn(request, "member/login");
	}
	
	/* 회원가입 */
	@GetMapping(value = {"/join", "/mobile/join"} )
	public String join(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(5);
		menuDto.setMenuLeft(2);
		menuDto.setTitle("회원가입");
		return CommonUtil.deviceReturn(request, "member/join");
	}
	
	/* 계정찾기 */
	@GetMapping(value = {"/find", "/mobile/find"} )
	public String find(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(5);
		menuDto.setMenuLeft(3);
		menuDto.setTitle("계정찾기");
		return CommonUtil.deviceReturn(request, "member/find");
	}

	/* 회원가입 아이디 검색(중복체크)*/
	@ResponseBody
	@PostMapping(value = {"/checkId"} )
	public ResultResponse<Map<String, Object>> memberIdCheck(@RequestBody @Validated MemberDto memberDto) throws Exception {
		return memberService.memberIdCheck(memberDto);
	}

	/* 회원가입 등록*/
	@ResponseBody
	@PostMapping(value = {"/userJoin"} )
	public ResultResponse<Map<String, Object>> memberJoin(@RequestBody @Validated MemberDto memberDto) throws Exception {
		return memberService.memberJoin(memberDto);
	}

	/* 계정찾기*/
	@ResponseBody
	@PostMapping(value = {"/userId"} )
	public ResultResponse<String> memberIdFind(@RequestBody @Validated MemberDto memberDto) throws Exception {
		return memberService.memberIdFind(memberDto);
	}

	/* 비밀번호찾기*/
	@ResponseBody
	@PostMapping(value = {"/userPw"} )
	public ResultResponse<Map<String, Object>> memberPasswordFind(@RequestBody @Validated MemberDto memberDto) throws Exception {
		return memberService.memberPasswordFind(memberDto);
	}
	
	/* 비밀번호 변경*/
	@PostMapping(value = {"/changePw", "/mobile/changePw"} )
	public String memberPasswordChange(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(5);
		menuDto.setMenuLeft(3);
		menuDto.setTitle("비밀번호 변경");
		return CommonUtil.deviceReturn(request, "member/changePw");
	}
	
	/* 비밀번호 수정*/
	@ResponseBody
	@PostMapping(value = {"/updatePw"} )
	public ResultResponse<Map<String, Object>> memberPasswordUpdate(HttpServletRequest request, @RequestBody @Validated MemberDto memberDto) throws Exception {
		return memberService.memberPasswordUpdate(request, memberDto);
	}	
}

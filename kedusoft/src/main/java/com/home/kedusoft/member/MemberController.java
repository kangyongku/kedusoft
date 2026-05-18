package com.home.kedusoft.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.home.kedusoft.common.util.CommonUtil;
import com.home.kedusoft.main.domain.MemberDto;
import com.home.kedusoft.main.domain.MenuDto;
import com.home.kedusoft.member.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;

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
	@PostMapping(value = {"/checkId"} )
	@ResponseBody
	public Map<String, Object> memberIdCheck(HttpServletRequest request, Model model, @Validated MemberDto memberDto) throws Exception {
		
		return memberService.memberIdCheck(memberDto);
	}

	/* 회원가입 등록*/
	@PostMapping(value = {"/memberJoin"} )
	@ResponseBody
	public Map<String, Object> memberJoin(HttpServletRequest request, Model model, @RequestBody MemberDto memberDto) throws Exception {
		
		return memberService.memberJoin(memberDto);
	}
}

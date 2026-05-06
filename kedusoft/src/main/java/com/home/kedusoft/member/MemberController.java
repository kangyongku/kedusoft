package com.home.kedusoft.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.home.kedusoft.common.util.CommonUtil;
import com.home.kedusoft.main.domain.MenuDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member")
public class MemberController {

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
}

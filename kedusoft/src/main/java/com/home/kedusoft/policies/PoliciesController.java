package com.home.kedusoft.policies;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.home.kedusoft.common.util.CommonUtil;
import com.home.kedusoft.main.domain.MenuDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/policy")
public class PoliciesController {

	/* 이용약관 */
	@GetMapping(value = {"/terms", "/mobile/terms"} )
	public String terms(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(6);
		menuDto.setMenuLeft(1);
		menuDto.setTitle("이용약관");
		return CommonUtil.deviceReturn(request, "policy/terms");
	}
	
	/* 개인정보처리방침 */
	@GetMapping(value = {"/privacy", "/mobile/privacy"} )
	public String privacy(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(6);
		menuDto.setMenuLeft(1);
		menuDto.setTitle("개인정보처리방침");
		return CommonUtil.deviceReturn(request, "policy/privacy");
	}
}

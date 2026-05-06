package com.home.kedusoft.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.home.kedusoft.common.util.CommonUtil;
import com.home.kedusoft.main.domain.MenuDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/project")
public class ProjectController {

	/* 프로젝트 > 프로젝트문의 */
	@GetMapping(value = {"/contact", "/mobile/contact"} )
	public String contact(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(3);
		menuDto.setMenuLeft(1);
		menuDto.setTitle("프로젝트 문의");
		return "project/contact";
		//return CommonUtil.deviceReturn(request, "project/contact");
	}
	
	/* 프로젝트 > 프로젝트문의 */
	@GetMapping(value = {"/application", "/mobile/application"} )
	public String application(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(3);
		menuDto.setMenuLeft(2);
		menuDto.setTitle("프로젝트 내역 확인");
		return "project/application";
		//return CommonUtil.deviceReturn(request, "project/application");
	}
}

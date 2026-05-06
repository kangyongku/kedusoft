package com.home.kedusoft.orginfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.home.kedusoft.common.util.CommonUtil;
import com.home.kedusoft.main.domain.MenuDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/orginfo")
public class OrgInfoController {

	/* 서비스분야 > 서비스 개요 */
	@GetMapping(value = {"/outline", "/mobile/outline"} )
	public String outline(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(1);
		menuDto.setMenuLeft(1);
		menuDto.setTitle("서비스 개요");
		return CommonUtil.deviceReturn(request, "orginfo/outline");
	}
	
	/* 서비스분야 > 서비스 내용 */
	@GetMapping(value = {"/content", "/mobile/content"} )
	public String content(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(1);
		menuDto.setMenuLeft(2);
		menuDto.setTitle("서비스 내용");
		return CommonUtil.deviceReturn(request, "orginfo/content");
	}
	
	/* 서비스분야 > 찾아오시는길 */
	@GetMapping(value = {"/map", "/mobile/map"} )
	public String map(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(1);
		menuDto.setMenuLeft(3);
		menuDto.setTitle("찾아오시는길");
		return CommonUtil.deviceReturn(request, "orginfo/map");
	}
}

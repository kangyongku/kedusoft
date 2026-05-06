package com.home.kedusoft.portfolio;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.home.kedusoft.common.util.CommonUtil;
import com.home.kedusoft.main.domain.MenuDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/portfolio")
public class PortfolioController {

	/* 포트폴리오 > 안내 */
	@GetMapping(value = {"/guide", "/mobile/guide"} )
	public String guide(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(2);
		menuDto.setMenuLeft(1);
		menuDto.setTitle("포트폴리오 안내");
		return CommonUtil.deviceReturn(request, "portfolio/guide");
	}
	
	/* 포트폴리오 > 내용 */
	@GetMapping(value = {"/content", "/mobile/content"} )
	public String content(HttpServletRequest request, MenuDto menuDto) {
		menuDto.setMenuHead(2);
		menuDto.setMenuLeft(2);
		menuDto.setTitle("포트폴리오 내용");
		return CommonUtil.deviceReturn(request, "portfolio/content");
	}
	
}

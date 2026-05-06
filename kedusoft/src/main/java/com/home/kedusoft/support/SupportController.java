package com.home.kedusoft.support;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.home.kedusoft.common.paging.PageInfo;
import com.home.kedusoft.common.util.CommonUtil;
import com.home.kedusoft.main.domain.BoardDto;
import com.home.kedusoft.main.domain.MenuDto;
import com.home.kedusoft.support.service.SupportService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/support")
public class SupportController {

	@Autowired
	SupportService supportService;
	
	/* 고객지원 > 공지사항 */
	@RequestMapping(value = {"/notice", "/mobile/notice"} )
	public String notice(HttpServletRequest request, Model model, MenuDto menuDto, BoardDto boardDto) {
		menuDto.setMenuHead(4);
		menuDto.setMenuLeft(1);
		menuDto.setTitle("공지사항");
		System.out.println("boardDto : "+boardDto);
		
		boardDto.setBoardId("notice");
		PageInfo<BoardDto> dataList = supportService.selectBoardList(boardDto);
		model.addAttribute("totalCount",dataList.getTotalCount());
		model.addAttribute("currPage",dataList.getPageIndex());
		model.addAttribute("boardList",dataList.getData());
		return CommonUtil.deviceReturn(request, "support/notice");
	}
	
	/* 고객지원 > 보도자료 */
	@RequestMapping(value = {"/press", "/mobile/press"} )
	public String press(HttpServletRequest request, Model model, MenuDto menuDto, BoardDto boardDto) {
		menuDto.setMenuHead(4);
		menuDto.setMenuLeft(2);
		menuDto.setTitle("보도자료");
		
		boardDto.setBoardId("press");
		PageInfo<BoardDto> dataList = supportService.selectBoardList(boardDto);
		model.addAttribute("totalCount",dataList.getTotalCount());
		model.addAttribute("currPage",dataList.getPageIndex());
		model.addAttribute("boardList",dataList.getData());
		
		return CommonUtil.deviceReturn(request, "support/press");
	}
	
	/* 고객지원 > Q&A */
	@RequestMapping(value = {"/qna", "/mobile/qna"} )
	public String qna(HttpServletRequest request, Model model, MenuDto menuDto, BoardDto boardDto) {
		menuDto.setMenuHead(4);
		menuDto.setMenuLeft(3);
		menuDto.setTitle("Q&A");
		
		boardDto.setBoardId("qna");
		PageInfo<BoardDto> dataList = supportService.selectBoardList(boardDto);
		model.addAttribute("totalCount",dataList.getTotalCount());
		model.addAttribute("currPage",dataList.getPageIndex());
		model.addAttribute("boardList",dataList.getData());
		return CommonUtil.deviceReturn(request, "support/qna");
	}
	
	@PostMapping(value = {"/view", "/mobile/view"} )
	public String view(HttpServletRequest request, Model model, MenuDto menuDto, BoardDto boardDto) {
		
		System.out.println("view boardDto : "+boardDto);
		BoardDto boardView = supportService.selectBoardView(boardDto);
		model.addAttribute("boardView",boardView);
		return CommonUtil.deviceReturn(request, "support/supportView");
	}
}

package com.home.kedusoft.support.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.kedusoft.common.paging.PageInfo;
import com.home.kedusoft.main.domain.BoardDto;
import com.home.kedusoft.mapper.SupportMapper;

@Service
//@Transactional
public class SupportServiceImpl implements SupportService {

	@Autowired
	SupportMapper supportMapper;
	
	@Override
	public PageInfo<BoardDto> selectBoardList(BoardDto boardDto) {
		// TODO Auto-generated method stub
		int totalCount = supportMapper.selectBoardCnt(boardDto);
		System.out.println("totalCount : "+totalCount);
		
		ArrayList<BoardDto> boardList = supportMapper.selectBoardList(boardDto);
		return new PageInfo<>(boardDto.getPageIndex(), boardDto.getPageSize(), totalCount, boardList);
	}

	@Override
	public BoardDto selectBoardView(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return supportMapper.selectBoardView(boardDto);
	}

}

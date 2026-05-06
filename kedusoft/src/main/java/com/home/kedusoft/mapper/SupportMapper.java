package com.home.kedusoft.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.home.kedusoft.main.domain.BoardDto;

@Mapper
public interface SupportMapper {

	int selectBoardCnt(BoardDto boardDto);
	
	ArrayList<BoardDto> selectBoardList(BoardDto boardDto);
	
	BoardDto selectBoardView(BoardDto boardDto);


}

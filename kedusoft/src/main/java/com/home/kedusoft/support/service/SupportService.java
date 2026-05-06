package com.home.kedusoft.support.service;

import java.util.ArrayList;

import com.home.kedusoft.common.paging.PageInfo;
import com.home.kedusoft.main.domain.BoardDto;

public interface SupportService {

	PageInfo<BoardDto> selectBoardList(BoardDto boardDto);

	BoardDto selectBoardView(BoardDto boardDto);

}

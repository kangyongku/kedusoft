package com.home.kedusoft.main.domain;

import lombok.Data;

@Data
public class BoardDto extends SearchDto {

	private int boardIdx;
	private String boardId;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private int boardCnt;
	private String regDate;
}

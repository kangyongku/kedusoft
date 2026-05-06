package com.home.kedusoft.main.domain;

import lombok.Data;

@Data
public class SearchDto {

	private int pageIndex;            // 현재 페이지 번호
    private int recordSize;      // 페이지당 출력할 페이지 개수
    private int pageSize;        // 화면 하단에 출력할 페이지 사이즈
    
	private String keyfield;
	private String keyWord;
	
	public SearchDto() {
        this.pageIndex = 1;
        this.recordSize = 10;
        this.pageSize = 10;
    }
	
	public int getOffset() {
        return (pageIndex - 1) * recordSize;
    }
}

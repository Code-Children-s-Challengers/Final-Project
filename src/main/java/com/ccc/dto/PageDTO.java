package com.ccc.dto;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Alias("PageDTO")
@Data
public class PageDTO {
	List<ChallengeDTO> list; // 목록
	int curPage; // 현재 페이지
	int perPage = 6; // 페이지 당 보여줄 개수
	int totalRecord; // 전체 레코드 개수
	
	public List<ChallengeDTO> getList() {
		return list;
	}
	public void setList(List<ChallengeDTO> list) {
		this.list = list;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
}

package com.ccc.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
@Alias("NoticePageDTO")
public class NoticePageDTO {
	
	List<NoticeDTO> list;
	int curPage; // 현재 페이지
	int perPage = 8; // 페이지 당 보여줄 개수
	int totalRecord; // 전체 레코드 개수
	public NoticePageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public List<NoticeDTO> getList() {
		return list;
	}
	public void setList(List<NoticeDTO> list) {
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
	@Override
	public String toString() {
		return "NoticePageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalRecord="
				+ totalRecord + "]";
	}
	
	
}

package com.ccc.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("QnABoardPageDTO")
public class QnABoardPageDTO {
	
	List<QnABoardDTO> list;
	int curPage; // 현재 페이지
	int perPage = 5; // 페이지 당 보여줄 개수
	int totalCount;
	public QnABoardPageDTO(List<QnABoardDTO> list, int curPage, int perPage, int totalCount) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalCount = totalCount;
	}
	public QnABoardPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public List<QnABoardDTO> getList() {
		return list;
	}
	public void setList(List<QnABoardDTO> list) {
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
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "QnABaordPageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount="
				+ totalCount + "]";
	}
	
	
}

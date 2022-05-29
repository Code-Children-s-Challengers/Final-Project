package com.ccc.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("QnABoardDTO")
public class QnABoardDTO {
	private int id;
	private String title;
	private String writerId;
	private String qcontent;
	private String acontent;
	private String regdate;
	private int hit;
	private String files;
	public QnABoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnABoardDTO(int id, String title, String writerId, String qcontent, String acontent, String regdate, int hit,
			String files) {
		super();
		this.id = id;
		this.title = title;
		this.writerId = writerId;
		this.qcontent = qcontent;
		this.acontent = acontent;
		this.regdate = regdate;
		this.hit = hit;
		this.files = files;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "QnABoardDTO [id=" + id + ", title=" + title + ", writerId=" + writerId + ", qcontent=" + qcontent
				+ ", acontent=" + acontent + ", regdate=" + regdate + ", hit=" + hit + ", files=" + files + "]";
	}	
	
}

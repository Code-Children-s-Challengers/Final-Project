package com.ccc.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("NoticeDTO")
public class NoticeDTO {
	private int id;
	private String title;
	private String writerId;
	private String content;
	private String regdate;
	private int hit;
	private String files;
	
	//search 전용 변수
	private String type;
	private String keyword;
	private String date1;
	private String date2;
	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDTO(int id, String title, String writerId, String content, String regdate, int hit, String files,
			String type, String keyword, String date1, String date2) {
		super();
		this.id = id;
		this.title = title;
		this.writerId = writerId;
		this.content = content;
		this.regdate = regdate;
		this.hit = hit;
		this.files = files;
		this.type = type;
		this.keyword = keyword;
		this.date1 = date1;
		this.date2 = date2;
	}
	@Override
	public String toString() {
		return "NoticeDTO [id=" + id + ", title=" + title + ", writerId=" + writerId + ", content=" + content
				+ ", regdate=" + regdate + ", hit=" + hit + ", files=" + files + ", type=" + type + ", keyword="
				+ keyword + ", date1=" + date1 + ", date2=" + date2 + "]";
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}	
	
	
	
}

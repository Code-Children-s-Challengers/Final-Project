package com.ccc.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("NoticeDTO")
public class NoticeDTO {
	private int id;
	private String title;
	private String writerId;
	private String content;
	private Date regdate;
	private int hit;
	private String files;
	public NoticeDTO() {
		
		// TODO Auto-generated constructor stub
	}
	public NoticeDTO(int id, String title, String writerId, String content, Date regdate, int hit, String files) {
		super();
		this.id = id;
		this.title = title;
		this.writerId = writerId;
		this.content = content;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
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
		return "NoticeDTO [id=" + id + ", title=" + title + ", writerId=" + writerId + ", content=" + content
				+ ", regdate=" + regdate + ", hit=" + hit + ", files=" + files + "]";
	}

	
	
}

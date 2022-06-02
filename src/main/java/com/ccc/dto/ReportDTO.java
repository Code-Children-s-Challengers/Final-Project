package com.ccc.dto;


public class ReportDTO {
	private int cnum;
	private int unum;
	private String uploaddate;
	private int cnt;
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getUnum() {
		return unum;
	}
	public void setUnum(int unum) {
		this.unum = unum;
	}
	public String getUploaddate() {
		return uploaddate.substring(0, 10);
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "ReportDTO [cnum=" + cnum + ", unum=" + unum + ", uploaddate=" + uploaddate + ", cnt=" + cnt + "]";
	}
	

}

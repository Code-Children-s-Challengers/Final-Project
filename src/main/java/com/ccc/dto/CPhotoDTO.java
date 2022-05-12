package com.ccc.dto;

import java.sql.Date;

public class CPhotoDTO {
	private int cnum;
	private int unum;
	private String photo;
	private String coment;
	private String uploaddate;
	private int validates;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public String getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate.substring(0, 10);
	}
	public int getValidates() {
		return validates;
	}
	public void setValidates(int validates) {
		this.validates = validates;
	}
	
	
	

}

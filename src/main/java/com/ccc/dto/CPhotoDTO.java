package com.ccc.dto;

import java.sql.Date;

public class CPhotoDTO {
	private int cnum;
	private int unum;
	private String photo;
	private String coment;
	private Date uploaddate;
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
	public Date getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(Date uploaddate) {
		this.uploaddate = uploaddate;
	}
	public int getValidates() {
		return validates;
	}
	public void setValidates(int validates) {
		this.validates = validates;
	}
	
	
	

}

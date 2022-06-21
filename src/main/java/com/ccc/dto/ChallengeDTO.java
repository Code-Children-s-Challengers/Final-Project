package com.ccc.dto;

import lombok.Data;

@Data
public class ChallengeDTO {
	private int cnum; // pk
	private String name;
	private String sday; // 시작날짜
	private String eday; // 종료날짜
	private int mpeople; // 최대인원
	private int fee; // 비용
	private int participant; // 참가인원
	private String category;
	private int holiday; // 공휴일에 쉬는지
	private String photo;
	
	//홍석
	private int todayCheck;
	
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSday() {
		return sday;
	}
	public void setSday(String sday) {
		this.sday = sday.substring(0, 10);
	}
	public String getEday() {
		return eday;
	}
	public void setEday(String eday) {
		this.eday = eday.substring(0, 10);
	}
	public int getMpeople() {
		return mpeople;
	}
	public void setMpeople(int mpeople) {
		this.mpeople = mpeople;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public int getParticipant() {
		return participant;
	}
	public void setParticipant(int participant) {
		this.participant = participant;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getHoliday() {
		return holiday;
	}
	public void setHoliday(int holiday) {
		this.holiday = holiday;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "ChallengeDTO [cnum=" + cnum + ", name=" + name + ", sday=" + sday + ", eday=" + eday + ", mpeople="
				+ mpeople + ", fee=" + fee + ", participant=" + participant + ", category=" + category + ", holiday="
				+ holiday + ", photo=" + photo + "]";
	}
	
	
	

}

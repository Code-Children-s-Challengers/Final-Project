package com.ccc.dto;

import java.sql.Date;

public class ChallengeDTO {
	private int cnum; // pk
	private String name;
	private Date sday; // 시작날짜
	private Date eday; // 종료날짜
	private int mpeople; // 최대인원
	private int fee; // 비용
	private int participant; // 참가인원
	private String category;
	private String dayoff; // 휴무일
	
	
	
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
	public Date getSday() {
		return sday;
	}
	public void setSday(Date sday) {
		this.sday = sday;
	}
	public Date getEday() {
		return eday;
	}
	public void setEday(Date eday) {
		this.eday = eday;
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
	public String getDayoff() {
		return dayoff;
	}
	public void setDayoff(String dayoff) {
		this.dayoff = dayoff;
	}
	@Override
	public String toString() {
		return "ChallengeDTO [cnum=" + cnum + ", name=" + name + ", sdate=" + sday + ", edate=" + eday + ", mpeople="
				+ mpeople + ", fee=" + fee + ", participant=" + participant + ", category=" + category + ", dayoff="
				+ dayoff + "]";
	}
	
	
	

}

package com.ccc.dto;

import lombok.Data;

@Data
public class CPhotoImageDTO {
	private int cnum;
	private int unum;
	private String mimetype;
	private String original_name;
	private byte[] data;
	private String c_comment;
	private String uploaddate;
	private int validates;
	
}



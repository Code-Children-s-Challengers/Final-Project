package com.ccc.dto;

import lombok.Data;

@Data
public class ProfileImageDTO {
	private int id;
	private String mimetype;
	private String original_name;
	private byte[] data;
	private String created;
}

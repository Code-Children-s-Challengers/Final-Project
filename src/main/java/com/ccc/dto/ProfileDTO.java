package com.ccc.dto;

import lombok.Data;

@Data
public class ProfileDTO {
	private int id;
	private String mimetype;
	private String original_name;
	private byte[] data;
	private String created;
}

package com.ccc.dto;

import java.sql.Timestamp;



import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
public class UserDTO {
	
	//기본(OAuth2로 받을 수 있는 정보)
	private int id;
	private String username;
	private String password;
	private String email;
	private String role; //Role_USER, ROLE_MODEL
	private String provider; 
	private String providerId;
	
	// 우리가 입력받아야하는 정보
	private String phoneNumber;
	private String nickname;
	private int point;
	
	
	//생성자
	@Builder
	public UserDTO(String username, String password, String email, String role, String provider, String providerId, String phoneNumber, String nickname, int point
			) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.nickname = nickname;
		this.point = point;
		this.role = role;
		this.provider = provider;
		this.providerId = providerId;

	}
	
	
}

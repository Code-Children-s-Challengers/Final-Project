package com.ccc.service;

import java.util.Map;

public interface UserService {

	public void updateNickname(Map<String,String> map);
	public void updatePhoneNumber(Map<String,String> map);
	public int checkNickname(String nickname);
	public int checkUsername(String username);
	
}

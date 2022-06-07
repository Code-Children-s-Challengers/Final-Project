package com.ccc.service;

import java.util.Map;

import com.ccc.dto.UserDTO;

public interface UserService {

	public void updateNickname(Map<String,String> map);
	public void updatePhoneNumber(Map<String,String> map);
	public int checkNickname(String nickname);
	public int checkUsername(String username);
	public UserDTO findUser(int id);
	
}

package com.ccc.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccc.dao.UserDAO;
import com.ccc.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	
	@Override
	public void updateNickname(Map<String,String> map) {
		userDAO.updateNickname(map);
	}

	@Override

	public void updatePhoneNumber(Map<String,String> map) {
		userDAO.updatePhoneNumber(map);
	}

	@Override
	public int checkNickname(String nickname) {
		return userDAO.checkNickname(nickname);
	}

	@Override
	public int checkUsername(String username) {
		return userDAO.checkUsername(username);
	}

	@Override
	public UserDTO findUser(int id) {
		return userDAO.findUser(id);
	}

	@Override
	public UserDTO findByUsername(String username) {
		return userDAO.findByUsername(username);
	}


}

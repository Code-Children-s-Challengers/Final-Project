package com.ccc.dao;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dto.UserDTO;

@Repository
public class UserDAO {

	@Autowired SqlSession session;
	
	public UserDTO findByUsername(String username) {
	
		UserDTO user = session.selectOne("com.config.LoginMapper.findByUsername", username);
		return user;
	}
	public void save (UserDTO user) {
		session.insert("com.config.LoginMapper.save", user);
	}
	
	public void updateNickname(Map<String,String> map) {
		session.update("com.config.MemberMapper.updateNickname", map);
	}

	public void updatePhoneNumber(Map<String,String> map) {
		session.update("com.config.MemberMapper.updatePhoneNumber", map);
	}

	
}

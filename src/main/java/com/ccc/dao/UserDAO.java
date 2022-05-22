package com.ccc.dao;


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

	
}

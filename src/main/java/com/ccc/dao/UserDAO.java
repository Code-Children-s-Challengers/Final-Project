package com.ccc.dao;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dto.ProfileImageDTO;
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
	
	public int checkNickname(String nickname) {
		return session.selectOne("com.config.LoginMapper.checkNickname", nickname);
	}
	public int checkUsername(String username) {
		return session.selectOne("com.config.LoginMapper.checkUsername", username);
	}
	
	public void updateProfileImage(ProfileImageDTO profileImage) {
		session.update("com.config.MemberMapper.updateProfileImage",profileImage);
	}

	public ProfileImageDTO findProfileImage(int id) {
		return session.selectOne("com.config.MemberMapper.findProfileImage",id);
	}
	
	public void insertProfileImage(ProfileImageDTO profileImage) {
		session.insert("com.config.MemberMapper.insertProfileImage",profileImage);		
	}
	public void updateNickname2(Map<Integer, String> map) {
		session.update("com.config.MemberMapper.updateNickname", map);
	}
	public UserDTO findUser(int id) {
		return session.selectOne("com.config.MemberMapper.findUser", id);
	}

	
}

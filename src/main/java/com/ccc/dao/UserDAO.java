package com.ccc.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dto.CPhotoImageDTO;
import com.ccc.dto.ChallengeImageDTO;
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
	public UserDTO findLatestUser() {
		return session.selectOne("com.config.LoginMapper.findLatestUser");
	}

	
	////// 홍석/////////
	////챌린지 이미지////
	public ChallengeImageDTO findChallengeImage(int cnum) {
		return session.selectOne("com.config.MemberMapper.findChallengeImage",cnum);
	}
	
	public void insertChallengeImage(ChallengeImageDTO challengeImage) {
		session.insert("com.config.MemberMapper.insertChallengeImage",challengeImage);		
	}
	public void updateChallengeImage(ChallengeImageDTO challengeImage) {
		session.update("com.config.MemberMapper.updateChallengeImage",challengeImage);
	}
	public int updatePassword(Map<String,String> map) {
		return session.update("com.config.MemberMapper.updatePassword",map);
	}

	/// 챌린지 인증 이미지//////////
	// 동일한 날짜에 이미 인증이 이루어졌는가?
	public int findAllCphotoForValidity(Map<String,String> map) {
		return session.selectOne("com.config.MemberMapper.findAllCphotoForValidity",map);
	}
	//cPhoto넣기
	public void insertCPhoto(CPhotoImageDTO insertPhoto) {
		session.selectOne("com.config.MemberMapper.insertCPhoto",insertPhoto);

	}
	//특정 날의 특정 유저의 특정 챌린지의 cPhoto 가져오기
	public CPhotoImageDTO findCPhotoImage(Map<String,String> map) {
		return session.selectOne("com.config.MemberMapper.findCPhotoImage",map);
	}
	//특정 유저의 특정 챌린지의 모든 cPhoto 가져오기
	public List<CPhotoImageDTO> findAllCphoto(Map<String, String> map2) {
		return session.selectList("com.config.MemberMapper.findAllCphoto",map2);
	}
	
}

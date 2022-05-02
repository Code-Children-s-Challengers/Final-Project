package com.ccc.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dto.ChallengeDTO;

@Repository("ChallengeDAO")
public class ChallengeDAO {
	@Autowired
	SqlSession session;
	
	public int challengeNumber() throws Exception{
		return session.selectOne("com.config.ChallengeMapper.challengeNumber");
	}
	
	public List<ChallengeDTO> allChallenge() throws Exception{
		Date date = new Date();
		long timeInMilliSeconds = date.getTime();
        java.sql.Date sqlDate = new java.sql.Date(timeInMilliSeconds);
		return session.selectList("com.config.ChallengeMapper.allChallenge", sqlDate);
	}
	
	public List<ChallengeDTO> searchChallenge(String name) throws Exception{
		return session.selectList("com.config.ChallengeMapper.searchChallenge", name);
	}
	
	
}

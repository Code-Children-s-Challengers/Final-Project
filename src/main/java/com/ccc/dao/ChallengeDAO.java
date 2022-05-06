package com.ccc.dao;

import java.util.Date;
import java.util.HashMap;
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
	
	public List<ChallengeDTO> categoryChallenge(String category) throws Exception{
		Date date = new Date();
		long timeInMilliSeconds = date.getTime();
        java.sql.Date sqlDate = new java.sql.Date(timeInMilliSeconds);
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("today", sqlDate.toString());
        map.put("category", category);
		return session.selectList("com.config.ChallengeMapper.categoryChallenge", map);
	}
	
	public List<ChallengeDTO> searchChallenge(String name) throws Exception{
		return session.selectList("com.config.ChallengeMapper.searchChallenge", name);
	}
	
	public int findParticipant(int unum, int cnum) throws Exception{
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cnum", cnum);
		map.put("unum", unum);
		return session.selectOne("com.config.ChallengeMapper.findParticipant", map);
	}
	
	public int challengeParticipate(int unum, int cnum) throws Exception{
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cnum", cnum);
		map.put("unum", unum);
		return session.insert("com.config.ChallengeMapper.challengeParticipate", map);
	}
	
	public int challengePeopleUpdate(int cnum) throws Exception{
		return session.update("com.config.ChallengeMapper.challengePeopleUpdate", cnum);
	}
	
	
}

package com.ccc.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ccc.dao.ChallengeDAO;
import com.ccc.dto.ChallengeDTO;

@Repository("memberService")
public class ChallengeServiceImpl implements ChallengeService {
	@Autowired
	ChallengeDAO dao;

	@Override
	public List<ChallengeDTO> allChallenge() throws Exception {
		List<ChallengeDTO> list = dao.allChallenge();
		return list;
	}

	@Override
	public List<ChallengeDTO> searchChallenge(String name) throws Exception {
		List<ChallengeDTO> list = dao.searchChallenge(name);
		return list;
	}

	@Override
	public int challengeNumber() throws Exception {
		int num = dao.challengeNumber();
		return num;
	}

	@Override
	public List<ChallengeDTO> categoryChallenge(String category) throws Exception {
		List<ChallengeDTO> list = dao.categoryChallenge(category);
		return list;
	}

	@Override
	public int findParticipant(int unum, int cnum) throws Exception {
		int num = dao.findParticipant(unum, cnum);
		return num;
	}
	
	@Transactional
	public int Participate(int unum, int cnum) throws Exception{
		int num = 0;
		try {
			num = dao.challengeParticipate(unum, cnum);
			num = dao.challengePeopleUpdate(cnum);
		}catch (Exception e){
			e.printStackTrace();
			throw new Exception("fail");
		}
		return num;
	}

}

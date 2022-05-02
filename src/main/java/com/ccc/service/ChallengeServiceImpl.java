package com.ccc.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}

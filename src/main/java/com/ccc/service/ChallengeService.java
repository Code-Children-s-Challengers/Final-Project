package com.ccc.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ccc.dto.ChallengeDTO;


public interface ChallengeService {
	public List<ChallengeDTO> allChallenge() throws Exception;
	public List<ChallengeDTO> searchChallenge(String name) throws Exception;
	public int challengeNumber() throws Exception;
	public List<ChallengeDTO> categoryChallenge(String category) throws Exception;
}

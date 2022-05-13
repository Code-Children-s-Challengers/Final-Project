package com.ccc.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ccc.dto.CPhotoDTO;
import com.ccc.dto.ChallengeDTO;


public interface ChallengeService {
	public List<ChallengeDTO> allChallenge() throws Exception;
	public List<ChallengeDTO> searchChallenge(String name) throws Exception;
	public int challengeNumber() throws Exception;
	public List<ChallengeDTO> categoryChallenge(String category) throws Exception;
	public int findParticipant(int unum, int cnum) throws Exception;
	public int Participate(int unum, int cnum) throws Exception;
	public int challengeAdd(ChallengeDTO dto) throws Exception;
	public List<ChallengeDTO> userChallenge(int unum) throws Exception;
	public List<CPhotoDTO> userChallengeRetrieve(int unum, int cnum) throws Exception;
	public ChallengeDTO searchChallengeByNum(int cnum) throws Exception;
	public int certificationAdd(CPhotoDTO dto) throws Exception;
}

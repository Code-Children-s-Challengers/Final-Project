package com.ccc.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ccc.dao.ChallengeDAO;
import com.ccc.dto.CPhotoDTO;
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

	@Override
	public int challengeAdd(ChallengeDTO dto) throws Exception {
		int num = dao.challengeAdd(dto);
		return num;
	}

	@Override
	public List<ChallengeDTO> userChallenge(int unum) throws Exception {
		List<ChallengeDTO> list = dao.userChallenge(unum);
		return list;
	}

	@Override
	public List<CPhotoDTO> userChallengeRetrieve(int unum, int cnum) throws Exception {
		List<CPhotoDTO> list = dao.userChallengeRetrieve(unum, cnum);
		return list;
	}

	@Override
	public ChallengeDTO searchChallengeByNum(int cnum) throws Exception {
		ChallengeDTO dto = dao.searchChallengeByNum(cnum);
		return dto;
	}

	@Override
	public int certificationAdd(CPhotoDTO dto) throws Exception {
		int num = dao.certificationAdd(dto);
		return num;
	}

}

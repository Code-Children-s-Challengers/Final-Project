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
import com.ccc.dto.PageDTO;
import com.ccc.dto.PhotoPageDTO;

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
	public PageDTO categoryChallenge(String category, int curPage, int perPage) throws Exception {
		PageDTO list = dao.categoryChallenge(category, curPage, perPage);
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
	public PageDTO userChallenge(int unum, int curPage, int perPage) throws Exception {
		PageDTO list = dao.userChallenge(unum, curPage, perPage);
		return list;
	}
	@Override
	public PhotoPageDTO userChallengeRetrieve(int unum, int cnum, int curPage, int perPage) throws Exception {
		PhotoPageDTO list = dao.userChallengeRetrieve(unum, cnum, curPage, perPage);
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

	@Override
	public int photoDelete(String cnum, String unum, String uploaddate) throws Exception {
		int num = dao.photoDelete(cnum, unum, uploaddate);
		return num;
	}

	@Override
	public int searchReport(String cnum, String unum, String uploaddate) throws Exception {
		int num = dao.searchReport(cnum, unum, uploaddate);
		return num;
	}

	@Override
	public int ReportAdd(String cnum, String unum, String uploaddate) throws Exception {
		int num = dao.ReportAdd(cnum, unum, uploaddate);
		return num;
	}

	@Override
	public int ReportUpdate(String cnum, String unum, String uploaddate) throws Exception {
		int num = dao.ReportUpdate(cnum, unum, uploaddate);
		return num;
	}

}

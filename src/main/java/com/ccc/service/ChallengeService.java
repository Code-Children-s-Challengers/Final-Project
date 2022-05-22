package com.ccc.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ccc.dto.CPhotoDTO;
import com.ccc.dto.ChallengeDTO;
import com.ccc.dto.PageDTO;
import com.ccc.dto.PhotoPageDTO;


public interface ChallengeService {
	public List<ChallengeDTO> allChallenge() throws Exception;
	public List<ChallengeDTO> searchChallenge(String name) throws Exception;
	public int challengeNumber() throws Exception;
	public PageDTO categoryChallenge(String category, int curPage, int perPage) throws Exception;
	public int findParticipant(int unum, int cnum) throws Exception;
	public int Participate(int unum, int cnum) throws Exception;
	public int challengeAdd(ChallengeDTO dto) throws Exception;
	public PageDTO userChallenge(int unum, int curPage, int perPage) throws Exception;
	public PhotoPageDTO userChallengeRetrieve(int unum, int cnum, int curPage, int perPage) throws Exception;
	public ChallengeDTO searchChallengeByNum(int cnum) throws Exception;
	public int certificationAdd(CPhotoDTO dto) throws Exception;
	public int photoDelete(String cnum, String unum, String uploaddate) throws Exception;
	public int searchReport(String cnum, String unum, String uploaddate) throws Exception;
	public int ReportAdd(String cnum, String unum, String uploaddate) throws Exception;
	public int ReportUpdate(String cnum, String unum, String uploaddate) throws Exception;
}

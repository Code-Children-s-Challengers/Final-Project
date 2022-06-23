package com.ccc.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ccc.dto.CPhotoDTO;
import com.ccc.dto.ChallengeDTO;
import com.ccc.dto.PageDTO;
import com.ccc.dto.PhotoPageDTO;
import com.ccc.dto.ReportDTO;
import com.ccc.dto.ReportPageDTO;


public interface ChallengeService {
	public List<ChallengeDTO> allChallenge() throws Exception;
	public List<ChallengeDTO> searchChallenge(String name) throws Exception;
	public int challengeNumber() throws Exception;
	public PageDTO categoryChallenge(String category, int curPage, int perPage) throws Exception;
	public int findParticipant(int unum, int cnum) throws Exception;
	public int Participate(int unum, int cnum) throws Exception;
	public int ParticipatePoint(int unum, int cnum,String endDay, int point) throws Exception;
	public int challengeAdd(ChallengeDTO dto) throws Exception;
	public PageDTO userChallenge(int unum, int curPage, int perPage) throws Exception;
	public PhotoPageDTO userChallengeRetrieve(int unum, int cnum, int curPage, int perPage) throws Exception;
	public ChallengeDTO searchChallengeByNum(int cnum) throws Exception;
	public int certificationAdd(CPhotoDTO dto) throws Exception;
	public int photoDelete(String cnum, String unum, String uploaddate) throws Exception;
	public int ReportAdd(String cnum, String unum, String uploaddate, String reportnum) throws Exception;
	public int ReportCheck(String cnum, String unum, String uploaddate, String reportnum) throws Exception;
	public ReportPageDTO allCertificationReport(int curPage, int perPage) throws Exception;
	public CPhotoDTO certificationRetrieve(int unum, int cnum, String uploaddate) throws Exception;
	public int validationUpdate(String unum, String cnum, String uploaddate) throws Exception;
	public int reportDelete(String unum, String cnum, String uploaddate) throws Exception;
	public ChallengeDTO challengeByCnum(int cnum) throws Exception;
	public int insertHoliday(String cnum, String hday) throws Exception;
	public int holidayCheck(String cnum, String today) throws Exception;
	public int challengeCompleteCheck(String cnum, String unum) throws Exception;
	public int challengeCompleteUpdate(String cnum, String unum) throws Exception;
	public int challengeAdd_Participate(ChallengeDTO dto, int unum, int cnum, String skiphidden, String endDay, int point) throws Exception;
	public PageDTO categoryChallengeAll(String category, int parseInt, int pp) throws Exception;
}

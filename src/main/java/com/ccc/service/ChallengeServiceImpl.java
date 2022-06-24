package com.ccc.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.CDATASection;

import com.ccc.dao.ChallengeDAO;
import com.ccc.dto.CPhotoDTO;
import com.ccc.dto.ChallengeDTO;
import com.ccc.dto.PageDTO;
import com.ccc.dto.PhotoPageDTO;
import com.ccc.dto.ReportDTO;
import com.ccc.dto.ReportPageDTO;

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
	public ChallengeDTO challengeByCnum(int cnum) throws Exception {
		ChallengeDTO dto = dao.challengeByCnum(cnum);
		return dto;
	}

	@Override
	public int findParticipant(int unum, int cnum) throws Exception {
		int num = dao.findParticipant(unum, cnum);
		return num;
	}
	
	@Override
	public int Participate(int unum, int cnum) throws Exception {
		int num = 0;
		try {
			num = dao.challengeParticipate(unum, cnum); //챌린지 참여
			num = dao.challengePeopleUpdate(cnum); //챌린지 인원수 조정
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
	public int ReportAdd(String cnum, String unum, String uploaddate, String reportnum) throws Exception {
		int num = dao.ReportAdd(cnum, unum, uploaddate,reportnum);
		return num;
	}

	@Override
	public int ReportCheck(String cnum, String unum, String uploaddate, String reportnum) throws Exception {
		int num = dao.ReportCheck(cnum, unum, uploaddate, reportnum);
		return num;
	}

	@Override
	public ReportPageDTO allCertificationReport(int curPage, int perPage) throws Exception {
		ReportPageDTO list = dao.allCertificationReport(curPage, perPage);
		return list;
	}

	@Override
	public CPhotoDTO certificationRetrieve(int unum, int cnum, String uploaddate) throws Exception {
		CPhotoDTO dto = dao.certificationRetrieve(unum, cnum, uploaddate);
		return dto;
	}

	@Override
	public int validationUpdate(String unum, String cnum, String uploaddate) throws Exception {
		int num = dao.validationUpdate(unum, cnum, uploaddate);
		return num;
	}

	@Override
	public int reportDelete(String unum, String cnum, String uploaddate) throws Exception {
		int num = dao.reportDelete(unum, cnum, uploaddate);
		return num;
	}

	@Override
	public int insertHoliday(String cnum, String hday) throws Exception {
		int num = dao.insertHoliday(cnum, hday);
		return num;
	}

	@Override
	public int holidayCheck(String cnum, String today) throws Exception {
		int num = dao.holidayCheck(cnum, today);
		return num;
	}

	@Override
	public int challengeCompleteCheck(String cnum, String unum) throws Exception {
		int num = dao.challengeCompleteCheck(cnum, unum);
		return num;
	}

	@Override
	public int challengeCompleteUpdate(String cnum, String unum) throws Exception {
		int num = dao.challengeCompleteUpdate(cnum, unum);
		return num;
	}

	//홍석
	@Override
	public PageDTO categoryChallengeAll(String category, int parseInt, int pp) throws Exception{
		return dao.categoryChallengeAll(category, parseInt,pp);
	}

	//홍석
	@Override
	@Transactional
	public int ParticipatePoint(int unum, int cnum, String endDay, int point) throws Exception{
		int num = 0;
		try {
			num = dao.challengeParticipate(unum, cnum); //챌린지 참여
			num = dao.challengePeopleUpdate(cnum); //챌린지 인원수 +1
			//홍석 추가
			num = dao.pointAccount(unum, cnum, endDay, point); //금액 저장하기
			num = dao.pointMinus(unum,cnum, point); //user_table에서 금액빼기
		}catch (Exception e){
			e.printStackTrace();
			throw new Exception("fail");
		}
		return num;
	}
	
	// 생성하면서 자동 참가
	@Override
	@Transactional
	public int challengeAdd_Participate(ChallengeDTO dto, int unum, int cnum, String skiphidden, String endDay, int point) throws Exception{
		int num = 0;
		try{
			num = dao.challengeAdd(dto); //챌린지 만들기
			if(skiphidden != null && skiphidden.length() > 5) {
				num = dao.insertHoliday(Integer.toString(cnum), skiphidden);
			}
			num = ParticipatePoint(unum, cnum, endDay, point); //챌린지 참여하기
        }catch (Exception e){
            throw new Exception("fail"); 
        }
		return num;
	}

	//챌린지 취소하기 
	@Override
	@Transactional
	public int cancleCh(int cnum, int unum) {
		int num = dao.cancle(cnum, unum); //cparticipant에서 삭제 - 성공
		num = dao.partMinus(cnum); // 챌린지 인원수 감소 - 반쯤만 성공
		
		ChallengeDTO ch; //챌린지 찾아오기
		try {
			ch = dao.searchChallengeByNum(cnum);
			System.out.println("++++++++" +ch);
			num = dao.refillFee(unum, ch.getFee());// user point 복구시키기
			System.out.println("======" +ch.getFee());
			num = dao.deleteAccount(cnum, unum); // account에서 삭제하기
			System.out.println("*****" +ch.getFee());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return num;
	}

}

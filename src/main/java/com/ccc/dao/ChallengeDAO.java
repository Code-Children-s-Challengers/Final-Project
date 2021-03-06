package com.ccc.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dto.CPhotoDTO;
import com.ccc.dto.ChallengeDTO;
import com.ccc.dto.PageDTO;
import com.ccc.dto.PhotoPageDTO;
import com.ccc.dto.ReportDTO;
import com.ccc.dto.ReportPageDTO;

@Repository("ChallengeDAO")
public class ChallengeDAO {
	@Autowired
	SqlSession session;
	
	public int challengeNumber() throws Exception{
		return session.selectOne("com.config.ChallengeMapper.challengeNumber");
	}
	
	public int userChallengeNumber(int unum) throws Exception{
		return session.selectOne("com.config.ChallengeMapper.userChallengeNumber", unum);
	}
	
	public int categoryNumber(String category) throws Exception{
		Date date = new Date();
		long timeInMilliSeconds = date.getTime();
        java.sql.Date sqlDate = new java.sql.Date(timeInMilliSeconds);
        
        HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("date", sqlDate.toString());
        
		return session.selectOne("com.config.ChallengeMapper.categoryNumber", map);
	}
	
	public int photoNumber(HashMap<String, Integer> map) throws Exception{
		return session.selectOne("com.config.ChallengeMapper.photoNumber", map);
	}
	
	public int reportNumber() throws Exception{
		return session.selectOne("com.config.ChallengeMapper.reportNumber");
	}
	
	public List<ChallengeDTO> allChallenge() throws Exception{
		Date date = new Date();
		long timeInMilliSeconds = date.getTime();
        java.sql.Date sqlDate = new java.sql.Date(timeInMilliSeconds);
		return session.selectList("com.config.ChallengeMapper.allChallenge", sqlDate);
	}
	
	public ChallengeDTO challengeByCnum(int cnum) throws Exception{
		return session.selectOne("com.config.ChallengeMapper.challengeByCnum", cnum);
	}
	
	public PageDTO categoryChallenge(String category, int curPage, int perPage) throws Exception{
		Date date = new Date();
		long timeInMilliSeconds = date.getTime();
        java.sql.Date sqlDate = new java.sql.Date(timeInMilliSeconds);
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("today", sqlDate.toString());
        map.put("category", category);
        
        
        PageDTO pageDTO = new PageDTO();
		int offset = (curPage-1)*perPage;
		List<ChallengeDTO> list = session.selectList("com.config.ChallengeMapper.categoryChallenge", map,new RowBounds(offset,perPage));
		
		int totalRecord = categoryNumber(category);
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalRecord(totalRecord);
		return pageDTO;
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
	
	public int challengeAdd(ChallengeDTO dto) throws Exception{
		return session.insert("com.config.ChallengeMapper.challengeAdd", dto);
	}
	
	public PageDTO userChallenge(int unum, int curPage, int perPage) throws Exception{
        
		PageDTO pageDTO = new PageDTO();
		int offset = (curPage-1)*perPage;
		//List<ChallengeDTO> list = session.selectList("com.config.ChallengeMapper.userChallenge", unum,new RowBounds(offset,perPage));
		List<ChallengeDTO> list = session.selectList("com.config.ChallengeMapper.userChallenge", unum); //page??? ??? ?????? ??????
		
		int totalRecord = userChallengeNumber(unum);
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalRecord(totalRecord);
		return pageDTO;
	}
	
	public PhotoPageDTO userChallengeRetrieve(int unum, int cnum, int curPage, int perPage) throws Exception{
		HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("unum", unum);
        map.put("cnum", cnum);
        PhotoPageDTO pageDTO = new PhotoPageDTO();
		int offset = (curPage-1)*perPage;
		List<CPhotoDTO> list = session.selectList("com.config.ChallengeMapper.userChallengeRetrieve", map,new RowBounds(offset,perPage));
		
		int totalRecord = photoNumber(map);
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalRecord(totalRecord);
		return pageDTO;
	}
	
	public ChallengeDTO searchChallengeByNum(int cnum) throws Exception{
		return session.selectOne("com.config.ChallengeMapper.searchChallengeByNum", cnum);
	}
	
	public int certificationAdd(CPhotoDTO dto) throws Exception{
		return session.insert("com.config.ChallengeMapper.certificationAdd", dto);
	}
	
	public int photoDelete(String cnum, String unum, String uploaddate) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cnum", cnum);
		map.put("unum", unum);
		map.put("uploaddate", uploaddate);
		return session.delete("com.config.ChallengeMapper.photoDelete", map);
	}
	
	public int ReportCheck(String cnum, String unum, String uploaddate, String reportnum) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cnum", cnum);
		map.put("unum", unum);
		map.put("uploaddate", uploaddate);
		map.put("reportnum", reportnum);
		return session.insert("com.config.ChallengeMapper.ReportCheck", map);
	}
	
	public int ReportAdd(String cnum, String unum, String uploaddate, String reportnum) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cnum", cnum);
		map.put("unum", unum);
		map.put("uploaddate", uploaddate);
		map.put("reportnum", reportnum);
		return session.update("com.config.ChallengeMapper.ReportAdd", map);
	}
	
	public ReportPageDTO allCertificationReport(int curPage, int perPage) throws Exception{
		ReportPageDTO pageDTO = new ReportPageDTO();
		int offset = (curPage-1)*perPage;
		List<ReportDTO> list = session.selectList("com.config.ChallengeMapper.allCertificationReport", null, new RowBounds(offset,perPage));
		
		int totalRecord = reportNumber();
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalRecord(totalRecord);
		
		
		return pageDTO;
	}
	
	public CPhotoDTO certificationRetrieve(int unum, int cnum, String uploaddate) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
        map.put("unum", Integer.toString(unum));
        map.put("cnum", Integer.toString(cnum));
        map.put("uploaddate", uploaddate);
		return session.selectOne("com.config.ChallengeMapper.certificationRetrieve", map);
	}
	
	public int validationUpdate(String unum, String cnum, String uploaddate) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
        map.put("unum", unum);
        map.put("cnum", cnum);
        map.put("uploaddate", uploaddate);
        
		return session.update("com.config.ChallengeMapper.validationUpdate", map);
	}
	
	public int reportDelete(String unum, String cnum, String uploaddate) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
        map.put("unum", unum);
        map.put("cnum", cnum);
        map.put("uploaddate", uploaddate);
        
		return session.delete("com.config.ChallengeMapper.reportDelete", map);
	}
	
	public int insertHoliday(String cnum, String hday) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cnum", cnum);
		String[] temp = hday.split(" ");
		for(String holiday : temp) {
			map.put("holiday", holiday);
			session.insert("com.config.ChallengeMapper.insertHoliday", map);
		}
		return 1;
	}
	
	public int holidayCheck(String cnum, String today) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cnum", cnum);
		map.put("today", today);
		return session.selectOne("com.config.ChallengeMapper.holidayCheck",map);
	}
	
	public int challengeCompleteCheck(String cnum, String unum) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cnum", cnum);
		map.put("unum", unum);
		return session.selectOne("com.config.ChallengeMapper.challengeCompleteCheck", map);
	}
	
	public int challengeCompleteUpdate(String cnum, String unum) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cnum", cnum);
		map.put("unum", unum);
		return session.update("com.config.ChallengeMapper.challengeCompleteUpdate", map);
	}

	public PageDTO categoryChallengeAll(String category, int curPage, int perPage) throws Exception{
		Date date = new Date();
		long timeInMilliSeconds = date.getTime();
        java.sql.Date sqlDate = new java.sql.Date(timeInMilliSeconds);
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("today", sqlDate.toString());
        map.put("category", category);
        
        
        PageDTO pageDTO = new PageDTO();
		int offset = (curPage-1)*perPage;
		List<ChallengeDTO> list = session.selectList("com.config.ChallengeMapper.categoryChallengeAll", map,new RowBounds(offset,perPage));
		
		int totalRecord = categoryNumber(category);
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalRecord(totalRecord);
		return pageDTO;
	}

	//??????
	public int pointAccount(int unum, int cnum, String endDay, int point) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("unum", Integer.toString(unum));
		map.put("cnum", Integer.toString(cnum));
		map.put("endDay", endDay);
		map.put("point", Integer.toString(point));
		return session.insert("com.config.MemberMapper.pointAccount", map);
	}
	
	//??????
	public int pointMinus(int unum, int cnum, int point) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("unum", Integer.toString(unum));
		map.put("point", Integer.toString(point));
		return session.insert("com.config.MemberMapper.pointMinus", map);
	}

	//?????? ????????? ????????????
	public int cancle(int cnum, int unum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cnum", cnum);
		map.put("unum", unum);
		return session.delete("com.config.MemberMapper.cancle", map);
	}


	//????????? ????????? ??????
	public int partMinus(int cnum) {
		return session.update("com.config.MemberMapper.partMinus", cnum);
	}
	
	//user?????? point ???????????? 
	public int refillFee(int unum, int point) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("unum", unum);
		map.put("point", point);
		return session.update("com.config.MemberMapper.refillFee", map);
	}
	
	//????????? ??????????????? ????????????
	public int deleteAccount(int cnum, int unum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cnum", cnum);
		map.put("unum", unum);
		return session.update("com.config.MemberMapper.deleteAccount", map);
	}
	
	
	//Account?????? valid??? 1??? ????????? ??? ?????? ?????? ?????????
	public int pointBackComplete(int cnum, int unum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cnum", cnum);
		map.put("unum", unum);
		return session.update("com.config.MemberMapper.pointBackComplete", map);
	}

	public int findValidP(int cnum, int unum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cnum", cnum);
		map.put("unum", unum);
		return session.selectOne("com.config.MemberMapper.findValidP", map);
	}
}

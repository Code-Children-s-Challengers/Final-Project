package com.ccc.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dto.CPhotoDTO;
import com.ccc.dto.ChallengeDTO;
import com.ccc.dto.PageDTO;
import com.ccc.dto.PhotoPageDTO;

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
		return session.selectOne("com.config.ChallengeMapper.categoryNumber", category);
	}
	
	public int photoNumber(HashMap<String, Integer> map) throws Exception{
		return session.selectOne("com.config.ChallengeMapper.photoNumber", map);
	}
	
	public List<ChallengeDTO> allChallenge() throws Exception{
		Date date = new Date();
		long timeInMilliSeconds = date.getTime();
        java.sql.Date sqlDate = new java.sql.Date(timeInMilliSeconds);
		return session.selectList("com.config.ChallengeMapper.allChallenge", sqlDate);
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
		List<ChallengeDTO> list = session.selectList("com.config.ChallengeMapper.userChallenge", unum,new RowBounds(offset,perPage));
		
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
	
}

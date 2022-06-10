package com.ccc.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dto.ChallengeDTO;
import com.ccc.dto.NoticeDTO;
import com.ccc.dto.NoticePageDTO;
import com.ccc.dto.PageDTO;

@Repository("NoticeDAO")
public class NoticeDAO {
	@Autowired
	SqlSession session;
	
	public List<NoticeDTO> selectAllNotice() throws Exception{
		return session.selectList("com.config.NoticeMapper.selectAllNotice");
	}
	
	public NoticeDTO selectNoticeContent(int id) throws Exception{		
		return session.selectOne("com.config.NoticeMapper.selectNoticeContent", id);
	}	
	
	public int deleteNotice(int id) throws Exception{
		return session.delete("com.config.NoticeMapper.deleteNotice",id);
	}
	
	public int insertNotice(NoticeDTO dto) throws Exception{
		return session.insert("com.config.NoticeMapper.insertNotice", dto);
	}
	
	public int totalCount() throws Exception{
		return session.selectOne("com.config.NoticeMapper.totalCount");
	}	
	
	public int hitChange(int id) throws Exception{
		return session.update("com.config.NoticeMapper.hitChange", id);
	}
	
						
	public NoticePageDTO selectNoticePage(int curPage) throws Exception {
		
		if(curPage==0) {
			curPage = 1;
		}
		
		NoticePageDTO pDTO = new NoticePageDTO();
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<NoticeDTO> list =  session.selectList("com.config.NoticeMapper.selectAllNotice" , null, new RowBounds(offset, perPage));
		
		int totalPage = totalCount();
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalPage);
		
		System.out.println(list);
		
		return pDTO;
	}
	
	public NoticePageDTO searchNotice(NoticeDTO dto, int curPage) throws Exception{
		
		if(curPage==0) {
			curPage = 1;
		}
		
		NoticePageDTO pDTO = new NoticePageDTO();
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<NoticeDTO> list = session.selectList("com.config.NoticeMapper.searchNotice",dto, new RowBounds(offset, perPage));
		
		int totalPage = totalCount();
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalPage);
		
		return pDTO;
	}
	
	public int selectCount(NoticeDTO dto) throws Exception{
		return session.selectOne("com.config.NoticeMapper.selectCount",dto);
	}	
}

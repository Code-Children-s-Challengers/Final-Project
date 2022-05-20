package com.ccc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dto.NoticeDTO;

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
}

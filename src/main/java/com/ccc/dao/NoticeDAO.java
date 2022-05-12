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
	
	public NoticeDTO selectNoticeContent(int num) throws Exception{
		return session.selectOne("com.config.NoticeMapper.selectNoticeContent");
	}
}

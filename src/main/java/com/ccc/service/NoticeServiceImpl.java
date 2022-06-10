package com.ccc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dao.NoticeDAO;
import com.ccc.dto.NoticeDTO;
import com.ccc.dto.NoticePageDTO;
@Repository("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO dao;
	
	@Override
	public List<NoticeDTO> selectAllNotice() throws Exception {
		// TODO Auto-generated method stub
		List<NoticeDTO> list = dao.selectAllNotice();
		return list;
	}

	@Override
	public NoticeDTO selectNoticeContent(int id) throws Exception {
		dao.hitChange(id);
		NoticeDTO dto = dao.selectNoticeContent(id);
		return dto;
	}
	

	@Override
	public int insertNotice(NoticeDTO dto) throws Exception {
		int num = dao.insertNotice(dto);		
		return num;
	}

	@Override
	public int deleteNotice(int id) throws Exception {
		int num = dao.deleteNotice(id);
		return num;
	}

	@Override
	public NoticePageDTO selectNoticePage(int curPage) throws Exception {
		NoticePageDTO list = dao.selectNoticePage(curPage);
		return list;
	}

	@Override
	public NoticePageDTO searchNotice(NoticeDTO dto, int curPage) throws Exception {
		NoticePageDTO list = dao.searchNotice(dto, curPage);
		return list;
	}

	@Override
	public int selectCount(NoticeDTO dto) throws Exception {
		int num = dao.selectCount(dto);
		return num;
	}

	@Override
	public int updateNotice(NoticeDTO dto) throws Exception {
		int num = dao.updateNotice(dto);
		return num;
		
	}

}

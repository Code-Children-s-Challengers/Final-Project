package com.ccc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dao.NoticeDAO;
import com.ccc.dto.NoticeDTO;
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
	public NoticeDTO selectNoticeContent(int num) throws Exception {
		NoticeDTO dto = dao.selectNoticeContent(num);
		return dto;
	}

}
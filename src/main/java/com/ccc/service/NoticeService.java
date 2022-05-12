package com.ccc.service;

import java.util.List;

import com.ccc.dto.NoticeDTO;

public interface NoticeService {
	public List<NoticeDTO> selectAllNotice() throws Exception;
	public NoticeDTO selectNoticeContent(int num) throws Exception;
}

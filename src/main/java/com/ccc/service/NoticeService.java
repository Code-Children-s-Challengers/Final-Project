package com.ccc.service;

import java.util.List;

import com.ccc.dto.NoticeDTO;
import com.ccc.dto.NoticePageDTO;

public interface NoticeService {
	public List<NoticeDTO> selectAllNotice() throws Exception;
	public NoticeDTO selectNoticeContent(int id) throws Exception;
	public int insertNotice(NoticeDTO dto) throws Exception;
	public int deleteNotice(int id)throws Exception;
	public NoticePageDTO selectNoticePage(int curPage) throws Exception;
	public List<NoticeDTO> searchNotice(NoticeDTO dto) throws Exception;
	
}

package com.ccc.service;

import java.util.List;

import com.ccc.dto.QnABoardDTO;
import com.ccc.dto.QnABoardPageDTO;

public interface QnABoardService {
	
	public List<QnABoardDTO> selectAllQnA() throws Exception;	
	public QnABoardDTO selectQnABoardContent(int id) throws Exception;	
	public int deleteQnABoard(int id) throws Exception ;	
	public int insertQnABoard(QnABoardDTO dto) throws Exception;
	public QnABoardPageDTO selectQnABoardPage(int curPage) throws Exception;
}

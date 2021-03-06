package com.ccc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dao.QnABoardDAO;
import com.ccc.dto.NoticeDTO;
import com.ccc.dto.NoticePageDTO;
import com.ccc.dto.QnABoardDTO;
import com.ccc.dto.QnABoardPageDTO;

@Repository("QnABoardService")
public class QnABoardServiceImpl implements QnABoardService {
	
	
	@Autowired
	QnABoardDAO dao;
	
	@Override
	public List<QnABoardDTO> selectAllQnA() throws Exception {
		List<QnABoardDTO> list = dao.selectAllQnABoard();
		return list;
	}

	@Override
	public QnABoardDTO selectQnABoardContent(int id) throws Exception {
		dao.hitChange(id);
		QnABoardDTO dto = dao.selectQnABoardContent(id);
		return dto;
	}

	@Override
	public int deleteQnABoard(int id) throws Exception {
		int num = dao.deleteQnABoard(id);
		return num;
	}

	@Override
	public int insertQQnABoard(QnABoardDTO dto) throws Exception {
		int num = dao.insertQQnABoard(dto);
		return num;
	}
	

	@Override
	public QnABoardPageDTO selectQnABoardPage(int curPage) throws Exception {
		QnABoardPageDTO list = dao.selectQnABoardPage(curPage);
		return list;
	}
	

	@Override
	public QnABoardDTO checkAnswer(int id) throws Exception {
		QnABoardDTO cdto = dao.checkAnswer(id);
		return cdto;
	}

	@Override
	public QnABoardPageDTO searchQnABoard(QnABoardDTO dto, int curPage) throws Exception {
		QnABoardPageDTO list = dao.searchQnABoard(dto, curPage);
		return list;
	}
	
	@Override
	public int selectCount(QnABoardDTO dto) throws Exception {
		int num = dao.selectCount(dto);
		return num;
	}

	@Override
	public int updateQQnABoard(QnABoardDTO dto) throws Exception {
		int num = dao.updateQQnABoard(dto);
		return num;
	}
	

	@Override
	public int updateAQnABoard(QnABoardDTO dto) throws Exception {
		int num = dao.updateAQnABoard(dto);
		return num;
	}

}

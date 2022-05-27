package com.ccc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ccc.dao.QnABoardDAO;
import com.ccc.dto.QnABoardDTO;

@Repository("QnABoardService")
public class QnABoardServiceImpl implements QnABoardService {
	
	
	@Autowired
	QnABoardDAO dao;
	
	@Override
	public List<QnABoardDTO> selectAllQnA() throws Exception {
		List<QnABoardDTO> list = dao.selectAllQnA();
		return list;
	}

	@Override
	public QnABoardDTO selectQnABoardContent(int id) throws Exception {
		QnABoardDTO dto = dao.selectQnABoardContent(id);
		return dto;
	}

	@Override
	public int deleteQnABoard(int id) throws Exception {
		int num = dao.deleteQnABoard(id);
		return num;
	}

	@Override
	public int insertQnABoard(QnABoardDTO dto) throws Exception {
		int num = dao.insertQnABoard(dto);
		return num;
	}

}

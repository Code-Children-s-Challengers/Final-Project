package com.ccc.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.ccc.dto.QnABoardPageDTO;
import com.ccc.dto.NoticeDTO;
import com.ccc.dto.QnABoardDTO;

@Repository("QnABoardDAO")
public class QnABoardDAO {
	@Autowired
	SqlSession session;
	
	
	public List<QnABoardDTO> selectAllQnABoard() throws Exception {
		return session.selectList("com.config.QnABoardMapper.selectAllQnABoard");
	}

	public QnABoardDTO selectQnABoardContent(int id) throws Exception {
		return session.selectOne("com.config.QnABoardMapper.selectQnABoardContent", id);
	}

	public int deleteQnABoard(int id) throws Exception {
		return session.delete("com.config.QnABoardMapper.deleteQnABoard",id);
	}

	public int insertQnABoard(QnABoardDTO saveDTO) throws Exception {
		return session.insert("com.config.QnABoardMapper.insertQnABoard", saveDTO);
	}
	
	public int totalCount() {
		return session.selectOne("com.config.QnABoardMapper.totalCount");
	}	
	
	public QnABoardPageDTO selectQnABoardPage(int curPage) {
		
		QnABoardPageDTO pDTO = new QnABoardPageDTO();
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<QnABoardDTO> list =  session.selectList("com.config.QnABoardMapper.selectAllQnABoard" , null, new RowBounds(offset, perPage));
		
		int totalPage = totalCount();
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalPage);
		
		System.out.println(list);
		
		return pDTO;
	}
	
	public int hitChange(int id) throws Exception{
		return session.update("com.config.QnABoardMapper.hitChange", id);
	}
	
	public List<QnABoardDTO> searchQnABoard(QnABoardDTO dto) throws Exception{
		return session.selectList("com.config.QnABoardMapper.searchQnABoard",dto);
	}
	
	public QnABoardDTO checkAnswer(int id) throws Exception{
		return session.selectOne("com.config.QnABoardMapper.checkAnswer",id);
	}
	
}

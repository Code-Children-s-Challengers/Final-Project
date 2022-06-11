package com.ccc.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.ccc.dto.QnABoardPageDTO;
import com.ccc.dto.NoticeDTO;
import com.ccc.dto.NoticePageDTO;
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

	public int insertQQnABoard(QnABoardDTO dto) throws Exception {
		return session.insert("com.config.QnABoardMapper.insertQQnABoard", dto);
	}
	
	public int insertAQnABoard(QnABoardDTO dto) throws Exception {
		return session.insert("com.config.QnABoardMapper.insertAQnABoard", dto);
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
	
	public QnABoardPageDTO searchQnABoard(QnABoardDTO dto,int curPage) throws Exception{
		if(curPage==0) {
			curPage = 1;
		}
		
		QnABoardPageDTO pDTO = new QnABoardPageDTO();
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<QnABoardDTO> list = session.selectList("com.config.QnABoardMapper.searchQnABoard",dto, new RowBounds(offset, perPage));
		
		int totalPage = totalCount();
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalPage);
		
		return pDTO;
		
	}
	
	public QnABoardDTO checkAnswer(int id) throws Exception{
		return session.selectOne("com.config.QnABoardMapper.checkAnswer",id);
	}
	
	public int selectCount(QnABoardDTO dto) throws Exception{
		return session.selectOne("com.config.QnABoardMapper.selectCount",dto);
	}	
	public int updateQnABoard(QnABoardDTO dto) throws Exception{
		return session.update("com.config.QnABoardMapper.updateQnABoard", dto);
	}
}

package com.ccc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.ccc.dto.QnABoardDTO;
import com.ccc.dto.QnABoardPageDTO;
import com.ccc.service.QnABoardService;

@Controller
public class QnABoardController {
	@Autowired
	QnABoardService service;
	
	@GetMapping(value="/board/QnABoardList")
	public String QnABoard(Model m, @RequestParam String curPage, HttpServletRequest request) throws Exception{
		
		System.out.println(curPage);
		if(curPage == "") curPage = "1";		
										
		QnABoardPageDTO list = service.selectQnABoardPage(Integer.parseInt(curPage));
		// selectNoticePage가 실행되면서 totalCount가 set 되어야함.
		
		int tot = list.getTotalCount() / list.getPerPage();
		if(list.getTotalCount() % list.getPerPage() != 0) tot++;		
				
		
		m.addAttribute("list", list);
		m.addAttribute("curPage", curPage);				
		m.addAttribute("totalPage", tot);
		
		return "board/QnABoardList";
	}
	
	//쿼리문을 받은 것에 대한 처리(id를 넘겨 받아 해당 content를 출력)
	@GetMapping(value="/board/QnABoardContent")
	public String content(Model m, @RequestParam int id) throws Exception{	
		
		QnABoardDTO dto = service.selectQnABoardContent(id);
		System.out.println(dto);
		m.addAttribute("dto", dto);
		
		return "board/QnABoardContent";
	}
	
	@GetMapping(value="/board/QnABoardDelete")
	public String delete(HttpServletRequest request, @RequestParam int id) throws Exception{
		
		int num = service.deleteQnABoard(id);
		
		return "board/QnABoard/QnABoardDeleteSuccess";
	}

	
	@GetMapping(value="/board/QnABoardWrite")
	public String writeForm() throws Exception{		
		return "board/QnABoardWrite";
	}
	
	@GetMapping(value="/board/QnABoardWriteInsert")
	public int writeSave(QnABoardDTO dto) throws Exception{		
		
		System.out.println(dto);	
		
		int num = service.insertQnABoard(dto);		
		return 0;
	}
}

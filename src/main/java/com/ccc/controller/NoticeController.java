package com.ccc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccc.dto.NoticeDTO;
import com.ccc.dto.NoticePageDTO;
import com.ccc.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@GetMapping(value="/board/noticeList")
	public String notice(Model m, @RequestParam String curPage, String perPage, HttpServletRequest request) throws Exception{
		
		System.out.println(curPage);
		if(curPage == "") curPage = "1";		
		
		NoticePageDTO list = service.selectNoticePage(Integer.parseInt(curPage));
		// selectNoticePage가 실행되면서 totalCount가 set 되어야함.
		
		int tot = list.getTotalCount() / list.getPerPage();
		if(list.getTotalCount() % list.getPerPage() != 0) tot++;
		
		List<NoticeDTO> allList = service.selectAllNotice();		
		
		m.addAttribute("list", list);
		m.addAttribute("curPage", curPage);				
		m.addAttribute("totalPage", tot);
		
		return "board/noticeList";
	}
	
	//쿼리문을 받은 것에 대한 처리(id를 넘겨 받아 해당 content를 출력)
	@GetMapping(value="/board/noticeContent")
	public String content(Model m, @RequestParam int id) throws Exception{	
		
		NoticeDTO dto = service.selectNoticeContent(id);
		System.out.println(dto);
		m.addAttribute("dto", dto);
		
		return "board/noticeContent";
	}
	
	@GetMapping(value="/board/noticeDelete")
	public String delete(HttpServletRequest request, @RequestParam int id) throws Exception{
		
		int num = service.deleteNotice(id);
		
		return "board/notice/noticeDeleteSuccess";
	}

	
	@GetMapping(value="/board/noticeWrite")
	public String writeForm() throws Exception{		
		return "board/noticeWrite";
	}
	
	@GetMapping(value="/board/noticeWriteInsert")
	public int writeSave(NoticeDTO dto) throws Exception{		
		
		System.out.println(dto);	
		
		
		int num = service.insertNotice(dto);		
		return 0;
	}
	
	@GetMapping(value="/board/noticeSearch")	
	public String noticeSerach(@RequestParam("type") String type,
							   @RequestParam("keyword") String keyword,
			Model m) throws Exception{
		
		System.out.println("type:" + type);
		System.out.println(keyword);
		
		NoticeDTO sDTO = new NoticeDTO();
		
		sDTO.setType(type);
		sDTO.setKeyword(keyword);
		
		List<NoticeDTO> searchList = service.searchNotice(sDTO);
		
		m.addAttribute("searchList", searchList);
		
		return "board/noticeSearch";
	}
	
	
}

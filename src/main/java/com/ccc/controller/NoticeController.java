package com.ccc.controller;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ccc.dto.NoticeDTO;
import com.ccc.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService service;
	
	@GetMapping(value="/noticeList")
	public String notice(Model m, HttpServletRequest request) throws Exception{
		
		List<NoticeDTO> list = service.selectAllNotice();
		m.addAttribute("list", list);
		return "noticeList";
	}
	//쿼리문을 받은 것에 대한 처리(id를 넘겨 받아 해당 content를 출력)
	@GetMapping(value="/noticeContent")
	public String content(Model m, @RequestParam int id) throws Exception{	
		
		NoticeDTO dto = service.selectNoticeContent(id);
		System.out.println(dto);
		m.addAttribute("dto", dto);
		
		return "noticeContent";
	}
	
	@GetMapping(value="/noticeWrite")
	public String write(Model m, HttpServletRequest request) throws Exception{
				
		return "noticeWrite";
	}
	
}

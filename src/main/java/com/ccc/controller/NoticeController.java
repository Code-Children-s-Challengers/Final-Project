package com.ccc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ccc.dto.NoticeDTO;
import com.ccc.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService service;
	
	@GetMapping(value="/notice")
	public String notice(Model m, HttpServletRequest request) throws Exception{
		
		List<NoticeDTO> list = service.selectAllNotice();
		m.addAttribute("list", list);
		return "notice";
	}
	//쿼리문을 받은 것에 대한 처리(id를 넘겨 받아 해당 content를 출력)
	@GetMapping(value="/notice/content")
	public String content(Model m, HttpServletRequest request) throws Exception{
		// 모델에서 id 추출
		return "notice/content";
	}
	
}

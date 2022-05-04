package com.ccc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	@GetMapping(value="/notice")
	public String notice(HttpServletRequest request) throws Exception{
		return "notice";
	}
	
}

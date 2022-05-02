package com.ccc.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccc.dto.ChallengeDTO;
import com.ccc.service.ChallengeService;

@Controller
public class ChallengeController {
	@Autowired
	ChallengeService Cservice;
	
	
	@RequestMapping(value="/challenges", method = RequestMethod.GET)
	public String Challenges(Model m) throws Exception{
		List<ChallengeDTO> allList = Cservice.allChallenge();
//		List<ChallengeDTO> myList = new ArrayList<ChallengeDTO>();
		m.addAttribute("allList", allList);
		System.out.println("test");
		for(ChallengeDTO dto : allList) {
			System.out.println(dto);
		}
		return "challenge";
	}
	
	
	// 에러처리
	@ExceptionHandler({Exception.class})
	public String errorPage(Exception e) {
		e.printStackTrace();
		return "error/error";
	}
}
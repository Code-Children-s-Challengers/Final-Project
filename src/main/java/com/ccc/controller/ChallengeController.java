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
	public String Challenges(Model m, HttpServletRequest request) throws Exception{
		String category = request.getParameter("category");
		if(category == null) {
			category = "study";
		}
		List<ChallengeDTO> allList = Cservice.allChallenge();
		List<ChallengeDTO> hotList = new ArrayList<ChallengeDTO>();
		for(int i = 0; i < 4; i++) {
			hotList.add(allList.get(i));
		}
		List<ChallengeDTO> cList = Cservice.categoryChallenge(category);
		m.addAttribute("cList", cList);
		m.addAttribute("hotList", hotList);
		return "challenge";
	}
	
	@RequestMapping(value="/challengescategory", method = RequestMethod.GET)
	@ResponseBody
	public List<ChallengeDTO> ChallengesCategory(HttpServletRequest request) throws Exception{
		String category = request.getParameter("category");
		if(category == null) {
			category = "study";
		}
		List<ChallengeDTO> cList = Cservice.categoryChallenge(category);
		return cList;
	}
	
	
	// 에러처리
	@ExceptionHandler({Exception.class})
	public String errorPage(Exception e) {
		e.printStackTrace();
		return "error/error";
	}
}

package com.ccc.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
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
	public String ChallengesCategory(HttpServletRequest request, Model m) throws Exception{
		String category = request.getParameter("category");
		if(category == null) {
			category = "study";
		}
		List<ChallengeDTO> cList = Cservice.categoryChallenge(category);
		m.addAttribute("cList", cList);
		//return cList.toString();
		return "challenge/ajaxList";
	}

	@RequestMapping(value="/participantPopup", method = RequestMethod.GET)
	public String participantPopup(HttpServletRequest request, Model m) throws Exception{
		String cnum = request.getParameter("cnum");
		String photo = request.getParameter("photo");
		String name = request.getParameter("name");
		String date = request.getParameter("date");
		String people = request.getParameter("people");
		String fee = request.getParameter("fee");
		
		m.addAttribute("cnum", cnum);
		m.addAttribute("photo", photo);
		m.addAttribute("name", name);
		m.addAttribute("date", date);
		m.addAttribute("people", people);
		m.addAttribute("fee", fee);
		
		return "challenge/participantPopup";
	}
	
	
	@RequestMapping(value="/challengeParticipate", method = RequestMethod.POST)
	@ResponseBody
	public String challengeParticipate(@RequestParam int cnum) throws Exception{
		int unum = 1; // 임시, 로그인기능 완성되면 수정
		int num = 0;
		if(Cservice.findParticipant(unum, cnum) >= 1) {
			return "already participated";
		}else {
			num = Cservice.Participate(unum,cnum);
		}
		if(num == 0) {
			return "fail";
		}
		return "success";
	}
	
	
	// 에러처리
	@ExceptionHandler({Exception.class})
	public String errorPage(Exception e) {
		e.printStackTrace();
		return "error/error";
	}
}

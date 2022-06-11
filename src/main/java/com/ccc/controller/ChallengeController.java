package com.ccc.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ccc.config.login.auth.PrincipalDetails;
import com.ccc.dto.CPhotoDTO;
import com.ccc.dto.ChallengeDTO;
import com.ccc.service.ChallengeService;
import com.ccc.dto.PageDTO;
import com.ccc.dto.PhotoPageDTO;
import com.ccc.dto.ReportPageDTO;

@Controller
public class ChallengeController {
	@Autowired
	ChallengeService Cservice;
	
	////////////////////////////////////////////////////////////////////////////////// challenge 참가 페이지
	@RequestMapping(value="/challenges", method = RequestMethod.GET)
	public String Challenges(Model m, HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		String category = request.getParameter("category");
		String curPage = request.getParameter("curPage");
		String perPage = request.getParameter("perPage");
		int unum = principalDetails.getUser().getId();
		if(category == null) {
			category = "study";
		}
		if(curPage == null) {
			curPage = "1";
		}
		int pp = 8; // perPage
		if(perPage != null) {			
			pp = Integer.parseInt(perPage);
		}
		
		PageDTO dto = Cservice.categoryChallenge(category, Integer.parseInt(curPage),pp);
		dto.setPerPage(pp);
		int tot = dto.getTotalRecord() / dto.getPerPage();
		if(dto.getTotalRecord() % dto.getPerPage() != 0) tot++;
		
		
		List<ChallengeDTO> allList = Cservice.allChallenge();
		List<ChallengeDTO> hotList = new ArrayList<ChallengeDTO>();
		for(int i = 0; i < 4; i++) {
			if(allList.size() == i) {
				break;
			}
			hotList.add(allList.get(i));
		}
		m.addAttribute("curPage", curPage);
		m.addAttribute("perPage", pp);
		m.addAttribute("hotList", hotList);
		m.addAttribute("totalPage", tot);
		m.addAttribute("PageDTO", dto);
		m.addAttribute("catogory", category);
		
		return "challenge";
	}
	
	@RequestMapping(value="/challengescategory", method = RequestMethod.GET)
	public String ChallengesCategory(HttpServletRequest request, Model m) throws Exception{
		String category = request.getParameter("category");
		String curPage = request.getParameter("curPage");
		String perPage = request.getParameter("perPage");
		if(category == null) {
			category = "study";
		}
		if(curPage == null) {
			curPage = "1";
		}
		int pp = 8; // perPage
		if(perPage != null) {			
			pp = Integer.parseInt(perPage);
		}
		
		PageDTO dto = Cservice.categoryChallenge(category, Integer.parseInt(curPage),pp);
		dto.setPerPage(pp);
		int tot = dto.getTotalRecord() / dto.getPerPage();
		if(dto.getTotalRecord() % dto.getPerPage() != 0) tot++;
		
		
		m.addAttribute("curPage", curPage);
		m.addAttribute("perPage", pp);
		m.addAttribute("totalPage", tot);
		m.addAttribute("PageDTO", dto);
		m.addAttribute("catogory", category);
		
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
		String holiday = request.getParameter("holiday");

		m.addAttribute("cnum", cnum);
		m.addAttribute("photo", photo);
		m.addAttribute("name", name);
		m.addAttribute("date", date);
		m.addAttribute("people", people);
		m.addAttribute("fee", fee);
		m.addAttribute("holiday", holiday);
		
		return "challenge/participantPopup";
	}
	
	
	@RequestMapping(value="/challengeParticipate", method = RequestMethod.POST)
	@ResponseBody
	public String challengeParticipate(@RequestParam int cnum, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		int unum = principalDetails.getUser().getId();
		int num = 0;
		if(Cservice.findParticipant(unum, cnum) >= 1) {
			return "already participated";
		}else {
			ChallengeDTO dto = Cservice.challengeByCnum(cnum);
			if(dto.getFee() > principalDetails.getUser().getPoint()) {
				return "nomoney";
			}
			if(dto.getParticipant() >= dto.getMpeople()) {
				return "full";
			}
			num = Cservice.Participate(unum,cnum);
		}
		if(num == 0) {
			return "fail";
		}
		return "success";
	}
	
	@RequestMapping(value="/makeChallengePopup", method = RequestMethod.GET)
	public String makeChallengePopup() throws Exception{
		
		return "challenge/makeChallengePopup";
	}
	
	@RequestMapping(value="/skipdayPopup", method = RequestMethod.GET)
	public String skipdayPopup() throws Exception{
		return "challenge/skipdayPopup";
	}
	
	@RequestMapping(value="/makeChallenge", method = RequestMethod.POST)
	@ResponseBody
	public String makeChallenge(@RequestParam MultipartFile photo, @RequestParam String name, @RequestParam String category, @RequestParam Date start_date, @RequestParam Date end_date, @RequestParam int people, @RequestParam int fee, @RequestParam int holiday, @RequestParam String skiphidden, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		int unum = principalDetails.getUser().getId();
		int num = 0;
		
		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
        int cnum = Cservice.challengeNumber();
		
        String filename = "c_"+unum+"_"+Integer.toString(cnum+1)+".png";
        
        
		File savePath = new File("C://Users//sksms//Desktop//포트폴리오//final//Final-Project//src//main//resources//static//images//challenge//challenge_image", filename);
		try {
			photo.transferTo(savePath);
		} catch (IllegalStateException e) {
			return "fail";
		} catch (IOException e) {
			return "fail";
		}
		
		ChallengeDTO dto = new ChallengeDTO();
		dto.setCategory(category);
		dto.setPhoto(filename);
		dto.setName(name);
		dto.setSday(start_date.toString());
		dto.setEday(end_date.toString());
		dto.setHoliday(holiday);
		dto.setFee(fee);
		dto.setMpeople(people);
		
		num = Cservice.challengeAdd(dto);
		if(skiphidden.length() > 5) {
			num = Cservice.insertHoliday(Integer.toString(cnum+1), skiphidden);
		}
		num = Cservice.Participate(unum, cnum+1);
		
		return "success";
	}
	
	@RequestMapping(value="/endChallenge", method = RequestMethod.GET)
	@ResponseBody
	public String endChallenge(@AuthenticationPrincipal PrincipalDetails principalDetails, HttpServletRequest request) throws Exception{
		int unum = principalDetails.getUser().getId();
		String cnum = request.getParameter("cnum");
		int num = 0;
		
		num = Cservice.challengeCompleteCheck(cnum, Integer.toString(unum));
		if(num == 0) {
			num = Cservice.challengeCompleteUpdate(cnum, Integer.toString(unum));
			if(num >= 1) {
				return "success";
			}else {
				return "fail";
			}
		}else {
			return "alreadydone";
		}
	}
	
//////////////////////////////////////////////////////////////////////////////////challenge 참가 페이지
	
//////////////////////////////////////////////////////////////////////////////////내 challenge 페이지

	
	@RequestMapping(value="/mychallenges", method = RequestMethod.GET)
	public String myChallenges(Model m, HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		int unum = principalDetails.getUser().getId();
		String curPage = request.getParameter("curPage");
		String perPage = request.getParameter("perPage");
		if(curPage == null) {
			curPage = "1";
		}
		int pp = 20; // perPage
		if(perPage != null) {			
			pp = Integer.parseInt(perPage);
		}
		
		PageDTO dto = Cservice.userChallenge(unum, Integer.parseInt(curPage),pp);
		dto.setPerPage(pp);
		int tot = dto.getTotalRecord() / dto.getPerPage();
		if(dto.getTotalRecord() % dto.getPerPage() != 0) tot++;
		
		
		m.addAttribute("curPage", curPage);
		m.addAttribute("perPage", pp);
		m.addAttribute("totalPage", tot);
		m.addAttribute("PageDTO", dto);
		return "myChallenges";
	}
	
	@RequestMapping(value="/myChallengeRetrieve", method = RequestMethod.GET)
	public String myChallengeRetrieve(Model m, HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		int unum = principalDetails.getUser().getId();
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		ChallengeDTO challenge = Cservice.searchChallengeByNum(cnum);
		
		String curPage = request.getParameter("curPage");
		String perPage = request.getParameter("perPage");
		if(curPage == null) {
			curPage = "1";
		}
		int pp = 20; // perPage
		if(perPage != null) {			
			pp = Integer.parseInt(perPage);
		}
		
		PhotoPageDTO dto = Cservice.userChallengeRetrieve(unum, cnum, Integer.parseInt(curPage),pp);
		dto.setPerPage(pp);
		int tot = dto.getTotalRecord() / dto.getPerPage();
		if(dto.getTotalRecord() % dto.getPerPage() != 0) tot++;
		
		
		m.addAttribute("curPage", curPage);
		m.addAttribute("perPage", pp);
		m.addAttribute("totalPage", tot);
		m.addAttribute("PageDTO", dto);
		m.addAttribute("cdto", challenge);
		m.addAttribute("unum", unum);
		m.addAttribute("cnum", cnum);
		return "myChallengeRetrieve";
	}
	
	@RequestMapping(value="/uploadCertificationCheck", method = RequestMethod.GET)
	@ResponseBody
	public String uploadCertificationCheck(HttpServletRequest request) throws Exception{
		String today = request.getParameter("today");
		String cnum = request.getParameter("cnum");
		int num = Cservice.holidayCheck(cnum, today);
		if(num >= 1) {
			return "false";
		}
		else {
			return "true";
		}
	}
	
	@RequestMapping(value="/uploadCertificationPopup", method = RequestMethod.GET)
	public String uploadCertificationPopup(Model m, HttpServletRequest request) throws Exception{
		m.addAttribute("cnum", request.getParameter("cnum"));
		return "challenge/uploadCertificationPopup";
	}
	
	@RequestMapping(value="/uploadCertification", method = RequestMethod.POST)
	@ResponseBody
	public String uploadCertification(@RequestParam MultipartFile photo, @RequestParam int cnum, @RequestParam String comment, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		int unum = principalDetails.getUser().getId();
		int num = 0;

		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
        PhotoPageDTO pdto = Cservice.userChallengeRetrieve(unum, cnum, 1, 2);
        List<CPhotoDTO> list = pdto.getList();
        if(list != null && list.size() > 0 && list.get(0).getUploaddate().equals(date.toString())) {
        	return "alreadyUpload";
        }
        String filename = "c_"+Integer.toString(unum)+"_"+Integer.toString(cnum)+"_"+date.toString()+".png";
        
		File savePath = new File("C://Users//sksms//Desktop//포트폴리오//final//Final-Project//src//main//resources//static//images//challenge//certification_image", filename);
		try {
			photo.transferTo(savePath);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return "fail";
		} catch (IOException e) {
			e.printStackTrace();
			return "fail";
		}
		
		CPhotoDTO dto = new CPhotoDTO();
		dto.setCnum(cnum);
		dto.setUnum(unum);
		dto.setPhoto(filename);
		dto.setComent(comment);
		dto.setUploaddate(date.toString());
		num = Cservice.certificationAdd(dto);
		
		return "success";
	}
	
	@RequestMapping(value="/myChallengeRetrievePhoto", method = RequestMethod.GET)
	public String myChallengeRetrievePhoto(Model m, HttpServletRequest request) throws Exception{
		m.addAttribute("cnum", request.getParameter("cnum"));
		m.addAttribute("unum", request.getParameter("unum"));
		m.addAttribute("photo", request.getParameter("photo"));
		m.addAttribute("comment", request.getParameter("comment"));
		m.addAttribute("date", request.getParameter("date"));
		return "challenge/myChallengeRetrievePhoto";
	}
	
	@RequestMapping(value="/photoDelete", method = RequestMethod.POST)
	@ResponseBody
	public String photoDelete(@RequestParam String unum, @RequestParam String cnum, @RequestParam String date) throws Exception{
		int num = 0;


		num = Cservice.photoDelete(cnum, unum, date.substring(2, 4)+"/"+date.substring(5, 7)+"/"+date.substring(8, 10));
		if(num >= 1) {			
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value="/challengeReport", method = RequestMethod.POST)
	@ResponseBody
	public String challengeReport(@AuthenticationPrincipal PrincipalDetails principalDetails, @RequestParam String unum, @RequestParam String cnum, @RequestParam String date) throws Exception{
		String reportnum = Integer.toString(principalDetails.getUser().getId());
		int num = 0;
		date = date.substring(2, 4)+"/"+date.substring(5, 7)+"/"+date.substring(8, 10);
		num = Cservice.ReportCheck(cnum, unum, date, reportnum);
		if(num >= 1) {
			return "already reported";
		}else {
			num = Cservice.ReportAdd(cnum, unum, date,reportnum);
			if(num >= 1) {
				return "success";
			}else {
				return "fail";
			}
		}
	}
//////////////////////////////////////////////////////////////////////////////////내 challenge 페이지
//////////////////////////////////////////////////////// report page
	@RequestMapping(value="/checkCertificationReport", method = RequestMethod.GET)
	public String checkCertificationReport(Model m, HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		String reportnum = Integer.toString(principalDetails.getUser().getId()); // 관리자 권한 확인용
		
		String curPage = request.getParameter("curPage");
		String perPage = request.getParameter("perPage");
		int unum = principalDetails.getUser().getId();

		if(curPage == null) {
			curPage = "1";
		}
		int pp = 10; // perPage
		if(perPage != null) {			
			pp = Integer.parseInt(perPage);
		}
		
		ReportPageDTO dto = Cservice.allCertificationReport(Integer.parseInt(curPage),pp);
		dto.setPerPage(pp);
		int tot = dto.getTotalRecord() / dto.getPerPage();
		if(dto.getTotalRecord() % dto.getPerPage() != 0) tot++;

		m.addAttribute("curPage", curPage);
		m.addAttribute("perPage", pp);
		m.addAttribute("totalPage", tot);
		m.addAttribute("PageDTO", dto);
		
		
		return "ReportList";
	}
	
	@RequestMapping(value="/reportCheck", method = RequestMethod.GET)
	public String reportCheck(Model m, @AuthenticationPrincipal PrincipalDetails principalDetails, HttpServletRequest request) throws Exception{
		String reportnum = Integer.toString(principalDetails.getUser().getId()); // 관리자 권한 확인
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int unum = Integer.parseInt(request.getParameter("unum"));
		String date = request.getParameter("date");
		int num = 0;
		date = date.substring(2, 4)+"/"+date.substring(5, 7)+"/"+date.substring(8, 10);
		CPhotoDTO dto = Cservice.certificationRetrieve(unum, cnum, date);
		m.addAttribute("dto", dto);
		return "challenge/reportCheck";
	}
	
	@RequestMapping(value="/reportUpdate", method = RequestMethod.POST)
	@ResponseBody
	public String reportUpdate(@AuthenticationPrincipal PrincipalDetails principalDetails, @RequestParam String unum, @RequestParam String cnum, @RequestParam String date) throws Exception{
		String reportnum = Integer.toString(principalDetails.getUser().getId()); // 관리자 권한 확인
		int num = 0;
		date = date.substring(2, 4)+"/"+date.substring(5, 7)+"/"+date.substring(8, 10);
		num = Cservice.validationUpdate(unum, cnum, date);
		if(num >= 1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value="/reportDelete", method = RequestMethod.POST)
	@ResponseBody
	public String reportDelete(@AuthenticationPrincipal PrincipalDetails principalDetails, @RequestParam String unum, @RequestParam String cnum, @RequestParam String date) throws Exception{
		String reportnum = Integer.toString(principalDetails.getUser().getId()); // 관리자 권한 확인
		int num = 0;
		date = date.substring(2, 4)+"/"+date.substring(5, 7)+"/"+date.substring(8, 10);
		num = Cservice.reportDelete(unum, cnum, date);
		if(num >= 1) {
			return "success";
		}else {
			return "fail";
		}
	}

//////////////////////////////////////////////////////// report page
	
	// 에러처리
	@ExceptionHandler({Exception.class})
	public String errorPage(Exception e) {
		e.printStackTrace();
		return "error/error";
	}
}

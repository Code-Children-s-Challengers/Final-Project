package com.ccc.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ccc.config.login.auth.PrincipalDetails;
import com.ccc.dao.UserDAO;
import com.ccc.dto.CPhotoDTO;
import com.ccc.dto.ChallengeDTO;
import com.ccc.dto.ChallengeImageDTO;
import com.ccc.dto.PageDTO;
import com.ccc.dto.PhotoPageDTO;
import com.ccc.dto.ProfileImageDTO;
import com.ccc.dto.ReportPageDTO;
import com.ccc.service.ChallengeService;

@Controller
public class ChallengeController {
	@Autowired
	ChallengeService Cservice;
	
	@Autowired
	UserDAO userDAO;
	
	
	/////////////////////////////////////// ajax를 통한 카테고리별 탭 만들기 ///////////////
	@RequestMapping(value="/challengesAjax", method = RequestMethod.GET)
	public String ChallengesAjax(Model m, HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
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
		
		PageDTO dto = Cservice.categoryChallenge(category, Integer.parseInt(curPage),pp); //Page처리
		dto.setPerPage(pp);
		int tot = dto.getTotalRecord() / dto.getPerPage();
		if(dto.getTotalRecord() % dto.getPerPage() != 0) tot++;
		
		
		List<ChallengeDTO> allList = Cservice.allChallenge();
		List<ChallengeDTO> hotList = new ArrayList<ChallengeDTO>(); 
		for(int i = 0; i < 4; i++) {
			if(allList.size() == i) {
				break;
			}
			hotList.add(allList.get(i)); // hot리스트에 추가한다?
		}
		m.addAttribute("curPage", curPage);
		m.addAttribute("perPage", pp);
		m.addAttribute("hotList", hotList);
		m.addAttribute("totalPage", tot);
		m.addAttribute("PageDTO", dto);
		m.addAttribute("catogory", category);
		
		return "challenge/categoryData"; 
		
	}
	
	
	////////////////////////////////////////////////////////////////////////////////// challenge 참가 페이지
	@RequestMapping(value="/challenges", method = RequestMethod.GET)
	public String Challenges(Model m, HttpServletRequest request) throws Exception{
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
		
		PageDTO dto = Cservice.categoryChallenge(category, Integer.parseInt(curPage),pp); //Page처리
		dto.setPerPage(pp);
		int tot = dto.getTotalRecord() / dto.getPerPage();
		if(dto.getTotalRecord() % dto.getPerPage() != 0) tot++;
		
		
		List<ChallengeDTO> allList = Cservice.allChallenge();
		List<ChallengeDTO> hotList = new ArrayList<ChallengeDTO>(); 
		for(int i = 0; i < 4; i++) {
			if(allList.size() == i) {
				break;
			}
			hotList.add(allList.get(i)); // hot리스트에 추가한다?
		}
		m.addAttribute("curPage", curPage);
		m.addAttribute("perPage", pp);
		m.addAttribute("hotList", hotList);
		m.addAttribute("totalPage", tot);
		m.addAttribute("PageDTO", dto);
		m.addAttribute("catogory", category);
		
		return "challenge"; //challenge.jsp => 메인화면이겠군
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

	@RequestMapping(value="/participantPopup", method = RequestMethod.GET) //참여할 수 있는 팝업창
	public String participantPopup(HttpServletRequest request, Model m) throws Exception{
		String cnum = request.getParameter("cnum");
//		String photo = request.getParameter("photo");
//		String name = request.getParameter("name");
//		String date = request.getParameter("date");
//		String people = request.getParameter("people");
//		String fee = request.getParameter("fee");
//		String holiday = request.getParameter("holiday");
		
		//홍석
		ChallengeDTO challenge = Cservice.challengeByCnum(Integer.parseInt(cnum));
		//

		m.addAttribute("cnum", cnum);
		m.addAttribute("photo", challenge.getPhoto());
		m.addAttribute("name", challenge.getName());
		m.addAttribute("date", challenge.getSday());
		m.addAttribute("people", challenge.getParticipant());
		m.addAttribute("fee", challenge.getFee());
		m.addAttribute("holiday", challenge.getHoliday());
		
		return "challenge/participantPopup";
	}
	
	
	@RequestMapping(value="/challengeParticipate", method = RequestMethod.POST) // 실제 참가를 진행해주는 메서드
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
	
	@RequestMapping(value="/makeChallengePopup", method = RequestMethod.GET) //챌린지 만들기 팝업
	public String makeChallengePopup() throws Exception{
		
		return "challenge/makeChallengePopup2";
	}
	
	@RequestMapping(value="/skipdayPopup", method = RequestMethod.GET)
	public String skipdayPopup() throws Exception{
		return "challenge/skipdayPopup";
	}
	
	@PostMapping("/makeChallenge")
	//@RequestMapping(value="/makeChallenge", method = RequestMethod.POST)
	@ResponseBody
	public String makeChallenge(@RequestParam MultipartFile photo, @RequestParam String name, @RequestParam String category, @RequestParam Date start_date, @RequestParam Date end_date, @RequestParam int people, @RequestParam int fee, @RequestParam int holiday, @RequestParam String skiphidden, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		int unum = principalDetails.getUser().getId();
		int num = 0;
		
		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
        int cnum = Cservice.challengeNumber();
		
        
       
        /*
         * 홍석 추가
         */
        System.out.println("please0");
		ChallengeImageDTO challengeImage = new ChallengeImageDTO();
		challengeImage.setCnum(cnum+1);
		challengeImage.setMimetype(photo.getContentType());
		System.out.println(photo.getContentType());
		challengeImage.setOriginal_name(photo.getOriginalFilename());
		System.out.println(photo.getOriginalFilename());
		challengeImage.setData(photo.getBytes());
		System.out.println("여긴가?");
		
		System.out.println("please1");
		userDAO.insertChallengeImage(challengeImage);
		System.out.println("please1");

		/*
         * 홍석 추가
         */
		
		ChallengeDTO dto = new ChallengeDTO();
		dto.setCategory(category);
		dto.setPhoto("사진");
		dto.setName(name);
		dto.setSday(start_date.toString());
		dto.setEday(end_date.toString());
		dto.setHoliday(holiday);
		dto.setFee(fee);
		dto.setMpeople(people);
		
//		num = Cservice.challengeAdd(dto);
//		if(skiphidden != null && skiphidden.length() > 5) {
//			num = Cservice.insertHoliday(Integer.toString(cnum+1), skiphidden);
//		}
//		num = Cservice.Participate(unum, cnum+1);
		num = Cservice.challengeAdd_Participate(dto,unum,cnum+1,skiphidden);
		
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
		System.out.println("--------------------------------------------------");
		System.out.println(cnum+" "+today);
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
        
    	File savePath = new File("C://Users//홍석//git//Final-Project//src//main//resources//static//images//challenge//challenge_image", filename);
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
	
	
	
	// DB에 저장된 챌린지 사진 가져오기 -- 홍석
	@GetMapping("/challengeImage/{cnum}")
	public ResponseEntity<byte[]> findProfileImage(@PathVariable int cnum){
		System.out.println(cnum);
		ChallengeImageDTO challengeIamge = userDAO.findChallengeImage(cnum);
		System.out.println(challengeIamge);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type",challengeIamge.getMimetype());
		headers.add("Content-Length", String.valueOf(challengeIamge.getData().length));
		return new ResponseEntity<byte[]>(challengeIamge.getData(),headers, HttpStatus.OK);
	}
	
}


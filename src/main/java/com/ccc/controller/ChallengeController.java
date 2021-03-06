package com.ccc.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ccc.config.login.auth.PrincipalDetails;
import com.ccc.dao.UserDAO;
import com.ccc.dto.CPhotoDTO;
import com.ccc.dto.CPhotoImageDTO;
import com.ccc.dto.ChallengeDTO;
import com.ccc.dto.ChallengeImageDTO;
import com.ccc.dto.PageDTO;
import com.ccc.dto.PhotoPageDTO;
import com.ccc.dto.ReportPageDTO;
import com.ccc.dto.UserDTO;
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
		int pp = 6; // perPage
		if(perPage != null) {			
			pp = Integer.parseInt(perPage);
		}
		
		PageDTO dto = Cservice.categoryChallenge(category, Integer.parseInt(curPage),pp); //Page처리
		dto.setPerPage(pp);
		int tot = dto.getTotalRecord() / dto.getPerPage();
		if(dto.getTotalRecord() % dto.getPerPage() != 0) tot++;
		
		
		List<ChallengeDTO> allList = Cservice.allChallenge();
		List<ChallengeDTO> hotList = new ArrayList<ChallengeDTO>(); 
		for(int i = 0; i < 3; i++) {
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
		m.addAttribute("category", category);
		
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
		int pp = 6; // perPage
		if(perPage != null) {			
			pp = Integer.parseInt(perPage);
		}
		
		//카테고리별로 오늘 날짜 이후의 챌린지를 보여준다.
		PageDTO dto = Cservice.categoryChallenge(category, Integer.parseInt(curPage),pp); //Page처리
		dto.setPerPage(pp);
		int tot = dto.getTotalRecord() / dto.getPerPage();
		if(dto.getTotalRecord() % dto.getPerPage() != 0) tot++;
		System.out.println(dto.getTotalRecord());
		
		List<ChallengeDTO> allList = Cservice.allChallenge();
		List<ChallengeDTO> hotList = new ArrayList<ChallengeDTO>(); 
		for(int i = 0; i < 3; i++) {
			if(allList.size() == i) {
				break;
			}
			hotList.add(allList.get(i)); // hot리스트에 추가한다?
		}
		System.out.println("totalPage"+tot);

		m.addAttribute("curPage", curPage);
		m.addAttribute("perPage", pp);
		m.addAttribute("hotList", hotList);
		m.addAttribute("totalPage", tot);
		m.addAttribute("PageDTO", dto);
		m.addAttribute("category", category);		
		
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

	@Secured("ROLE_USER")
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
		
		return "challenge/participantPopup2";
	}
	
	// 챌린지 참가하기 => 사용
	@Secured("ROLE_USER")
	@RequestMapping(value="/challengeParticipate", method = RequestMethod.POST) // 실제 참가를 진행해주는 메서드
	@ResponseBody
	public String challengeParticipate(@RequestParam int cnum, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		UserDTO user = userDAO.findByUsername(principalDetails.getUser().getUsername());
		int unum =  user.getId();
		
		int num = 0;
		if(Cservice.findParticipant(unum, cnum) >= 1) {
			return "already participated";
		}else {
			ChallengeDTO dto = Cservice.challengeByCnum(cnum);
			if(dto.getFee() > user.getPoint()) {
				return "nomoney";
			}
			if(dto.getParticipant() >= dto.getMpeople()) {
				return "full";
			}
			num = Cservice.ParticipatePoint(unum,cnum, dto.getEday(), dto.getFee());
		}
		if(num == 0) {
			return "fail";
		}
		return "success";
	}
	
	@RequestMapping(value="/makeChallengePopup", method = RequestMethod.GET) //챌린지 만들기 팝업
	public String makeChallengePopup(Model m) throws Exception{
		return "challenge/makeChallengePopup2";
	}
	
	@RequestMapping(value="/skipdayPopup", method = RequestMethod.GET)
	public String skipdayPopup() throws Exception{
		return "challenge/skipdayPopup";
	}
	
	//챌린지 만들기 => 사용
	@PostMapping("/makeChallenge")
	@ResponseBody
	//@RequestMapping(value="/makeChallenge", method = RequestMethod.POST)
	public String makeChallenge(@RequestParam MultipartFile photo, @RequestParam String name, @RequestParam String category, @RequestParam Date start_date, @RequestParam Date end_date, @RequestParam int people, @RequestParam int fee, @RequestParam int holiday, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		UserDTO user = userDAO.findByUsername(principalDetails.getUser().getUsername());
		int unum =  user.getId();
		
		int num = 0;
		
		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
        int cnum = Cservice.challengeNumber();
		
        //금액이 부족하면
        if(user.getPoint() < fee) {
        	return "fail";
        }
        
       
        /*
         * 홍석 추가
         */
		ChallengeImageDTO challengeImage = new ChallengeImageDTO();
		challengeImage.setCnum(cnum+1);
		challengeImage.setMimetype(photo.getContentType());
		challengeImage.setOriginal_name(photo.getOriginalFilename());
		challengeImage.setData(photo.getBytes());
		
		userDAO.insertChallengeImage(challengeImage);

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
		
		String skiphidden= "0";
//		num = Cservice.challengeAdd(dto);
//		if(skiphidden != null && skiphidden.length() > 5) {
//			num = Cservice.insertHoliday(Integer.toString(cnum+1), skiphidden);
//		}
//		num = Cservice.Participate(unum, cnum+1);
		num = Cservice.challengeAdd_Participate(dto,unum,cnum+1,skiphidden, dto.getEday(), dto.getFee());
		
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

	@Secured("ROLE_USER")
	@GetMapping("/myChallengeTab")
	public String myChallengeTab(Model m, HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		//userId
		UserDTO user = userDAO.findByUsername(principalDetails.getUser().getUsername());
		int unum =  user.getId();
		
		//어떤 tab을 선택했는가
		String tab = request.getParameter("tab");
		System.out.println("tab: "+tab);
		
		// db에서 가져온 pageDTO
		PageDTO dto = Cservice.userChallenge(unum, 0,0);
		
		// 이미 start했으며 종료하지 않은 챌린지들만 따로 담을 pageDTO
		PageDTO dto2 = new PageDTO();
		List<ChallengeDTO> list2 = new ArrayList<ChallengeDTO>();
		
		// 아직 대기 중인 챌린지들만 따로 담을 pageDTO
		PageDTO dto3 = new PageDTO();
		List<ChallengeDTO> list3 = new ArrayList<ChallengeDTO>();
		
		// 이미 종료한 챌린지들만 따로 담을 pageDTO
		PageDTO dto4 = new PageDTO();
		List<ChallengeDTO> list4 = new ArrayList<ChallengeDTO>(); // 데이터 정제용
		List<ChallengeDTO> list5 = new ArrayList<ChallengeDTO>(); //실제 완료 챌린지들을 담는 용도
		

		
		
		// 오늘 날짜
		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
		
      
        
               
		// ChallengList 중에서 오늘 날짜에, validate가 1인 사진이 등록되어 있는 챌린지들은?
		//cnum, date 해서 갯수를 가지고 온다		
        for(ChallengeDTO ch :  dto.getList()) {
        	Map<String, String> map = new HashMap<String,String>();
        	map.put("cnum", Integer.toString(ch.getCnum()));
        	map.put("unum", Integer.toString(unum));
        	map.put("date", date.toString());
        	int i = userDAO.findAllCphotoForValidity(map);
        	ch.setTodayCheck(i); // 오늘 인증했으면 1, 아직 인증하지 않았으면 0; 1=> 초록색으로 표시, 0=> 노란색으로 표시
        }
		
        // 챌린지 별 코멘트 리스트
        for(ChallengeDTO ch : dto.getList()) {
        	 Map<String,String> map2 = new HashMap<String,String>();
             map2.put("cnum", Integer.toString(ch.getCnum()));
             map2.put("unum", Integer.toString(unum));
             List<CPhotoImageDTO> cphotoList = userDAO.findAllCphoto(map2);
        	
             //챌린지 별로 코멘트들을 모아둔다.
             List<Map<String, String>> commentList = new ArrayList<Map<String,String>>();
             for(CPhotoImageDTO cphoto : cphotoList) {
            	 Map<String,String> map = new HashMap<String,String>();
            	 // key => cnum+uploaddate / value -> comment
            	 map.put(cphoto.getUploaddate(), cphoto.getC_comment());
            	 commentList.add(map);
             }
             ch.setCommentList(commentList); //ChallengDTO 각각에 코멘트를 담아둔다.
        }
        
        
        
        for(ChallengeDTO ch : dto.getList()) {
        	//개별 챌린지챌린지의 시작 날짜
        	String startDay = ch.getSday();
        	String endDay = ch.getEday();
        	
        	//포매터(날짜를 비교하기 위한 수단)
        	 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        	 java.util.Date startDate =  formatter.parse(startDay);
        	 java.util.Date endDate =  formatter.parse(endDay);
        	 
        	 if((startDate.before(date) || startDate.equals(date)) && (endDate.after(date) || endDate.equals(date)) ) { //1. 현재 참여 중인 챌린지 => 시작일이 오늘보다 빠르거나 같고 종료일이 오늘보다 느리거나 같은 챌린지
        		 list2.add(ch);       		 
        	 }else if(startDate.after(date)) { //2. 시작일이 오늘 날짜보다 더 늦은 챌린지(대기 중인 챌린지) =>  wait tab
        		 list3.add(ch);  
        	 }else if(endDate.before(date)) { //3. 종료일이 이미 오늘 날짜를 지난 챌린지(완료한 tab) =>  complete tab
        		 list4.add(ch);  
        	 }
        }
        
        //완료한 데이터의 경우 환급 여부를 살펴본다
        for(ChallengeDTO ch : list4) {
        	ch.setValidP(Cservice.findValidP(ch.getCnum(), unum)); //환급여부를 살펴온다
        	list5.add(ch);
        }
        dto2.setList(list2); //1 참여 중인 챌린지
        dto3.setList(list3); //2 대기 중인 챌린지
        dto4.setList(list5); //3 완료한 챌린지ㄴ
        
     // 어떤 DTO를 보낼 것인가 dto2, dto3, dto4, dto5 네 개 중 하나
        if(tab.equals("ing")) {
        	m.addAttribute("PageDTO2", dto2);
        }else if(tab.equals("wait")) {
        	m.addAttribute("PageDTO2", dto3);
        }else if(tab.equals("complete")) {
        	m.addAttribute("PageDTO2", dto4);
        }
        
        m.addAttribute("tab", tab);
        m.addAttribute("PageDTO", dto);// 모든 나의 챌린지
		m.addAttribute("unum",unum);
		return "challenge/myChallengeData";
	}
	
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/mychallenges", method = RequestMethod.GET)
	public String myChallenges(Model m, HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{

		UserDTO user = userDAO.findByUsername(principalDetails.getUser().getUsername());
		int unum =  user.getId();
		
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
	
		
		// 오늘 날짜
		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
        
        
		// ChallengList 중에서 오늘 날짜에, validate가 1인 사진이 등록되어 있는 챌린지들은?
		//cnum, date 해서 갯수를 가지고 온다		
        for(ChallengeDTO ch :  dto.getList()) {
        	Map<String, String> map = new HashMap<String,String>();
        	map.put("cnum", Integer.toString(ch.getCnum()));
        	map.put("unum", Integer.toString(unum));
        	map.put("date", date.toString());
        	int i = userDAO.findAllCphotoForValidity(map);
        	ch.setTodayCheck(i); // 오늘 인증했으면 1, 아직 인증하지 않았으면 0; 1=> 초록색으로 표시, 0=> 노란색으로 표시
        }
		
        // 챌린지 별 코멘트 리스트
        for(ChallengeDTO ch : dto.getList()) {
        	 Map<String,String> map2 = new HashMap<String,String>();
             map2.put("cnum", Integer.toString(ch.getCnum()));
             map2.put("unum", Integer.toString(unum));
             List<CPhotoImageDTO> cphotoList = userDAO.findAllCphoto(map2);
        	
             //챌린지 별로 코멘트들을 모아둔다.
             List<Map<String, String>> commentList = new ArrayList<Map<String,String>>();
             for(CPhotoImageDTO cphoto : cphotoList) {
            	 Map<String,String> map = new HashMap<String,String>();
            	 // key => cnum+uploaddate / value -> comment
            	 map.put(cphoto.getUploaddate(), cphoto.getC_comment());
            	 commentList.add(map);
             }
             ch.setCommentList(commentList);
        }
        
     // 이미 start한 챌린지들만 따로 담을 pageDTO
     		PageDTO dto2 = new PageDTO();
     		List<ChallengeDTO> list2 = new ArrayList<ChallengeDTO>();
     		
        for(ChallengeDTO ch : dto.getList()) {
        	//개별 챌린지챌린지의 시작 날짜
        	String startDay = ch.getSday();
        	String endDay = ch.getEday();
        	
        	//포매터(날짜를 비교하기 위한 수단)
        	 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        	 java.util.Date startDate =  formatter.parse(startDay);
        	 java.util.Date endDate =  formatter.parse(endDay);
        	 
        	 if((startDate.before(date) || startDate.equals(date)) && (endDate.after(date) || endDate.equals(date))) { //시작날짜가 오늘 날짜보다 빠르거나 같으면 dto2의 챌린지 list에 담는다 
        		 list2.add(ch);       		 
        	 }
        }
        dto2.setList(list2);
        
        m.addAttribute("point",user.getPoint());
        m.addAttribute("PageDTO2", dto2); // 이미 시작한 챌린지들만 담은 pageDTO
        m.addAttribute("PageDTO", dto);// 모든 나의 챌린지
		m.addAttribute("unum",unum);
		m.addAttribute("curPage", curPage);
		m.addAttribute("perPage", pp);
		m.addAttribute("totalPage", tot);
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
	
	//인증완료했는가 안 했는가?
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
	
	//인증 창
	@RequestMapping(value="/uploadCertificationPopup", method = RequestMethod.GET)
	public String uploadCertificationPopup(Model m, HttpServletRequest request) throws Exception{
		m.addAttribute("cnum", request.getParameter("cnum"));
		return "challenge/uploadCertificationPopup";
	}
	
	
	//인증하기-- 무진님 버진
	@RequestMapping(value="/uploadCertification", method = RequestMethod.POST)
	@ResponseBody
	public String uploadCertification(@RequestParam MultipartFile photo, @RequestParam int cnum, @RequestParam String comment, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		int unum = principalDetails.getUser().getId();
		int num = 0;

		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
        
        //이미 인증을 했는지 안 했는지 확인한다.
        PhotoPageDTO pdto = Cservice.userChallengeRetrieve(unum, cnum, 1, 2);
        List<CPhotoDTO> list = pdto.getList();
        if(list != null && list.size() > 0 && list.get(0).getUploaddate().equals(date.toString())) {
        	return "alreadyUpload";
        }
        ///////////////////
        
        
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
	
	//인증하기 -- 홍석버전
	@ResponseBody
	@PostMapping("/upload/{cnum}")
	public String upload(@PathVariable int cnum,  @RequestParam("uploadPh") MultipartFile uploadPh, CPhotoImageDTO cphoto, @AuthenticationPrincipal PrincipalDetails p) {
		
		//unum 가지고 옴
		int unum = (userDAO.findByUsername(p.getUsername())).getId();
			
		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
        Map<String,String> map = new HashMap<String,String>();
        map.put("cnum", Integer.toString(cnum));
        map.put("unum", Integer.toString(unum));
        map.put("date", date.toString());
        System.out.println("date:" + date.toString());
        // 오늘 인증을 한 상태이면 더 이상 인증 못함
        int count = userDAO.findAllCphotoForValidity(map);
        if(count!=0) {
        	return "fail";
        }
        
        //인증 사진을 DB에 저장
        CPhotoImageDTO insertPhoto = new CPhotoImageDTO();
        insertPhoto.setC_comment(cphoto.getC_comment());
        insertPhoto.setCnum(cnum);
        try {
			insertPhoto.setData(uploadPh.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
        insertPhoto.setMimetype(uploadPh.getContentType());
        insertPhoto.setOriginal_name(uploadPh.getOriginalFilename());
        insertPhoto.setUnum(unum);
        insertPhoto.setUploaddate(date.toString());
        insertPhoto.setValidates(1);
        
        userDAO.insertCPhoto(insertPhoto);
        
        //성공 메세지
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
//	
	// 에러처리
	@ExceptionHandler({AccessDeniedException.class})
	public String errorPage(Exception e) {
		e.printStackTrace();
		return "error/error";
	}
	
	
	
	// DB에 저장된 챌린지 사진 가져오기 -- 홍석
	@GetMapping("/challengeImage/{cnum}")
	public ResponseEntity<byte[]> findProfileImage(@PathVariable int cnum){
		System.out.println(cnum);
		ChallengeImageDTO challengeIamge = userDAO.findChallengeImage(cnum);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type",challengeIamge.getMimetype());
		headers.add("Content-Length", String.valueOf(challengeIamge.getData().length));
		return new ResponseEntity<byte[]>(challengeIamge.getData(),headers, HttpStatus.OK);
	}
	
	// DB에 저장된 인증 사진 가져오기 -- 홍석
//	@ResponseBody
//	@GetMapping("/cPhotoImage/{cnum}/{unum}")
//	public List<ResponseEntity<byte[]>> findCPhotoImage(@PathVariable int cnum,@PathVariable int unum){
//		System.out.println(cnum);
//		
//		Map<String,Integer> map = new HashMap<String,Integer>();
//		map.put("cnum", cnum);
//		map.put("unum", unum);
//		List<CPhotoImageDTO> list = userDAO.findCPhotoImage(map);
//
//		
//		List<ResponseEntity<byte[]>> list2 = new ArrayList<ResponseEntity<byte[]>>();
//		for(CPhotoImageDTO cphoto : list) {
//			HttpHeaders headers = new HttpHeaders();
//			headers.add("Content-Type",cphoto.getMimetype());
//			headers.add("Content-Length", String.valueOf(cphoto.getData().length));
//			list2.add( new ResponseEntity<byte[]>(cphoto.getData(),headers, HttpStatus.OK));
//		}
//		return list2;
//	}
	
	@GetMapping("/cPhotoImage/{cnum}/{unum}/{uploaddate}")
	public ResponseEntity<byte[]> findCPhotoImage(Model m, @PathVariable int cnum,@PathVariable int unum, @PathVariable String uploaddate){
		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("cnum", Integer.toString(cnum));
		map.put("unum", Integer.toString(unum));
		map.put("uploaddate", uploaddate);
		System.out.println(map);
		
		CPhotoImageDTO cphoto = userDAO.findCPhotoImage(map);
		CPhotoImageDTO cphotoBasic = new CPhotoImageDTO();
		
		
		if(cphoto == null) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type",cphotoBasic.getMimetype());
			headers.add("Content-Length", String.valueOf(cphotoBasic.getData().length));
			return new ResponseEntity<byte[]>(cphotoBasic.getData(),headers, HttpStatus.OK);
		}else {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type",cphoto.getMimetype());
			headers.add("Content-Length", String.valueOf(cphoto.getData().length));
			return  new ResponseEntity<byte[]>(cphoto.getData(),headers, HttpStatus.OK);
		}
		
		
	}

	//아직 시작하지 않은 챌린지 취소하기
	@GetMapping("/cancle/{cnum}/{unum}")
	@ResponseBody
	public String cancle(@PathVariable int cnum,@PathVariable int unum) {
		System.out.println("챌린지 취소하기 거의 다 왔다 힘내자!");
		
		int num = Cservice.cancleCh(cnum, unum);
		String message;
		if( num == 1){
			message = "success";
		}else {
			message = "fail";
		}
		
		return message;
	}
	
	//챌린지 완료 후 포인트 환급받기
	@GetMapping("/pointBack/{cnum}/{unum}/{realPoint}")
	@ResponseBody
	public String pointBack(@PathVariable int cnum,@PathVariable int unum,@PathVariable int realPoint) {
		
		int num = Cservice.pointBack(cnum, unum, realPoint);
		
		
		return "success";
	}
}


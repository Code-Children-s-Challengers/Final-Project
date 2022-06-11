package com.ccc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ccc.config.login.auth.PrincipalDetails;
import com.ccc.dao.UserDAO;
import com.ccc.dto.ProfileImageDTO;
import com.ccc.dto.UserDTO;

import springfox.documentation.schema.Model;

@Controller //view 리턴하겠다
public class MyPageContorller {
	@Autowired
	UserDAO userDAO;
	
	@Secured("ROLE_USER")
	@GetMapping("/member/myPage")
	public ModelAndView loginForm(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		UserDTO user = principalDetails.getUser();
		UserDTO userDB = userDAO.findByUsername(user.getUsername());
		
		ModelAndView mav = new ModelAndView();
		if(userDB.getNickname() == null) {
			mav.setViewName("additionalInfoForm");
			return mav;
		}else {
			Map<String, String> modelMap = new HashMap<String,String>();
			modelMap.put("id", Integer.toString(userDB.getId()));
			modelMap.put("nickname1", userDB.getNickname());

			mav.setViewName("/member/myPage");
			mav.addAllObjects(modelMap);
			System.out.println(userDB.getNickname());
			System.out.println("이게 맞는데");

			return mav;
		}		
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/member/myPage")
	public ModelAndView loginForm2(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		UserDTO user = principalDetails.getUser();
		UserDTO userDB = userDAO.findByUsername(user.getUsername());
		
		ModelAndView mav = new ModelAndView();
		if(userDB.getNickname() == null) {
			mav.setViewName("additionalInfoForm");
			return mav;
		}else {
			mav.setViewName("/member/myPage");
			mav.addObject("id", userDB.getId());
			mav.addObject("nickname", userDB.getNickname());
			System.out.println(userDB.getNickname());

			return mav;
		}		
	}
	
	
	@Secured("ROLE_USER")
	@GetMapping("/member/myInfo/{id}")
	public ModelAndView myInfo(@PathVariable int id) {
		UserDTO user = userDAO.findUser(id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myInfo");
		mav.addObject("email", user.getEmail());
		mav.addObject("phoneNumber", user.getPhoneNumber());
		mav.addObject("password", user.getPassword());
		return mav;
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/member/myPoint")
	public String myPoint() {
		return "member/myPoint";
	}
	
	
	@Secured("ROLE_USER")
	@GetMapping("/member/myChallenges")
	public String myChallenges() {
		return "member/myChallenges";
	}
	
	// 사진 업로드하기 연습  예제
	@Secured("ROLE_USER")
	@PostMapping("/upload")
	public String handleFileUpload(@RequestParam("file") MultipartFile file, @AuthenticationPrincipal PrincipalDetails principalDetails) throws IOException{
		int id = principalDetails.getUser().getId();
		ProfileImageDTO originalProfileImage = userDAO.findProfileImage(id);
		
		ProfileImageDTO profileImage = new ProfileImageDTO();
		profileImage.setId(id);
		profileImage.setMimetype(file.getContentType());
		profileImage.setOriginal_name(file.getOriginalFilename());
		profileImage.setData(file.getBytes());
		System.out.println(profileImage);
		
		if(originalProfileImage == null) {
			userDAO.insertProfileImage(profileImage);
		}else {
			userDAO.updateProfileImage(profileImage);
		}

		return "redirect:/member/myPage";
	}
	
	// 저장된 사진 가져오기
	@Secured("ROLE_USER")
	@GetMapping("/view/{id}")
	public ResponseEntity<byte[]> findProfileImage(@PathVariable int id){
		ProfileImageDTO profileIamge = userDAO.findProfileImage(id);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type",profileIamge.getMimetype());
		headers.add("Content-Length", String.valueOf(profileIamge.getData().length));
		
		return new ResponseEntity<byte[]>(profileIamge.getData(),headers, HttpStatus.OK);
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/nickname/{id}")
	public String updateNickname(@PathVariable int id, @RequestParam("nickname") String nickname){
		Map<Integer,String> map = new HashMap<Integer,String>();
		map.put(id, nickname);
		userDAO.updateNickname2(map);
		return "redirect:/member/myPage";
		
	}
	
	
	@Secured("ROLE_USER")
	@GetMapping("/member/myFriend")
	public String myFriend(){
		return "member/myFriend";

		
	}
	

	//myPage에서 정보 저장하기
	@Secured("ROLE_USER")
	@PostMapping("/myProfileInfo/{id}")
	public String myProfileInfo (@RequestParam("file") MultipartFile file, @RequestParam("nickname") String nickname, @PathVariable int id, @AuthenticationPrincipal PrincipalDetails principalDetails) throws IOException{
		System.out.println("id : "+id);
		System.out.println("nickname: "+nickname);
		System.out.println("file: "+file.getOriginalFilename()+"11");

		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", Integer.toString(id));
		map.put("nickname", nickname);
		
		
		//file이 null일 경우
		if(file.isEmpty()) {
			System.out.println("this");
			userDAO.updateNickname(map);
			
		//file이 null이 아닐 경우
		}else {
			System.out.println("not this");
			ProfileImageDTO profileImage = new ProfileImageDTO();
			profileImage.setId(id);
			profileImage.setMimetype(file.getContentType());
			profileImage.setOriginal_name(file.getOriginalFilename());
			profileImage.setData(file.getBytes());
		
		
			ProfileImageDTO originalProfileImage = userDAO.findProfileImage(id);
			if(originalProfileImage == null) {
				userDAO.insertProfileImage(profileImage);
			}else {
				userDAO.updateProfileImage(profileImage);
			}
			userDAO.updateNickname(map);

		}
	
		return "redirect:/member/myPage";
	}
	
	
	
	
	
}

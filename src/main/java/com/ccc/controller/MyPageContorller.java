package com.ccc.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ccc.config.login.auth.PrincipalDetails;
import com.ccc.dto.UserDTO;

@Controller //view 리턴하겠다
public class MyPageContorller {
	
	@Secured("ROLE_USER")
	@GetMapping("/member/myPage")
	public String loginForm(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		UserDTO user = principalDetails.getUser();
		if(user.getNickname() == null) {
			return "additionalInfoForm";
		}else {
			return "/member/myPage";
		}		
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/member/myPage")
	public String loginForm2(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		UserDTO user = principalDetails.getUser();
		if(user.getNickname() == null) {
			return "additionalInfoForm";
		}else {
			return "/member/myPage";
		}		
	}
	
	
	@Secured("ROLE_USER")
	@GetMapping("/member/myInfo")
	public String myInfo() {
		return "member/myInfo";
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
	
}

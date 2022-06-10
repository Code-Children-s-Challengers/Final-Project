package com.ccc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ccc.config.login.auth.PrincipalDetails;
import com.ccc.dto.UserDTO;
import com.ccc.service.UserService;


@Controller 
public class MainController {
	// main페이지로 이동
	
	@Autowired
	UserService uService;
	
	@GetMapping({"","/"})
	public ModelAndView main(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		ModelAndView mav = new ModelAndView();
		
		if(principalDetails!=null) {
			UserDTO user = principalDetails.getUser();
			System.out.println("0000");
			UserDTO userDB= uService.findByUsername(user.getUsername());
			System.out.println(userDB);
			
			if(userDB == null) {
				System.out.println("1");
				mav.setViewName("/member/additionalInfoRequest");
				return mav;
			}else if(userDB.getPhoneNumber() == null) {
				System.out.println("2");
				mav.setViewName("/member/additionalInfoRequest");
				return mav;
			}else {
				System.out.println("3");
				mav.setViewName("main");
				mav.addObject("nickname", userDB.getNickname());
				return mav;
			}
		}else {
			System.out.println("4");
			mav.setViewName("main");
			return mav; 
		}
	}	
}

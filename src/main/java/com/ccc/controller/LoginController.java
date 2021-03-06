package com.ccc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccc.config.login.auth.PrincipalDetails;
import com.ccc.dto.UserDTO;
import com.ccc.service.UserService;

@Controller //view 리턴하겠다
public class LoginController {
	@Autowired
	UserService uService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@GetMapping("/loginForm")
	public String loginForm(HttpServletRequest request, Model m) {
		//이전 페이지로 되돌아가기 위한 Referer 헤더값을 세션의 prePage attribute로 저장
		String uri = request.getHeader("Referer");
		if(uri != null && !uri.contains("/loginForm")) {
			request.getSession().setAttribute("prevPage",uri);
		}
		System.out.println(uri);
		return "loginForm";
	}
	
	// SNS 로그인 시 추가정보를 입력해야 합니다
	@Secured("ROLE_USER")
	@GetMapping("/additionalInfoForm")
	public String additonalInfoForm() {
		return "additionalInfoForm";
	}
	
	// SNS 로그인 시 추가정보를 입력해야 합니다
	@Secured("ROLE_USER")
	@PostMapping("/additionalInfo")
	public String additonalInfo(@AuthenticationPrincipal PrincipalDetails principalDetails, String nickname, String phone1, String phone2, String phone3) {
		String phoneNumber = phone1+phone2+phone3;
		System.out.println(nickname);
		System.out.println(phoneNumber);
		
		UserDTO userDB = uService.findByUsername(principalDetails.getUsername());
		String id = Integer.toString(userDB.getId());
		System.out.println(id);
		
		Map<String, String> nicknameMap = new HashMap<String, String>();
		Map<String, String> phoneNumberMap = new HashMap<String, String>();

		nicknameMap.put("id", id);
		nicknameMap.put("nickname", nickname);
		
		phoneNumberMap.put("id", id);
		phoneNumberMap.put("phoneNumber",phoneNumber);
		
		uService.updateNickname(nicknameMap);
		uService.updatePhoneNumber(phoneNumberMap);
		
		return "redirect:/";
	}

	
	
	@Secured("ROLE_USER")
	@GetMapping("/user")
	public @ResponseBody String user(@AuthenticationPrincipal PrincipalDetails principalDetails) { //DI(의존성 주입)된다
		System.out.println("principalDetails"+principalDetails.getUser());
		return "user";
	}
	


	
}

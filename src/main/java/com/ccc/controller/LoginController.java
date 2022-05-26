package com.ccc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccc.config.login.auth.PrincipalDetails;
import com.ccc.dao.UserDAO;
import com.ccc.dto.UserDTO;
import com.ccc.service.UserService;

@Controller //view 리턴하겠다
public class LoginController {
	@Autowired
	UserService uService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder; 

	
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "joinForm";
	}
	
	
	@PostMapping("/join")
	public String join(UserDTO user) {
		System.out.println(user);
		user.setRole("ROLE_USER");
		user.setPoint(3000);
		
		String rawPassword = user.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		
		userDAO.save(user);
		return "redirect:/loginForm";		
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
	public String additonalInfo(@AuthenticationPrincipal PrincipalDetails principalDetails, String nickname, String phoneNumber) {
		System.out.println(nickname);
		System.out.println(phoneNumber);
		
		String id = Integer.toString(principalDetails.getUser().getId());
		System.out.println(id);
		
		Map<String, String> nicknameMap = new HashMap<String, String>();
		Map<String, String> phoneNumberMap = new HashMap<String, String>();

		nicknameMap.put("id", id);
		nicknameMap.put("nickname", nickname);
		
		phoneNumberMap.put("id", id);
		phoneNumberMap.put("phoneNumber",phoneNumber);
		
		uService.updateNickname(nicknameMap);
		uService.updatePhoneNumber(phoneNumberMap);
		
		return "member/additionalInfoSuccess";
	}
	
	
	

	@Secured("ROLE_USER")
	@GetMapping("/user")
	public @ResponseBody String user(@AuthenticationPrincipal PrincipalDetails principalDetails) { //DI(의존성 주입)된다
		System.out.println("principalDetails"+principalDetails.getUser());
		return "user";
	}
	

	// 일반 회원가입 시 사용되는 메서드들
	@RequestMapping(value = "/checkNickname", method = RequestMethod.POST)
	@ResponseBody
	public int checkNickname(@RequestParam("nickname") String nickname) {
		return uService.checkNickname(nickname);
	}
	
	@RequestMapping(value = "/checkUsername", method = RequestMethod.POST)
	@ResponseBody
	public int checkUsername(@RequestBody String username) {
		return uService.checkUsername(username);
	}
	
	@RequestMapping(value = "/checkEmail", method = RequestMethod.GET)
	@ResponseBody
	public String checkEmail(@RequestParam("email") String email) throws Exception{
	    System.out.println("email: "+email);
		int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
	    
	    String from = "hhss2259@naver.com";//보내는 이 메일주소
	    String to = email;
	    String title = "회원가입시 필요한 인증번호 입니다.";
	    String content = "[인증번호] "+ serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
	    String num = "";
	    try {
	    	MimeMessage mail = mailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
	        
	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(title);
	        mailHelper.setText(content, true);       
	        
	        mailSender.send(mail);
	        num = Integer.toString(serti);
	        
	    } catch(Exception e) {
	        num = "error";
	    }
	    return num;
	}
	
}

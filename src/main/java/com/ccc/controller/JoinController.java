package com.ccc.controller;


import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccc.dao.UserDAO;
import com.ccc.dto.UserDTO;
import com.ccc.service.UserService;

@Controller //view 리턴하겠다
public class JoinController {
	@Autowired
	UserService uService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder; 
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "joinForm";
	}
	
	@PostMapping("/join")
	public String join(UserDTO user, String phone1, String phone2, String phone3) {
		System.out.println(user);
		String phoneNumber = phone1+phone2+phone3;
		System.out.println(phoneNumber);
		user.setRole("ROLE_USER");
		user.setPoint(3000);
		user.setPhoneNumber(phoneNumber);
		
		String rawPassword = user.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		
		userDAO.save(user);
		return "redirect:/loginForm";		
	}

	// 일반 회원가입 시 사용되는 메서드들
	// 중복된 nickname이 존재하는가?
	@RequestMapping(value = "/checkNickname", method = RequestMethod.POST)
	@ResponseBody
	public int checkNickname(@RequestParam("nickname") String nickname) {
		return uService.checkNickname(nickname);
	}
	
	// 중복된 username이 존재하는가?
	@RequestMapping(value = "/checkUsername", method = RequestMethod.POST)
	@ResponseBody
	public int checkUsername(@RequestBody String username) {
		System.out.println(username);
		System.out.println(uService.checkUsername(username));
		return uService.checkUsername(username);
	}
	
	// email 인증 번호 발송
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

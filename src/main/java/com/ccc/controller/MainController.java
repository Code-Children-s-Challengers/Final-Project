package com.ccc.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ccc.config.login.auth.PrincipalDetails;

@Controller 
public class MainController {
	// main페이지로 이동
	@GetMapping({"","/"})
	public String index() {

		return "main"; 
	}	
}

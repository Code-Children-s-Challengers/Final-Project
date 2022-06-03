package com.ccc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller 
public class MainController {
	// main페이지로 이동
	@GetMapping({"","/"})
	public String main() {

		return "main"; 
	}	
}

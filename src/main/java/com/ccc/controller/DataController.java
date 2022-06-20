package com.ccc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ccc.dao.UserDAO;
import com.ccc.dto.UserDTO;

@Controller
public class DataController {
	
	@Autowired
	UserDAO userDAO;
	
	@Secured("ROLE_USER") //인증된(로그인된) 사용자만 접근 가능
	@GetMapping("/member/data/{id}")
	public String dataPage(@PathVariable int id, Model model) {
		
		// id를 통해 DB에서 user 정보를 찾아왔습니다. 필요한 데이터는 get해서 사용하시면 될 것 같습니다!
		UserDTO user = userDAO.findUser(id);
		System.out.println(user);
		
		//필요한 데이터는 직접 넘기시면 될 것 같습니다!
		model.addAttribute("myId", id); 
		
		return "member/myData";
	}
}

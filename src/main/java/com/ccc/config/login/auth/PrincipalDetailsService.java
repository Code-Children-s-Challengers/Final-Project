package com.ccc.config.login.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ccc.dao.UserDAO;
import com.ccc.dto.UserDTO;

// /login 요청이 오면 자동으로 UserDetailsService 타입으로 IoC 되어 있는 loadUserByUsername 함수가 실행
@Service
public class PrincipalDetailsService implements UserDetailsService {

	@Autowired
	private UserDAO userDAO;

	// 이 함수를 호출해서 UserDetails 타입의 객체를 반환해주면
	// 자동으로 Authentication에 저장되고, 그 Authentication은 시큐리티 session에 저장된다.(자동으로!)
	// 함수 종료시 @AuthenticationPricipal 어노테이션이 만들어진다
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {		
		UserDTO userEntity = userDAO.findByUsername(username);
		if(userEntity != null) { //DB에 User가 존재하면 user객체 반환
			return new PrincipalDetails(userEntity);
		}
		return null; //DB에 저장되어 있지 않음(아직 회원가입하지 않은 계정 => 예외 발생)
	}

}

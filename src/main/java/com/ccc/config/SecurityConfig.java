package com.ccc.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.ccc.config.login.auth.PrincipalDetailsService;
import com.ccc.config.login.oauth.PrincipalOauth2UserService;

@Configuration
@EnableWebSecurity // 스프링 시큐리티 필터가 스프링 필터체인에 등록이 됩니다.
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled= true) // secured 어노테이션 활성화, preAuthorize, postAuth 어노테이션 활성화
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	
	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;
	
	// 비밀번호 encoding 해주는 빈
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.authorizeRequests()
		.antMatchers("/hifive/user/**").authenticated() // 인증(로그인)만 되면 들어갈 수 있는 주소
		.antMatchers("/hifive/admin/**").access("hasRole('ROLE_ADMIN')") //ROLE_ADMIN 을 가진 user만 접근할 수 있음
		.anyRequest().permitAll() // 이외의 다른 url은 모든 사용자가 접근가능(로그인 하지 않더라도 ex)main 페이지)
		.and()
		.formLogin()
		.loginPage("/hifive/loginForm")// 로그인이 필요한 곳이면 /loginForm.html으로 redirect 됨
		.loginProcessingUrl("/hifive/login") 	//controller에서 "/hifive/login" 만들 필요가 없어진다
		.defaultSuccessUrl("/hifive/") // loginForm을 통해서 로그인 성공하면기본적으로 /로 보내주지만, 만약 다른 페이지로 가려고 했다면 그 페이지로 그대로 보내준다
		.and()
		.oauth2Login()
		.loginPage("/hifive/loginForm")  // OAuth2 로그인이 필요한 곳이면 /loginForm.html으로 redirect 됨
		.userInfoEndpoint()
		.userService(principalOauth2UserService);
		// 구글 로그인이 완료된 뒤의 후처리가 필요하다. 
		// 여기서는 사용자 프로필 정보를 가져오고 그 정보를 토대로 회원가입을 자동으로 진행시키기도 함 

		
		
		; 

	}

}

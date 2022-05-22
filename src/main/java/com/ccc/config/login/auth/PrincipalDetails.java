package com.ccc.config.login.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.ccc.dto.UserDTO;

import lombok.Data;

@Data
public class PrincipalDetails implements UserDetails, OAuth2User {

	private UserDTO user; 
	private Map<String, Object> attributes;
	
	//일반 로그인을 위한 생성자
	public PrincipalDetails(UserDTO user) {
		this.user = user;
	}
	
	// OAuth 로그인을 위한 생성자
	public PrincipalDetails(UserDTO user,Map<String, Object> attributes) {
		this.user = user;
		this.attributes = attributes;
	}
	
	
	// UserDetails interface overriding
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collect = new ArrayList<>();
		collect.add(new GrantedAuthority() {
			
			@Override
			public String getAuthority() {
				return user.getRole();
			}
		});
		// user의 role을 반환해 주어야 한다. 하지만 user.getRole()은 단순한 문자열만을 반환하기 때문에 이를 좀 더 특수한 형태로 변환해주는 과정이다.		
		
		return collect;
	}
	
	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUsername();
	}

	// 계정이 만료되었는가?
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	//계정이 잠긴 상태인가?
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	//비밀번호가 만료 안 된건 아니니? (비밀번호 변경 필요 없니?)
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		// ex) 1년 동안 회원이 로그인을 안 하면 휴면 계정으로 변경하기로 정책을 결정함 
		// 현재 시간 - 로그인 시간 => 1년을 초과하면 return false;
		return true;
	}

	
	
	
	// OAuth2User interface overriding

	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}


	// 안 쓰기 때문에 그냥 null 처리해준다
	// 원래는 return attributes.get("sub") ;
	@Override
	public String getName() {
		return null;
	}

}

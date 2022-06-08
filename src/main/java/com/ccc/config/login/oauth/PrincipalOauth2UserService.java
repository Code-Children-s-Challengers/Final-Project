package com.ccc.config.login.oauth;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.ccc.config.login.auth.PrincipalDetails;
import com.ccc.config.login.oauth.provider.FacebookUserInfo;
import com.ccc.config.login.oauth.provider.GoogleUserInfo;
import com.ccc.config.login.oauth.provider.NaverUserInfo;
import com.ccc.config.login.oauth.provider.OAuth2UserInfo;
import com.ccc.dao.UserDAO;
import com.ccc.dto.ProfileImageDTO;
import com.ccc.dto.UserDTO;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
	@Lazy
	@Autowired
	private  BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserDAO userDAO;
	
	// 구글로부터 받은 userRequest 데이터에 대한 후처리되는 함수
	// 함수 종료시 @AuthenticationPricipal 어노테이션이 만들어진다
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("getClientRegistration:"+userRequest.getClientRegistration()); //registrationId로 어떤 Oauth로 로그인했는지 확인 가능
		//System.out.println("getAccessToken:"+userRequest.getAccessToken()); 
		System.out.println("getAttributes:"+super.loadUser(userRequest).getAttributes()); 

		//OAuth2 provider로부터 가져온 userRequest 정보를 바탕으로 '회원가입을 강제로 진행시킨다'
		OAuth2User oauth2User = super.loadUser(userRequest);
		OAuth2UserInfo oAuth2UserInfo = null;
		//구글로 로그인 시
		if(userRequest.getClientRegistration().getRegistrationId().equals("google")) { 	//구글로 로그인 시
			System.out.println("구글 로그인 요청");
			oAuth2UserInfo = new GoogleUserInfo(oauth2User.getAttributes());			 
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("facebook")){ // facebook 로그인 시
			System.out.println("페이스북 로그인 요청");
			oAuth2UserInfo = new FacebookUserInfo(oauth2User.getAttributes());	
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("naver")){ //naver 로그인 시
			System.out.println("네이버 로그인 요청");
			oAuth2UserInfo = new NaverUserInfo((Map)oauth2User.getAttributes().get("response"));
		}else {
			System.out.println("지원되지 않는 로그인 방식입니다"); // 구글, facebook, naver 이외의 로그인 방식은 아직 개발되지 않았음
		}
		
		String provider = oAuth2UserInfo.getProvider();
		String providerId = oAuth2UserInfo.getProviderId();
		String email = oAuth2UserInfo.getEmail();
		String username = provider+"_"+providerId;	//  username 방지 => 사실 상 OAtuh2User에서는 사용될 일 없음
		String password = bCryptPasswordEncoder.encode("raw비밀번호"); // password를 encoding해서 저장(노출 방지) => 사실 상 사용할 일 없음
		String role = "ROLE_USER";
		
		UserDTO userEntity = userDAO.findByUsername(username);
		if(userEntity == null) {
			System.out.println("OAuth 로그인이 최초입니다");
			userEntity = UserDTO.builder()
					.username(username)
					.password(password)
					.email(email)
					.role(role)
					.provider(provider)
					.providerId(providerId)
					.point(3000)
					.build();
			
			// 회원가입 완료(DB에 저장)
			userDAO.save(userEntity); // 저장하는 시점
		
			// 프로필 사진 저장
			//기본 사진을 저장
			ProfileImageDTO defaultImage = new ProfileImageDTO();
			UserDTO defaultUser = userDAO.findLatestUser();
			defaultImage.setId(defaultUser.getId());
			userDAO.insertProfileImage(defaultImage);
				
		}else {
			System.out.println("로그인을 이미 한 적이 있습니다. 당신은 자동 회원가입이 되어 있습니다.");
		}
		return new PrincipalDetails(userEntity, oauth2User.getAttributes() );
	}
}

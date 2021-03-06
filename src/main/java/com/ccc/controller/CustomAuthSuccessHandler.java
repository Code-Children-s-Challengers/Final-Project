package com.ccc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthSuccessHandler  extends SimpleUrlAuthenticationSuccessHandler  {

	//요청 캐시
	private final RequestCache requestCache = new HttpSessionRequestCache();
	//리다렉트 전략
	private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	 @Override
	    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
	                                        Authentication authentication) throws IOException {

	        clearSession(request);

	        //SavedRequest는  세션에 이전 페이지의 uri를 세션에 저장하는 작업을 Spring Security가 수행한 것
	        //prePage가 우리가 직접 저장한 정보라면, savedRequest는 스프링 시큐리티가 해준 것이다
	        SavedRequest savedRequest = requestCache.getRequest(request, response);

	        /**
	         * prevPage가 존재하는 경우 = 사용자가 직접 /auth/login 경로로 로그인 요청
	         * 기존 Session의 prevPage attribute 제거
	         */
	        String prevPage = (String) request.getSession().getAttribute("prevPage");
	        if (prevPage != null) {
	            request.getSession().removeAttribute("prevPage");
	        }

	        // 기본 URI
	        String uri = "/";

	        /**
	         * savedRequest 존재하는 경우 = 인증 권한이 없는 페이지 접근 => 스프링시큐리티가 처리해주는 방법
	         * Security Filter가 인터셉트하여 savedRequest에 세션 저장
	         */
	        if (savedRequest != null) { // saverRequest가 존재하는 경우
	            uri = savedRequest.getRedirectUrl(); //저장된 uri로 리다이렉트

	        } else if (prevPage != null && !prevPage.equals("")) {// saverRequest가 존재하지 않는 경우
	            // 회원가입 - 로그인으로 넘어온 경우 "/"로 redirect
	            if (prevPage.contains("/join")) {
	                uri = "/";

	            } else {
	                uri = prevPage;

	            }
	        }

	        redirectStrategy.sendRedirect(request, response, uri);
	    }

	    // 로그인 실패 후 성공 시 남아있는 에러 세션 제거
	    protected void clearSession(HttpServletRequest request) {
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	        }
	    }
	}


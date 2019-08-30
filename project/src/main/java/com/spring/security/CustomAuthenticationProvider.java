package com.spring.security;

import java.util.Collection;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.spring.controller.SearchBoardController;
import com.spring.domain.CustomUserDetails;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Autowired
	private UserDetailsService userDeSer;
	
	@Inject
    PasswordEncoder passwordEncoder;

	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		logger.info("AuthenticationProvider :::::: 1");
		
		CustomUserDetails user = (CustomUserDetails) userDeSer.loadUserByUsername(username);
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) user.getAuthorities();
		
		logger.info("AuthenticationProvider loadUserByUsername :::::: 3");
		
		if(user.getPassword() == password) {
			logger.info("matchPassword :::::::: true!");
			
			return new UsernamePasswordAuthenticationToken(username, password, authorities);
		}
		
		if(!matchPassword(password, user.getPassword())) {
			logger.info("matchPassword :::::::: false!");
			throw new BadCredentialsException(username+"false");
//			return null;
		}
		
		logger.info("matchPassword :::::::: true!");
		
		return new UsernamePasswordAuthenticationToken(username, password, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
	
	private boolean matchPassword(String loginPwd, String password) {
		logger.info("matchPassword :::::::: check!");
		System.out.println("loginPwd" + loginPwd);
		System.out.println("password" + password);
		System.out.println("passwordEncoder.matches(loginPwd, password)" + passwordEncoder.matches(loginPwd, password));
		System.out.println("loginPwd.equals(password)" + loginPwd.equals(password));
		return passwordEncoder.matches(loginPwd, password);
	}

}

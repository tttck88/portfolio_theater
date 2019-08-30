package com.spring.service;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.dao.UserAuthDAO;
import com.spring.dao.UserDAO;
import com.spring.domain.CustomUserDetails;
import com.spring.domain.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserAuthDAO userAuthDAO;
	@Inject
    PasswordEncoder passwordEncoder;
	@Inject
	private UserDAO userDAO;
	
	public void registerUser(CustomUserDetails user) throws Exception {
		String encPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encPassword);
//        System.out.println("암호화된 비밀번호 : "+user.getPassword());
//		System.out.println("service -- " + user);
		userAuthDAO.registerUser(user);
	}

	@Override
	public CustomUserDetails getUser(String userName) throws Exception {
		return userDAO.getUser(userName);
	}

	@Override
	public CustomUserDetails getUser_email(String email) throws Exception {
		CustomUserDetails customUserDetails = userAuthDAO.getUser_email(email);
		
		if(customUserDetails == null) {
		throw new Exception();
		}
		
		return customUserDetails;
	}

	@Override
	public void setPw(CustomUserDetails userVO) throws Exception {
		userDAO.setPw(userVO);
		
	}
}

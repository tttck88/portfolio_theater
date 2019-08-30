package com.spring.service;

import com.spring.domain.CustomUserDetails;

public interface UserService {
	public void registerUser(CustomUserDetails user) throws Exception;
	
	public CustomUserDetails getUser(String userName) throws Exception;
	
	public CustomUserDetails getUser_email(String email) throws Exception;
	
	public void setPw(CustomUserDetails userVO) throws Exception;
}

package com.spring.service;

import com.spring.domain.CustomUserDetails;
import com.spring.domain.UserVO;

public interface UserService {
	public void registerUser(CustomUserDetails user) throws Exception;
	
	public UserVO getUser(String userName) throws Exception;
}

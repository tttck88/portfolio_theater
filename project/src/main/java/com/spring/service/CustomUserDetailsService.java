package com.spring.service;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.dao.UserAuthDAO;
import com.spring.domain.CustomUserDetails;

public class CustomUserDetailsService implements UserDetailsService {
	
	@Inject
	private UserAuthDAO userAuthDAO;

	@Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("loadUserByUsername");
		CustomUserDetails user = userAuthDAO.getUserById(username);
        if(user==null) {
            throw new UsernameNotFoundException(username);
        }
        return user;
    }
	
}

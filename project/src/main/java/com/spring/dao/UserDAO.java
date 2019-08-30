package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.CustomUserDetails;
import com.spring.domain.UserVO;

@Repository
public class UserDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.spring.mapper.UserMapper";
	
	public UserVO loadUserByUserId(String u_id) {
		System.out.println("UserDAO--" + u_id);
		return sqlSession.selectOne(namespace+ ".loadUserByUserId", u_id);
	}

	public CustomUserDetails getUser(String userName) {
		return sqlSession.selectOne(namespace+ ".getUser", userName);
	}

	public void setPw(CustomUserDetails userVO) {
		sqlSession.update(namespace+ ".setPw", userVO);
	}
}

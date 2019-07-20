package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

	public UserVO getUser(String userName) {
		return sqlSession.selectOne(namespace+ ".getUser", userName);
	}
}

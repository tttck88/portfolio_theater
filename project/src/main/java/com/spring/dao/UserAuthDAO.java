package com.spring.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.domain.CustomUserDetails;

@Repository("userAuthDAO")
public class UserAuthDAO {
	
	@Inject
    private SqlSessionTemplate sqlSession;
	
	private static final String namespace = "com.spring.mapper.UserMapper";
 
    public CustomUserDetails getUserById(String username) {
        return sqlSession.selectOne(namespace+".selectUserById", username);
    }

	public void registerUser(CustomUserDetails user) {
		sqlSession.insert(namespace+ ".registerUser", user);
	}

	public CustomUserDetails getUser_email(String email) {
		return sqlSession.selectOne(namespace+ ".getUser_email", email);
	}

}

package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.ScreenVO;
import com.spring.domain.TheaterVO;

@Repository
public class ScreenDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.spring.mapper.ScreenMapper";
	
	public ScreenVO getScrOne(int scr_id) {
		return sqlSession.selectOne(namespace+ ".getScrOne", scr_id);
	}
	
	public List<ScreenVO> getScrOne_m(TheaterVO theaterVO) {
		System.out.println("theaterVO" + theaterVO);
		return sqlSession.selectList(namespace+ ".getScrOne_m", theaterVO);
	}

}

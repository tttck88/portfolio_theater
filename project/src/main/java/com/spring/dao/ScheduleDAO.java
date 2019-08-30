package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.MovieVO;
import com.spring.domain.ScheduleVO;
import com.spring.domain.ScreenVO;

@Repository
public class ScheduleDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.spring.mapper.ScheduleMapper";
	
	public List<ScheduleVO> list(MovieVO mvo) throws Exception {
		return sqlSession.selectList(namespace+ ".list", mvo);
	}

	public List<ScheduleVO> getList(ScheduleVO svo) throws Exception {
		return sqlSession.selectList(namespace+ ".getList", svo);
	}

	public ScheduleVO getOne(ScheduleVO svo) {
		return sqlSession.selectOne(namespace+ ".getOne", svo);
	}

	public List<ScheduleVO> getSchList_mt(ScheduleVO svo) {
		System.out.println("dao " + svo);
		System.out.println("dao " + sqlSession.selectList(namespace+ ".getSchList_mt", svo));
		return sqlSession.selectList(namespace+ ".getSchList_mt", svo);
	}

}

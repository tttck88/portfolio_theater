package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.MovieVO;
import com.spring.domain.TheaterVO;

@Repository
public class TheaterDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.spring.mapper.TheaterMapper";
	
	public List<TheaterVO> getTheaterList() throws Exception {
		return sqlSession.selectList(namespace+ ".getTheaterList");
	}
	
	public void insertTheater(TheaterVO vo) {
		sqlSession.insert(namespace+ ".insertTheater", vo);
	}
	
	public TheaterVO getTheater(TheaterVO vo) throws Exception {
		return sqlSession.selectOne(namespace+ ".getTheater", vo);
	}
	
	public void updateTheater(TheaterVO vo) throws Exception {
		sqlSession.update(namespace+ ".updateTheater", vo);
	}
	
	public void deleteTheater(TheaterVO vo) throws Exception {
		sqlSession.delete(namespace+ ".deleteTheater", vo);
	}
	
	//해당 영화가 상영화는 극장 조회
	public List<TheaterVO> list(int t_id) throws Exception {
		return sqlSession.selectList(namespace+ ".list", t_id);
	}
}

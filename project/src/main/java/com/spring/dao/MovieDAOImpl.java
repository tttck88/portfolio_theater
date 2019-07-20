package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.MovieVO;

@Repository
public class MovieDAOImpl implements MovieDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.spring.mapper.MovieMapper";

	@Override
	public List<MovieVO> list() throws Exception {
		
		return sqlSession.selectList(namespace + ".list");
	}

	@Override
	public MovieVO readMovie(Integer m_id) throws Exception {
		
		return sqlSession.selectOne(namespace + ".readMovie", m_id);
	}

	@Override
	public void removeMovie(Integer m_id) throws Exception {
		
		sqlSession.delete(namespace + ".removeMovie", m_id);
	}

	@Override
	public void updateMovie(MovieVO movieVO) throws Exception {
		
		sqlSession.update(namespace + ".updateMovie", movieVO);
	}

	@Override
	public void registerMovie(MovieVO movieVO) throws Exception {
		
		sqlSession.insert(namespace + ".registerMovie", movieVO);
	}
}

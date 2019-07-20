package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.MovieDAO;
import com.spring.domain.MovieVO;

@Service
public class MovieServiceImpl implements MovieService {
	
	@Inject
	private MovieDAO dao;
	
	@Override
	public List<MovieVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public MovieVO readMovie(Integer m_id) throws Exception {
		return dao.readMovie(m_id);
	}

	@Override
	public void removeMovie(Integer m_id) throws Exception {
		dao.removeMovie(m_id);
	}

	@Override
	public void updateMovie(MovieVO movieVO) throws Exception {
		dao.updateMovie(movieVO);
	}

	@Override
	public void registerMovie(MovieVO movieVO) throws Exception {
		dao.registerMovie(movieVO);
	}
}

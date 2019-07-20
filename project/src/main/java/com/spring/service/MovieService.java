package com.spring.service;

import java.util.List;

import com.spring.domain.MovieVO;

public interface MovieService {
	
	public List<MovieVO> list() throws Exception;

	public MovieVO readMovie(Integer m_id) throws Exception;
	
	public void removeMovie(Integer m_id) throws Exception;

	public void updateMovie(MovieVO movieVO) throws Exception;

	public void registerMovie(MovieVO movieVO) throws Exception;
}

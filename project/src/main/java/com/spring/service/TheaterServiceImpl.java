package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.TheaterDAO;
import com.spring.domain.MovieVO;
import com.spring.domain.TheaterVO;

@Service("TheaterService")
public class TheaterServiceImpl implements TheaterService {
	
	@Inject
	private TheaterDAO theaterDAO;
	
	@Override
	public List<TheaterVO> getTheaterList() throws Exception {
		return theaterDAO.getTheaterList();
	}

	@Override
	public void insertTheater(TheaterVO vo) throws Exception {
		theaterDAO.insertTheater(vo);
	}

	@Override
	public TheaterVO getTheater(TheaterVO vo) throws Exception {
		return theaterDAO.getTheater(vo);
	}

	@Override
	public void upateTheater(TheaterVO vo) throws Exception {
		theaterDAO.updateTheater(vo);
	}

	@Override
	public void deleteTheater(TheaterVO vo) throws Exception {
		theaterDAO.deleteTheater(vo);
	}

	@Override
	public TheaterVO list(int t_id) throws Exception {
		return null;
	}


}

package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.ScreenDAO;
import com.spring.domain.ScreenVO;
import com.spring.domain.TheaterVO;

@Service("ScreenService")
public class ScreenServiceImpl implements ScreenService {
	
	@Inject
	private ScreenDAO screenDAO;

	@Override
	public ScreenVO getScrOne(int scr_id) {
		return screenDAO.getScrOne(scr_id);
	}
	
	@Override
	public List<ScreenVO> getScrOne_m(TheaterVO theaterVO) {
		return screenDAO.getScrOne_m(theaterVO);
	}


}

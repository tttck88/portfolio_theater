package com.spring.service;

import java.util.List;

import com.spring.domain.ScreenVO;
import com.spring.domain.TheaterVO;


public interface ScreenService {
	
	// scr_id로 상영관 조회
	ScreenVO getScrOne(int scr_id);
	
	// m_id로 상영관 조회
	List<ScreenVO> getScrOne_m(TheaterVO theaterVO);
}

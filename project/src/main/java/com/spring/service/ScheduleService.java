package com.spring.service;

import java.util.List;

import com.spring.domain.MovieVO;
import com.spring.domain.ScheduleVO;
import com.spring.domain.ScreenVO;

public interface ScheduleService {
	
	public List<ScheduleVO> list(MovieVO mvo) throws Exception;
	
	public List<ScheduleVO> getList(ScheduleVO svo) throws Exception;
	
	public ScheduleVO getOne(ScheduleVO svo) throws Exception;

	public List<ScheduleVO> getSchList_mt(ScheduleVO svo);
}

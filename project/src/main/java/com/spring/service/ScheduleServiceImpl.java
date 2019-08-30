package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.ScheduleDAO;
import com.spring.domain.MovieVO;
import com.spring.domain.ScheduleVO;
import com.spring.domain.ScreenVO;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Inject
	ScheduleDAO dao;
	
	@Override
	public List<ScheduleVO> list(MovieVO mvo) throws Exception {
//		System.out.println("SERVICE" + dao.list(mvo));
		return dao.list(mvo);
	}

	@Override
	public List<ScheduleVO> getList(ScheduleVO svo) throws Exception {
		return dao.getList(svo);
	}

	@Override
	public ScheduleVO getOne(ScheduleVO svo) throws Exception {
		return dao.getOne(svo);
	}

	@Override
	public List<ScheduleVO> getSchList_mt(ScheduleVO svo) {
		System.out.println("service " + svo);
		return dao.getSchList_mt(svo);
	}
	
}

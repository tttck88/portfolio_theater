package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.ReservationDAO;
import com.spring.domain.ReservationVO;

@Service("ReservationService")
public class ReservationServiceImpl implements ReservationService {
	
	@Inject
	private ReservationDAO reservationDAO;

	@Override
	public List<ReservationVO> getList_sch(int sch_id) throws Exception {
		return reservationDAO.getList_sch(sch_id);
	}

	@Override
	public List<ReservationVO> getList_user(String username) throws Exception {
		return reservationDAO.getList_user(username);
	}
	
	@Override
	public void insertRes(ReservationVO reservationVO) throws Exception {
		reservationDAO.insertRes(reservationVO);
	}


}

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
	public List<ReservationVO> getList_user_row(String username) throws Exception {
		return reservationDAO.getList_user_row(username);
	}
	
	@Override
	public List<ReservationVO> getList_seat(int row_num) throws Exception {
		return reservationDAO.getList_seat(row_num);
	}
	
	@Override
	public void insertRes(ReservationVO reservationVO) throws Exception {
		reservationDAO.insertRes(reservationVO);
	}

	@Override
	public int getRow_num() {
		System.out.println("reservationDAO.getRow_num() " + reservationDAO.getRow_num());
		return reservationDAO.getRow_num();
		
	}

	@Override
	public void deleteRes(int row_num) {
		reservationDAO.deleteRes(row_num);
	}


}

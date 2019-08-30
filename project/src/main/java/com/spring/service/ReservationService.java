package com.spring.service;

import java.util.List;

import com.spring.domain.ReservationVO;

public interface ReservationService {
	//스케줄에 따른 예약 확인
	List<ReservationVO> getList_sch(int sch_id) throws Exception;
	
	//유저에 따른 예약 확인
	List<ReservationVO> getList_user(String username) throws Exception;
	
	List<ReservationVO> getList_user_row(String username) throws Exception;
	
	List<ReservationVO> getList_seat(int row_num) throws Exception;
	
	//예약등록
	void insertRes(ReservationVO reservationVO) throws Exception;

	public int getRow_num();

	void deleteRes(int row_num);

	
}

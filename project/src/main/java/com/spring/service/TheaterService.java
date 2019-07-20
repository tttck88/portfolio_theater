package com.spring.service;

import java.util.List;

import com.spring.domain.TheaterVO;

public interface TheaterService {
	
	// 극장 목록 전체 조회
	List<TheaterVO> getTheaterList() throws Exception;

	// 극장 입력
	void insertTheater(TheaterVO vo) throws Exception;

	// 극장 상세 조회
	TheaterVO getTheater(TheaterVO vo) throws Exception;

	// 극장 수정
	void upateTheater(TheaterVO vo) throws Exception;

	// 극장 삭제
	void deleteTheater(TheaterVO vo) throws Exception;

	/*
	 * // 극장 상세조회 TheaterVO getTheaterOne(TheaterVO vo);
	 */

	
	// 선택 영화 극장 조회
	TheaterVO list(int t_id) throws Exception;

	/*
	 * //관리자 메인에서 쓸것 theater 갯수 구하기 int getCountTheater();
	 */
}

package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.ReservationVO;

@Repository
public class ReservationDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.spring.mapper.ReservationMapper";
	
	public List<ReservationVO> getList_sch(int sch_id) {
		return sqlSession.selectList(namespace + ".getList_sch", sch_id);
	}

	public List<ReservationVO> getList_user(String username) {
		return sqlSession.selectList(namespace + ".getList_user", username);
	}
	
	public void insertRes(ReservationVO reservationVO) {
		sqlSession.selectList(namespace + ".insertRes", reservationVO);
		
	}


}

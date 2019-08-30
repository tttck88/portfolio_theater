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
	
	public List<ReservationVO> getList_user_row(String username) {
		return sqlSession.selectList(namespace + ".getList_user_row", username);
	}
	
	public List<ReservationVO> getList_seat(int row_num) {
		return sqlSession.selectList(namespace + ".getList_seat", row_num);
	}
	
	public void insertRes(ReservationVO reservationVO) {
		sqlSession.selectList(namespace + ".insertRes", reservationVO);
		
	}

	public int getRow_num() {
		return sqlSession.selectOne(namespace + ".getRow_num");
		
	}

	public void deleteRes(int row_num) {
		sqlSession.selectList(namespace + ".deleteRes", row_num);
	}

}

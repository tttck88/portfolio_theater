package com.spring.dao;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> list(Integer b_id) throws Exception;
	
	public void create(ReplyVO vo) throws Exception;
	
	public void update(ReplyVO vo) throws Exception;
	
	public void delete(Integer r_id) throws Exception;
	
	/*********************** ��� ****************************/
	public List<ReplyVO> listPage(Integer b_id, Criteria cri) throws Exception;
	
	public int count(Integer b_id) throws Exception;
	
	public int getB_id(Integer b_id) throws Exception;
}

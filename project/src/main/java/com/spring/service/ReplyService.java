package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;

public interface ReplyService {
	
	public void addReply(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> listReply(Integer b_id) throws Exception;
	
	public void modifyReply(ReplyVO vo) throws Exception;
	
	public void removeReply(Integer r_id) throws Exception;
	
	public List<ReplyVO> listReplyPage(Integer b_id, Criteria cri) throws Exception; 
	
	public int count(Integer b_id) throws Exception;

	public ReplyVO selectOne(int r_id) throws Exception;

	public void addReplyReply(ReplyVO vo) throws Exception;

	public List<ReplyVO> listReplyReply(Integer originId);
}

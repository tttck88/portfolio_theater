package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.BoardDAO;
import com.spring.dao.ReplyDAO;
import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;
	
	@Inject
	private BoardDAO boardDAO;
	
	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		System.out.println("addReply");
		dao.create(vo);
		boardDAO.updateReplyCnt(vo.getB_id(), 1);
	}

	@Override
	public List<ReplyVO> listReply(Integer b_id) throws Exception {
		
		return dao.list(b_id);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		
		dao.update(vo);
	}
	
	@Transactional
	@Override
	public void removeReply(Integer r_id) throws Exception {
		System.out.println("removeReply");
		
		int b_id = dao.getB_id(r_id);
		dao.delete(r_id);
		boardDAO.updateReplyCnt(b_id, -1);
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer b_id, Criteria cri) throws Exception {
		
		return dao.listPage(b_id, cri);
	}

	@Override
	public int count(Integer b_id) throws Exception {
		
		return dao.count(b_id);
	}

}

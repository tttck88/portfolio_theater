package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.BoardDAO;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;

	@Override
	public void insertBoard(BoardVO board) throws Exception {
		dao.insertBoard(board);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO readBoard(Integer b_id) throws Exception {
		dao.updateViewCnt(b_id);
		return dao.readBoard(b_id);
	}

	@Override
	public void updateBoard(BoardVO board) throws Exception {
		System.out.println("service " +board);
		dao.updateBoard(board);
	}

	@Override
	public void deleteBoard(Integer b_id) throws Exception {
		dao.deleteBoard(b_id);
	}

	@Override
	public List<BoardVO> listAllBoard() throws Exception {
		return dao.listAllBoard();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.coungPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}

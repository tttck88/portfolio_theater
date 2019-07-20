package com.spring.service;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;

public interface BoardService {
	
	public void insertBoard(BoardVO board)throws Exception;
	
	public BoardVO readBoard(Integer b_id)throws Exception;
	
	public void updateBoard(BoardVO board)throws Exception;
	
	public void deleteBoard(Integer b_id)throws Exception;
	
	public List<BoardVO> listAllBoard()throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri)throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public List<BoardVO> listSearchCriteria(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
}

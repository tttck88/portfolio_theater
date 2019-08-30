package com.spring.dao;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;

public interface BoardDAO {
	
	public void insertBoard(BoardVO vo);
	
	public BoardVO readBoard(Integer b_id)throws Exception;
	
	public void updateBoard(BoardVO vo)throws Exception;
	
	public void deleteBoard(Integer b_id)throws Exception;
	
	public List<BoardVO> listAllBoard()throws Exception;
	
	public List<BoardVO> listPage(int page)throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri)throws Exception;
	
	public int coungPaging(Criteria cri)throws Exception;
	
	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public void updateReplyCnt(Integer b_id, int amount)throws Exception;
	
	public void updateViewCnt(Integer b_id) throws Exception;
	
	
}

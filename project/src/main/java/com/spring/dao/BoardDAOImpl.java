package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.spring.mapper.BoardMapper";

	@Override
	public void insertBoard(BoardVO vo) {
		sqlSession.insert(namespace+ ".insertBoard", vo);
	}

	@Override
	public BoardVO readBoard(Integer b_id) throws Exception {
		System.out.println("DAO " + sqlSession.selectOne(namespace+ ".selectBoard", b_id));
		return sqlSession.selectOne(namespace+ ".selectBoard", b_id);
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		System.out.println("dao " +vo);
		sqlSession.update(namespace+ ".updateBoard", vo);
	}

	@Override
	public void deleteBoard(Integer b_id) throws Exception {
		sqlSession.delete(namespace+ ".deleteBoard", b_id);
	}

	@Override
	public List<BoardVO> listAllBoard() throws Exception {
		return sqlSession.selectList(namespace+ ".listAllBoard");
	}
	
	@Override
	public List<BoardVO> listPage(int page) throws Exception {

	  if (page <= 0) {
	    page = 1;
	  }

	  page = (page - 1) * 10;

	  return sqlSession.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		
		return sqlSession.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int coungPaging(Criteria cri) throws Exception {
		
		return sqlSession.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void updateReplyCnt(Integer b_id, int amount) throws Exception {
		System.out.println("updateReplyCnt");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("b_id",b_id);
		paramMap.put("amount",amount);
		
		sqlSession.update(namespace + ".updateReplyCnt", paramMap);
	}

	@Override
	public void updateViewCnt(Integer b_id) throws Exception {
		
		sqlSession.update(namespace + ".updateViewCnt", b_id);
	}
	
}

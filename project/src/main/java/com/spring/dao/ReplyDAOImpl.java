package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.spring.mapper.BoardMapper";
	
	@Override
	public List<ReplyVO> list(Integer b_id) throws Exception {
		
		return session.selectList(namespace + ".list", b_id);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		
		session.insert(namespace + ".create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer r_id) throws Exception {
		
		session.delete(namespace + ".delete", r_id);
	}

	@Override
	public List<ReplyVO> listPage(Integer b_id, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", b_id);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listPage", paramMap);
	}

	@Override
	public int count(Integer b_id) throws Exception {
		
		return session.selectOne(namespace + ".count", b_id);
	}

	@Override
	public int getB_id(Integer r_id) throws Exception {
		
		return session.selectOne(namespace + ".getB_id", r_id);
	}

	@Override
	public ReplyVO selectOne(int r_id) throws Exception {
		return session.selectOne(namespace + ".getReply", r_id);
	}

	@Override
	public void replyAdd(ReplyVO vo) throws Exception {
		System.out.println("DAO " + vo);
		session.insert(namespace + ".replyAdd", vo);
	}

	@Override
	public List<ReplyVO> listReply(Integer originId) {
		System.out.println("dao " + originId);
		return session.selectList(namespace + ".listReply", originId);
	}

	@Override
	public List<ReplyVO> listReplyCnt(Integer r_id) {
		System.out.println("dao " + r_id);
		return session.selectList(namespace + ".listReplyCnt", r_id);
	}

}

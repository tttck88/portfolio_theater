package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace ="com.spring.mapper.MessageMapper";	
	
	@Override
	public void create(MessageVO vo) throws Exception {
		
		session.insert(namespace+".create", vo);
	}

	@Override
	public MessageVO readMessage(Integer m_id) throws Exception {

		return session.selectOne(namespace+".readMessage", m_id);
	}

	@Override
	public void updateState(Integer m_id) throws Exception {

		session.update(namespace+".upldateState", m_id);

	}

}



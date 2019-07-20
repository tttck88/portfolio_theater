package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.MessageDAO;
import com.spring.dao.PointDAO;
import com.spring.domain.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Inject
	private MessageDAO messageDAO;
	
	@Inject
	private PointDAO pointDAO;
	
	@Transactional
	@Override
	public void addMessage(MessageVO vo) throws Exception {
		
		messageDAO.create(vo);
		pointDAO.updatePoint(vo.getSender(), 10);
	}

	@Override
	public MessageVO readMessage(String u_id, Integer m_id) throws Exception {
		
		messageDAO.updateState(m_id);
		pointDAO.updatePoint(u_id, 5);
		
		return messageDAO.readMessage(m_id);
	}

}

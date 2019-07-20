package com.spring.dao;

import com.spring.domain.MessageVO;

public interface MessageDAO {

  public void create(MessageVO vo) throws Exception;

  public MessageVO readMessage(Integer m_id) throws Exception;

  public void updateState(Integer m_id) throws Exception;

}

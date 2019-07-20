package com.spring.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAOImpl implements PointDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "com.spring.mapper.PointMapper";

  @Override
  public void updatePoint(String u_id, int point) throws Exception {

    Map<String, Object> paramMap = new HashMap<String, Object>();
    paramMap.put("u_id", u_id);
    paramMap.put("point", point);

    session.update(namespace + ".updatePoint", paramMap);

  }

}

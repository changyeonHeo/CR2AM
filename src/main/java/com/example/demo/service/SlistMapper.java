package com.example.demo.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SlistMapper {
   @Autowired
   private SqlSession sqlSession;

   public int getSlistCount(String id) {
      return sqlSession.selectOne("getSlistCount", id);
   }
}
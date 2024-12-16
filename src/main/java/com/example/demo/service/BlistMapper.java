package com.example.demo.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlistMapper {
   @Autowired
   private SqlSession sqlSession;

   public int getBlistCount(String id) {
      return sqlSession.selectOne("getBlistCount", id);
   }
}
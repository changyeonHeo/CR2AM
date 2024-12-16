package com.example.demo.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BauctionMapper {
   @Autowired
   private SqlSession sqlSession;

   public int getBauctionCount(String id) {
      return sqlSession.selectOne("getBauctionCount", id);
   }
}
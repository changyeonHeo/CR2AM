package com.example.demo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.BreplyDTO;


@Service
public class BreplyMapper {
   
   @Autowired
   private SqlSession sqlSession;
   
   public int insertBreply(BreplyDTO dto) {
      return sqlSession.insert("insertBreply", dto);
    }
   
   public List<BreplyDTO> getBreply(@Param("start") int start, @Param("end") int end, int bnum) { 
      java.util.Map<String, Object> map = new java.util.HashMap<>();
      map.put("start", start);
       map.put("end", end);
       map.put("bnum", bnum);
      return sqlSession.selectList("getBreply", map);
   } 
   
   public int getBreplyCount() {
      return sqlSession.selectOne("getBreplyCount");
   }
   
   public int deleteBreply(int brenum) {
      return sqlSession.delete("deleteBreply", brenum);
   }
}
package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dto.ReplyDTO;

@Service
public class ReplyMapper {
   
   @Autowired
   private SqlSession sqlSession;
   
   public int insertReply(ReplyDTO dto) {
      return sqlSession.insert("insertReply",dto);
    }
    
   public List<ReplyDTO> getReply(@Param("start") int start, @Param("end") int end, int rnum) {
      java.util.Map<String, Object> map = new java.util.HashMap<>();
      map.put("start", start);
       map.put("end", end);
       map.put("rnum", rnum);
      return sqlSession.selectList("getReply", map);
   }
   
   public int getReplyCount() {
      return sqlSession.selectOne("getReplyCount");
   }
   
   public int deleteReply(int renum) {
      return sqlSession.delete("deleteReply", renum);
   }
}
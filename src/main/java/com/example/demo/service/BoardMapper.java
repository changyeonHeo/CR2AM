package com.example.demo.service;

import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.BoardDTO;

@Service
public class BoardMapper {
   @Autowired
   private SqlSession sqlSession;

   public int getCount() {
      return sqlSession.selectOne("getBoardCount");
   }

   public List<BoardDTO> listBoard(int start, int end,  String id) {
         java.util.Map<String, Object> map = new java.util.HashMap<>();
         map.put("start", start);
         map.put("end", end);
         map.put("id", id);
         return sqlSession.selectList("listBoard", map);
      }
      
      public List<BoardDTO> listBoardAll(int start, int end) {
         Map<String, Integer> map = new Hashtable<>();
         map.put("start", start);
         map.put("end", end);
         return sqlSession.selectList("listBoardAll", map);
      }

   public int insertBoard(BoardDTO dto) {
      return sqlSession.insert("insertBoard", dto);
   }

   public BoardDTO getBoard(int bnum) {
      return sqlSession.selectOne("getBoard", bnum);
   }

   public int deleteBoard(int bnum) {
      return sqlSession.delete("deleteBoard", bnum);
   }

   public int updateBoard(BoardDTO dto) {
      int res = sqlSession.update("updateBoard", dto);
      return res;
   } 

   public List<BoardDTO> findBoard(int start,int end) {
    Map<String, Integer> map = new Hashtable<>();
      map.put("start", start);
      map.put("end", end);
      return sqlSession.selectList("findBoard", map);
   }
   public int getCountBoard(String id) {
       return sqlSession.selectOne("getBoardCount2", id);
    }

}
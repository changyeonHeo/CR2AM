package com.example.demo.service;

import java.util.*;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dto.WishDTO;

@Service 
public class WishMapper {
   
   @Autowired
   private SqlSession sqlSession;
   
   public int countWish(int mem) {
       return sqlSession.selectOne("countWish", mem); 
   }
   
   public int insertWish(WishDTO dto) {
      return sqlSession.insert("insertWish", dto);
   }
   
   public List<WishDTO> listWish(@Param("start") int start, @Param("end") int end, int mem) {      
      Map<String, Integer> map = new HashMap<>();
       map.put("start", start);
       map.put("end", end);
       map.put("mem", mem);
      return sqlSession.selectList("listWish", map);
   }
   
   public List<WishDTO> listWishMypage(int mem) {      
      return sqlSession.selectList("listWishMypage", mem);
   }
   
   public List<WishDTO> theListWish(int mem) {      
      return sqlSession.selectList("theListWish", mem);
   }
   
   public int deleteWish(Map<String, String> map) {
      return sqlSession.delete("deleteWish", map);
   }
   
   public int prodWish(String pcode) {
         return sqlSession.selectOne("prodWish", pcode);
      }



}
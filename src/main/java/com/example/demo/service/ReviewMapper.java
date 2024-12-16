package com.example.demo.service;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.ReviewDTO;

import java.util.List;
import java.util.Map;

@Service
public class ReviewMapper {
   @Autowired
   private SqlSession sqlSession;
   
   public int getReviewCount() {
      return sqlSession.selectOne("getReviewCount");
   }
   
   public int getMyReviewCount(String id) {
         return sqlSession.selectOne("getMyReviewCount", id);
   }
      
   public int getProdReviewCount(String rproduct) {
        return sqlSession.selectOne("getProdReviewCount", rproduct);
   }
   
   public List<ReviewDTO> listProReview(@Param("start") int start, @Param("end") int end, 
         @Param("rproduct") String rproduct){
       java.util.Map<String, Object> map = new java.util.HashMap<>();
       map.put("start", start);
       map.put("end", end);
       map.put("rproduct", rproduct);
       return sqlSession.selectList("prodReviewList", map);
   }
   
   public List<ReviewDTO> listMyReview(@Param("start") int start, @Param("end") int end, 
         @Param("id") String id) { 
         java.util.Map<String, Object> map = new java.util.HashMap<>();
          map.put("start", start);
          map.put("end", end);
          map.put("id", id);
         return sqlSession.selectList("listMyReview", map);
      }
   
   public int insertReview(ReviewDTO dto) {
      return sqlSession.insert("insertReview", dto);
   }
   
   public int deleteReview(int rnum) {
      return sqlSession.delete("deleteReview", rnum);  
   }
   
   public int updateReview(ReviewDTO dto) {
      return sqlSession.update("updateReview", dto);
   }
   
//   public ReviewDTO getReview(Map<String, String> map) { 
//      return sqlSession.selectOne("getReview", map);
//   }   
   
   public List<ReviewDTO> getReviewAll(int start, int end) {
      java.util.Map<String, Integer> map = new java.util.Hashtable<>();
      map.put("start", start);
      map.put("end", end);
      return sqlSession.selectList("getReviewAll", map);
   }
   
   public List<ReviewDTO> listReview(int start, int end) {
      java.util.Map<String, Integer> map = new java.util.Hashtable<>();
      map.put("start", start);
      map.put("end", end);
      return sqlSession.selectList("listReview", map);
   }

   public List<ReviewDTO> findReview(int start, int end, Map<String, String> map) {
     map.put("start", String.valueOf(start));
     map.put("end", String.valueOf(end));
     return sqlSession.selectList("findReview", map);
   }

   public ReviewDTO getReview(int rnum) {
      return sqlSession.selectOne("getReview", rnum);
   }


   
}
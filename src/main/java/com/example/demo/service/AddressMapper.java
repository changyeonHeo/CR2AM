package com.example.demo.service;

import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dto.*;

@Service
public class AddressMapper {

   @Autowired
   private SqlSession sqlSession;

   public int insertAddressMember(MemberDTO dto) {
      int res = sqlSession.insert("insertAddressMember", dto);
      return res;
   }

   public int insertAddress(AddressDTO dto) {
      int res = sqlSession.insert("insertAddress", dto);
      return res;
   }

   public int deleteAddress(Map<String, Integer> params) {
      int res = sqlSession.delete("deleteAddress", params);
      return res;
   }

   public List<AddressDTO> listAddress(int mem) {
      return sqlSession.selectList("listAddress", mem);
   }

   public AddressDTO getAddress(int mem) {
      AddressDTO dto = sqlSession.selectOne("getAddress", mem);
      return dto;
   }

   public int updateAddress(AddressDTO dto) {
      int res = sqlSession.update("updateAddress", dto);
      return res;
   }

   public int updateSeqUnder(Map<String, Integer> params) {
      return sqlSession.update("updateSeqUnder", params);
   }

   public int changeSeq(Map<String, Integer> params) {
      return sqlSession.update("changeSeq", params);
   }

   public int MaxSeq(int mem) {
      return sqlSession.selectOne("MaxSeq", mem);
   }
}
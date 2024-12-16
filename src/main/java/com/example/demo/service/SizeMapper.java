package com.example.demo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dto.SizeDTO;

@Service
public class SizeMapper {

   @Autowired
   private SqlSession sqlSession;

   public int insertSizeDTO(SizeDTO dto) {
      List<SizeDTO> list = listPrimeSpec(dto.getType());
      int res = 0;
      for (int i = 0; i < list.size(); i++) {
         SizeDTO prime = list.get(i);
         dto.setCsize(prime.getCsize());
         dto.setSeq(i);
         res = sqlSession.insert("insertProductSize", dto);
         if (res < 0) {
            return res;
         }
      }
      return res;
   }

   public int insertCategorySize(SizeDTO dto) {
      return sqlSession.insert("insertSize", dto);
   }

   public int updateSize(SizeDTO dto) {
      return sqlSession.insert("insertProductSize", dto);
   }

   public int insertPrimeSize(List<SizeDTO> listSize) {
      int res = 0;
      for (int i = 0; i < listSize.size(); i++) {
         SizeDTO dto = listSize.get(i);
         res = sqlSession.insert("insertProductSize", dto);
         if (res < 0) {
            return res;
         }
      }
      return res;
   }

   public List<SizeDTO> listSizeProduct() {
      return sqlSession.selectList("listSizeAll");
   }

   public List<SizeDTO> listPrimeSpec(String type) {
      List<SizeDTO> list = sqlSession.selectList("listPrimeSpec", type);
      return list;
   }

   public List<SizeDTO> listProductSize(String pname) {
      List<SizeDTO> list = sqlSession.selectList("listProductSize", pname);
      return list;
   }
   
   public List<String> listProductSize2(String pname) {
      List<String> list = sqlSession.selectList("listProductSize2", pname);
      return list;
   }

   public List<SizeDTO> listProductSize(int cnum) {
      List<SizeDTO> list = sqlSession.selectList("listProductSize", cnum);
      return list;
   }

   public List<String> getSizeList(int cnum) {
      return sqlSession.selectList("getSizeList", cnum);
   }

   public int deleteProductSize(String pname) {
      int res = sqlSession.delete("delelteProductSize", pname);
      return res;
   }

   public List<SizeDTO> showSizeType() {
      return sqlSession.selectList("showSizeType");
   }

   public List<String> getSizeList(String pname) {
      return sqlSession.selectList("getSizeList", pname);
   }

}
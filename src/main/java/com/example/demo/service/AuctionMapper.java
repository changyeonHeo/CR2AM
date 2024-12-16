package com.example.demo.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.AuctionDTO;
import com.example.demo.dto.ProductDTO;

@Service
public class AuctionMapper {

   @Autowired
   private SqlSession sqlSession;

   public int insertAuction(AuctionDTO dto) {
      return sqlSession.insert("insertAuction", dto);
   }
   public List<AuctionDTO> auction(AuctionDTO dto) {
      return sqlSession.selectList("auction", dto);
   }

   public List<AuctionDTO> listAuctionAll() {
      return sqlSession.selectList("listAuctionAll");
   }

   public int updateAuction(AuctionDTO dto) {
      return sqlSession.update("updateAuction", dto);
   }
   
   public int insertAid(AuctionDTO dto) {
      return sqlSession.update("insertAid", dto);
   }

   public int deleteAuction(int anum) {
      return sqlSession.delete("deleteAuction", anum);
   }

   public List<AuctionDTO> listAuctionSpec(int status) {
      return sqlSession.selectList("listAuctionSpec", status);
   }

   public AuctionDTO getAuctionDTO(int pnum) {
      return sqlSession.selectOne("getAuction", pnum);
   }

   public int inspectionAuction(AuctionDTO dto) {
      return sqlSession.update("inspectionAuction", dto);
   }

   public List<AuctionDTO> listAuction(String id) {
      return sqlSession.selectList("listAuction", id);
   }

   public int countAvgPrice(ProductDTO dto) {
      try {
         return sqlSession.selectOne("countAvgPrice", dto);
      } catch (NullPointerException e) {
         return 0;
      }
   }
   
   public List<AuctionDTO> reviewTransForAjax(String id){
         return sqlSession.selectList("reviewTransForAjax", id);
      }
   
}
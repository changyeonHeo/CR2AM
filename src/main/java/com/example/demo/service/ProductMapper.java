package com.example.demo.service;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.ProductDTO;

@Service
public class ProductMapper {
   
   @Autowired
   private SqlSession sqlSession;
   
   public List<ProductDTO> listProduct() {
      return sqlSession.selectList("listProduct");   
   }

   public int getCount() {
      return sqlSession.selectOne("getCount");
   }
      
   public int insertProduct(ProductDTO dto) {
      return sqlSession.insert("insertProduct", dto);
   }
   
   public ProductDTO getProduct(String pcode) {
      return sqlSession.selectOne("getProduct", pcode);
   }
   
   public ProductDTO reviewProduct(String pname) {
         return sqlSession.selectOne("reviewProduct", pname);
      }
   
   public int updateProduct(ProductDTO dto) {
      return sqlSession.update("updateProduct", dto);
   }
    
   public int deleteProduct(String pcode) {
      return sqlSession.delete("deleteProduct", pcode);
   }

   public List<ProductDTO> selectByCate(String ccode) {
      return sqlSession.selectList("selectByCate", ccode+"%");   
   }

      //kjw
      public String getSCategory(int cnum) {
         return sqlSession.selectOne("getSCategory", cnum);
      }   
      
      //kjw
      public List<ProductDTO> listProduct(Map<String, String>map){
         return sqlSession.selectList("getProductList", map);
      }

      //kjw
      public int getShopCount() {
         return sqlSession.selectOne("getShopCount");
      }
      
      //kjw
      public int getShopCount(Map<String,String>map) {
         return sqlSession.selectOne("getShopAnyCount", map);
      }
      
      //kjw 
      public int getProductCount(Map<String, String>map) {
         return sqlSession.selectOne("getProductCount", map);
      }
      
      //kjw 
      public ProductDTO getProductSpec(String pnum) {
         return sqlSession.selectOne("getProductSpec", pnum);
      }
      
      public List<ProductDTO> searchProduct(Map<String,String>map){   
          return sqlSession.selectList("searchProduct", map);
       }
      public List<ProductDTO> listProductDTOAll(Map<String,String>map){
        return sqlSession.selectList("getAllProductList", map);
     }
      
      public ProductDTO getProductDetail(String pname) {
          return sqlSession.selectOne("getProductDetail", pname);
       }
      
      public int insertProdWish(ProductDTO dto) {
         return sqlSession.update("insertProdWish", dto);
      }
      
      public List<ProductDTO> rankListProduct(@Param("start") int start, @Param("end") int end) {
         java.util.Map<String, Object> map = new java.util.HashMap<>();
          map.put("start", start);
          map.put("end", end);
         return sqlSession.selectList("rankListProduct", map);   
       }
      
      public int updateProductWishCount(String pcode) {
        return sqlSession.update("updateProductWishCount", pcode);

       }
      
      public int updateProductWishCount2(String pcode) {
        return sqlSession.update("updateProductWishCount2", pcode);

       }
      
      
  
}
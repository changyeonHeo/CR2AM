package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.CategoryDTO;

@Service
public class CategoryMapper {
   
   @Autowired
   private SqlSession sqlSession;
   
   public int insertCate(CategoryDTO dto) {
      int res = sqlSession.insert("insertCate", dto);
      return res;
   }
   
   public int deleteCate(int cnum) {
      int res = sqlSession.delete("deleteCate", cnum);
      return res;
   }
   
	public List<CategoryDTO> listCsname() {
		List<CategoryDTO> list = sqlSession.selectList("listCsname");
		return list;
	}

	public List<CategoryDTO> listCate() {
		List<CategoryDTO> list = sqlSession.selectList("listCate");
		return list;
	}
	
	public List<String> listCate2() {
		List<String> list = sqlSession.selectList("listCate2");
		return list;
	}
	
	public List<CategoryDTO> listCate_text() {
		List<CategoryDTO> list = sqlSession.selectList("listCate_text");
		return list;
	}

	public CategoryDTO getCategory(int cnum) {
		return sqlSession.selectOne("getCategory", cnum);
	}

	public int updateCate(CategoryDTO dto) {
		return sqlSession.update("updateCate", dto);
	}
	
	   public String getCategoryname(int cnum) {
		      return sqlSession.selectOne("getCategoryname",cnum);
		   }
		   
		   public String getSCategoryname(int csnum) {
		      return sqlSession.selectOne("getSCategoryname", csnum);
		   }
   
}
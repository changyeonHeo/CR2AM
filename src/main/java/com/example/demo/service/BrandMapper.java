package com.example.demo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.BrandDTO;

@Service
public class BrandMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertBrand(BrandDTO dto) {
		int res = sqlSession.insert("insertBrand", dto);
		return res;
	}
	
	public int deleteBrand(int pbnum) {
		int res = sqlSession.delete("deleteBrand", pbnum);
		return res;
	}
	
	public List<BrandDTO> listBrand(){
			List<BrandDTO> list = sqlSession.selectList("listBrand");
			return list;
	}
	public BrandDTO getBrand(int pbnum) {
		return sqlSession.selectOne("getBrand", pbnum);
	}
	public int updateBrand(BrandDTO dto) {
		return sqlSession.update("updateBrand", dto);
	}
	
	   //kjw
	   public String getSBrand(int pbnum) {
	      return sqlSession.selectOne("getSBrand", pbnum);
	   }

}

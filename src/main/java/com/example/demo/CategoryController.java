package com.example.demo;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.CategoryDTO;
import com.example.demo.service.CategoryMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@RequestMapping(value="/admin_product.do")
	public String admin_product() {
		return "/admin/admin_product";
	}
	
	@RequestMapping(value="/admin_cate_input.do", method = RequestMethod.GET)
	public String admin_cate_input(HttpServletRequest req) {
	
		List<CategoryDTO> list = categoryMapper.listCate_text();
		List<CategoryDTO> list1 = categoryMapper.listCsname();
		req.setAttribute("listCate_text", list);
		req.setAttribute("listCsname", list1);
		return "/admin/admin_cate_input";
	}
	
	@RequestMapping(value="/admin_cate_input.do", method=RequestMethod.POST)
	public String admin_cate_input_Ok(HttpServletRequest req, @ModelAttribute CategoryDTO dto,
			@RequestParam Map<String,String> params) {
		
		dto.setCcode(dto.getTextccode());
		dto.setCname(dto.getTextcname());	

		int res = categoryMapper.insertCate(dto);
		if (res>0) {
			req.setAttribute("msg", "카테고리 등록 성공!! 카테고리 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_cate_list.do");
		}else {
			req.setAttribute("msg", "카테고리 등록 실패!! 카테고리 등록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_cate_input.do");
		}
		return "forward:message.jsp";
	}
	
	@RequestMapping(value="/admin_cate_update.do", method = RequestMethod.GET)
	public String admin_cate_update(HttpServletRequest req, int cnum) {	
		
		List<CategoryDTO> list = categoryMapper.listCate_text();
		List<CategoryDTO> list1 = categoryMapper.listCsname();
		req.setAttribute("listCate_text", list);
		req.setAttribute("listCsname", list1);
		
		CategoryDTO dto = categoryMapper.getCategory(cnum); 
		req.setAttribute("getCategory", dto); 
		return "/admin/admin_cate_update";
	}
	
	@RequestMapping(value="/admin_cate_update.do", method=RequestMethod.POST)
	public String admin_cate_update_Ok(HttpServletRequest req, @ModelAttribute CategoryDTO dto) {
		
		dto.setCcode(dto.getTextccode());
		dto.setCname(dto.getTextcname());	
		
		int res = categoryMapper.updateCate(dto);
		if (res>0) {
			req.setAttribute("msg", "카테고리 수정 성공!! 카테고리 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_cate_list.do");
		}else {
			req.setAttribute("msg", "카테고리 수정 실패!! 카테고리 등록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_cate_update.do");
		}
		return "forward:message.jsp";
	}
	
	@RequestMapping(value="/admin_cate_list.do")
	public String admin_cate_list(HttpServletRequest req) {
		List<CategoryDTO> list = categoryMapper.listCate();
		req.setAttribute("listCate", list);
		return "/admin/admin_cate_list";
	}

	@RequestMapping("/admin_cate_delete.do")
	public String deleteCate(HttpServletRequest req, int cnum) {
		int res = categoryMapper.deleteCate(cnum); 
		if (res>0) {
			req.setAttribute("msg", "카테고리 삭제 성공!! 카테고리 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_cate_list.do");			
		}else {
			req.setAttribute("msg", "카테고리 삭제 실패!! 카테고리 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_cate_list.do");	
		}
		return "forward:message.jsp";	
	}
	
	
	

}

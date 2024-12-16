package com.example.demo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.BrandDTO;
import com.example.demo.service.BrandMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class BrandController {
	
	@Autowired
	private BrandMapper brandMapper;
	
	@RequestMapping(value="/admin_brand_input.do", method = RequestMethod.GET)
	public String admin_brand_input() {	
		return "/admin/admin_brand_input";
	}
	
	@RequestMapping(value="/admin_brand_input.do", method=RequestMethod.POST)
	public String admin_brand_input_Ok(HttpServletRequest req, @ModelAttribute BrandDTO dto,
			@RequestParam Map<String,String> params) {
		
		int res = brandMapper.insertBrand(dto);
		if (res>0) {
			req.setAttribute("msg", "브랜드 등록 성공!! 브랜드 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_brand_list.do");
		}else {
			req.setAttribute("msg", "브랜드 등록 실패!! 브랜드 등록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_brand_input.do");
		}
		return "forward:message.jsp";
	}
	
	@RequestMapping(value="/admin_brand_update.do", method = RequestMethod.GET)
	public String admin_brand_update(HttpServletRequest req, int pbnum) {	
		BrandDTO dto = brandMapper.getBrand(pbnum);
		req.setAttribute("getBrand", dto); 
		return "/admin/admin_brand_update";
	}
	
	@RequestMapping(value="/admin_brand_update.do", method=RequestMethod.POST)
	public String admin_brand_update_Ok(HttpServletRequest req, @ModelAttribute BrandDTO dto) {
		
		int res = brandMapper.updateBrand(dto);
		if (res>0) {
			req.setAttribute("msg", "브랜드 수정 성공!! 브랜드 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_brand_list.do");
		}else {
			req.setAttribute("msg", "브랜드 수정 실패!! 브랜드 등록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_brand_update.do");
		}
		return "forward:message.jsp";
	}
	
	@RequestMapping(value="/admin_brand_list.do")
	public String admin_brand_list(HttpServletRequest req) {
		List<BrandDTO> list = brandMapper.listBrand();
		req.setAttribute("listBrand", list);
		return "/admin/admin_brand_list";
	}
	
	@RequestMapping("/admin_brand_delete.do")
	public String deleteBrand(HttpServletRequest req, int pbnum) {
		int res = brandMapper.deleteBrand(pbnum); 
		if (res>0) {
			req.setAttribute("msg", "브랜드 삭제 성공!! 브랜드 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_brand_list.do");			
		}else {
			req.setAttribute("msg", "브랜드 삭제 실패!! 브랜드 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_brand_list.do");	
		}
		return "forward:message.jsp";	
	}
	
}

package com.example.demo;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.example.demo.dto.*;
import com.example.demo.service.*;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

   @Autowired
   private ProductMapper productMapper;
   @Autowired
   private CategoryMapper categoryMapper;
   @Autowired
   private BrandMapper brandMapper;
   @Autowired
   private BlistMapper blistMapper;
   @Autowired
   private SlistMapper slistMapper;
   @Autowired
   private BauctionMapper bauctionMapper;
   @Autowired
   private SauctionMapper sauctionMapper;
   @Autowired
   private MemberMapper memberMapper;
   @Autowired
   private WishMapper wishMapper;

   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home() {
      return "redirect:main.do";
   }

   @RequestMapping(value = "/main.do")
   public String main(HttpServletRequest req, @ModelAttribute CategoryDTO dto, ProductDTO dto2, BrandDTO dto3) {
      List<String> clist = categoryMapper.listCate2();
      List<ProductDTO> list = productMapper.listProduct();
      List<BrandDTO> blist = brandMapper.listBrand();
      req.setAttribute("listProduct", list);
      req.setAttribute("listCate2", clist);
      req.setAttribute("listBrand", blist);
      req.setAttribute("upPath", req.getServletContext().getRealPath("/resources/img"));
      return "main";
   }

   @RequestMapping(value = "/mypage.do")
   public String mypage(HttpServletRequest req) {
      HttpSession session = req.getSession();
      MemberDTO dto = (MemberDTO) session.getAttribute("loginMember");
	  session.setAttribute("getProimg", memberMapper.getMember(dto.getId()));
      session.setAttribute("blistCount", blistMapper.getBlistCount(dto.getId()));
      session.setAttribute("slistCount", slistMapper.getSlistCount(dto.getId()));
      session.setAttribute("bauctionCount", bauctionMapper.getBauctionCount(dto.getId()));
      session.setAttribute("sauctionCount", sauctionMapper.getSauctionCount(dto.getId()));
      List<WishDTO> list = wishMapper.listWishMypage(dto.getMem());
      req.setAttribute("listWish", list);
      req.setAttribute("getMember", dto);
      if (dto == null)
         return "redirect:login.do";
      return "mypage/mypage";
   }

   @RequestMapping(value = "/admin.do", method = RequestMethod.GET)
   public String adminhome() {
      return "admin/admin_main";
   }

   @RequestMapping(value = "/terms2.do")
   public String terms2() {
      return "terms/terms2";
   }

   @RequestMapping(value = "/terms3.do")
   public String terms3() {
      return "terms/terms3";
   }

   @RequestMapping(value = "/search.do")
   public String search(HttpServletRequest req) {
      MemberDTO mdto;
      HttpSession session = req.getSession();
      if (session.getAttribute("loginMember") == null) {
         mdto = new MemberDTO();
         mdto.setId(String.valueOf(session.getAttribute("random")));
      } else
         mdto = (MemberDTO) session.getAttribute("loginMember");
      List<String> searchList = new ArrayList<>();
      Cookie[] cookies = req.getCookies();
      if (cookies != null) {
         for (Cookie c : cookies) {
            String name = c.getName(); // 쿠키 이름 가져오기
            String value = c.getValue(); // 쿠키 값 가져오기
            if (name.contains(mdto.getId())) {
               searchList.add(value.replaceAll("@", " "));
            }
         }
      }
      Collections.reverse(searchList);
      req.setAttribute("searchList", searchList);
      req.setAttribute("cmd", req.getAttribute("cmd"));
      return "search";
   }
   
   @RequestMapping(value = "productAllList.do")
   public String admin_prod_list(HttpServletRequest req, @ModelAttribute ProductDTO dto) {
      
      List<String> clist = categoryMapper.listCate2();
      List<BrandDTO> blist = brandMapper.listBrand();
      req.setAttribute("listCate2", clist);      
      List<ProductDTO> list = productMapper.listProduct();
      req.setAttribute("listProduct", list);
      req.setAttribute("listBrand", blist);
      req.setAttribute("upPath", req.getServletContext().getRealPath("/resources/img"));
      return "shop/productAllList";
   }  

   
}
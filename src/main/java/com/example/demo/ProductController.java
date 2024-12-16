package com.example.demo;

import java.io.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dto.BrandDTO;
import com.example.demo.dto.CategoryDTO;
import com.example.demo.dto.MemberDTO;
import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.ProductDetailVO;
import com.example.demo.dto.ReviewDTO;
import com.example.demo.dto.SizeDTO;
import com.example.demo.service.AuctionMapper;
import com.example.demo.service.BrandMapper;
import com.example.demo.service.CategoryMapper;
import com.example.demo.service.ProductMapper;
import com.example.demo.service.ReviewMapper;
import com.example.demo.service.SizeMapper;
import com.example.demo.service.WishMapper;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {

   @Autowired
   private ProductMapper productMapper;

   @Autowired
   private CategoryMapper categoryMapper;

   @Autowired
   private BrandMapper brandMapper;

   @Autowired
   private SizeMapper sizeMapper;

   @Autowired
   private AuctionMapper auctionMapper;

   @Autowired
   private WishMapper wishMapper;

   @Autowired
   private ReviewMapper reviewMapper;

   private static int num = 0;

   @RequestMapping(value = "/admin_prod_list.do")
   public String admin_prod_list(HttpServletRequest req, @ModelAttribute ProductDTO dto,
         @ModelAttribute CategoryDTO dto2, @ModelAttribute BrandDTO dto3) {
      List<ProductDTO> list = productMapper.listProduct();
      dto.setCname(dto2.getCname());
      dto.setCsname(dto2.getCsname());
      dto.setPbrand(dto3.getPbrand());
      req.setAttribute("listProduct", list);
      req.setAttribute("upPath", req.getServletContext()
            .getRealPath("D:\\fintech\\contents\\workspace\\CR2AM\\src\\main\\resources\\static\\files"));
      return "admin/admin_prod_list";
   }

   @RequestMapping(value = "/admin_prod_input.do", method = RequestMethod.GET)
   public String admin_prod_input(HttpServletRequest req) {
      List<CategoryDTO> list = categoryMapper.listCate();
      List<CategoryDTO> list1 = categoryMapper.listCsname();
      req.setAttribute("listCate", list);
      req.setAttribute("listCsname", list1);

      List<BrandDTO> list2 = brandMapper.listBrand();
      req.setAttribute("listBrand", list2);

      return "admin/admin_prod_input";
   }

   @RequestMapping(value = "/admin_prod_input.do", method = RequestMethod.POST)
   public String admin_prod_input_ok(HttpServletRequest req, @ModelAttribute ProductDTO dto, BindingResult result,
         @RequestParam Map<String, String> params, @RequestParam("pimage") MultipartFile uploadFile) {
      if (result.hasErrors()) {
         dto.setPimage("");
      }
      MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
      MultipartFile mf = mr.getFile("pimage");
      String filename = mf.getOriginalFilename();

      String path = "D:\\fintech\\contents\\workspace\\CR2AM\\src\\main\\resources\\static\\files";
      File file = new File(path, filename);
      try {
         mf.transferTo(file);
      } catch (IOException e) {
         req.setAttribute("msg", "파일 업로드 중 오류발생!! 관리자에게 문의해 주세요");
         System.out.println(file.getAbsolutePath());
         req.setAttribute("url", "admin.do");
         return "forward:message.jsp";
      }
      dto.setPimage(filename);
      productMapper.insertProduct(dto);
      SizeDTO sizeDTO = new SizeDTO();
      sizeDTO.setPname(dto.getPname());
      sizeDTO.setType(params.get("size_type"));
      switch (params.get("size_type")) {
      case "s":
         sizeDTO.setType("s");
         for (int i = 0; i < 23; i++) {
            sizeDTO.setCsize(String.valueOf(i * 5 + 220));
            sizeDTO.setSeq(i);
            sizeMapper.updateSize(sizeDTO);
         }
         break;
      case "c":
         String sizearr[] = new String[] { "XXS", "XS", "S", "M", "L", "XL", "XXL" };
         sizeDTO.setType("c");
         for (int i = 0; i < sizearr.length; i++) {
            sizeDTO.setCsize(sizearr[i]);
            sizeDTO.setSeq(i);
            sizeMapper.updateSize(sizeDTO);
         }
         break;
      case "o":
         sizeDTO.setSeq(0);
         sizeDTO.setType("o");
         sizeDTO.setCsize("One Size");
         sizeMapper.updateSize(sizeDTO);
         break;
      default:
         break;
      }
      return "redirect:admin_prod_list.do";
   }

   @RequestMapping(value = "/admin_prod_update.do", method = RequestMethod.GET)
   public String admin_prod_update(HttpServletRequest req, @RequestParam String pcode) {

      List<CategoryDTO> list = categoryMapper.listCate();
      req.setAttribute("listCate", list);

      List<BrandDTO> list2 = brandMapper.listBrand();
      req.setAttribute("listBrand", list2);

      ProductDTO dto = productMapper.getProduct(pcode);
      req.setAttribute("upPath", req.getServletContext()
            .getRealPath("D:\\fintech\\contents\\workspace\\CR2AM\\src\\main\\resources\\static\\files"));
      req.setAttribute("getProduct", dto);
      return "admin/admin_prod_update";
   }

   @RequestMapping(value = "/admin_prod_update.do", method = RequestMethod.POST)
   public String admin_prod_update_ok(HttpServletRequest req, @ModelAttribute ProductDTO dto, BindingResult result,
         @ModelAttribute CategoryDTO dto2, @ModelAttribute BrandDTO dto3) {
      if (result.hasErrors()) {
         dto.setPimage("");
      }

      MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
      MultipartFile mf = mr.getFile("pimage");
      String filename = mf.getOriginalFilename();
      if (filename == null || filename.trim().equals("")) {
         dto.setPimage(req.getParameter("pimage2"));
      } else {
         String path = req.getServletContext()
               .getRealPath("D:\\fintech\\contents\\workspace\\CR2AM\\src\\main\\resources\\static\\files");
         File file = new File(path, filename);
         try {
            mf.transferTo(file);
         } catch (IOException e) {
            req.setAttribute("msg", "파일 업로드 중 오류발생!! 관리자에게 문의해 주세요");
            req.setAttribute("url", "admin.do");
            return "forward:message.jsp";
         }
         dto.setPimage(filename);
         dto.setCname(dto2.getCname());
         dto.setCsname(dto2.getCsname());
         dto.setPbrand(dto3.getPbrand());
      }
      int res = productMapper.updateProduct(dto);
      return "redirect:admin_prod_list.do";
   }

   @RequestMapping("/admin_prod_delete.do")
   public String deleteProd(HttpServletRequest req, @RequestParam Map<String, String> params) {

      int res = productMapper.deleteProduct(params.get("pcode"));
      String msg = null, url = "admin_prod_list.do";
      if (res > 0) {
         String upPath = "D:\\fintech\\contents\\workspace\\CR2AM\\src\\main\\resources\\static\\files";
         File file = new File(upPath, params.get("pimage"));
         if (file.exists()) {
            file.delete();
            msg = "상품삭제 성공(이미지도 삭제 성공)!! 상품목록페이지로 이동합니다.";
         } else {
            msg = "상품삭제 성공(이미지도 삭제 실패)!! 상품목록페이지로 이동합니다.";
         }
      } else {
         msg = "상품삭제 실패!! 상품목록페이지로 이동합니다.";
      }
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);

      return "forward:message.jsp";
   }

   @RequestMapping("/admin_prod_view.do")
   public String prodView(HttpServletRequest req, @RequestParam String pcode) {
      ProductDTO dto = productMapper.getProduct(pcode);
      req.setAttribute("getProduct", dto);
      req.setAttribute("upPath", req.getServletContext()
            .getRealPath("D:\\fintech\\contents\\workspace\\CR2AM\\src\\main\\resources\\static\\files"));
      return "admin/admin_prod_view";
   }

   @RequestMapping(value = "/admin_prod_check.do", method = RequestMethod.GET)
   public String admin_prod_check() {
      return "admin/admin_prod_check";
   }

   @RequestMapping(value = "/selectSize.do", method = RequestMethod.GET)
   public String selectSize() {
      return "admin/admin_size_input";
   }

   @RequestMapping(value = "productlist.do", method = RequestMethod.GET)
   public String prouductlist(HttpServletRequest req, @RequestParam Map<String, String> params) {
      List<BrandDTO> listBrand = brandMapper.listBrand();
      List<String> listCate = categoryMapper.listCate2();
      req.setAttribute("listBrand", listBrand);
      req.setAttribute("listCate2", listCate);

      int pageSize = 16;
      String pageNum = "";
      if (!params.containsKey(pageNum))
         pageNum = "1";
      else
         params.get("pagenum");
      String cmd = params.get("mode");
      int currentPage = (Integer.parseInt(pageNum));
      int startRow = (currentPage - 1) * pageSize + 1;
      int endRow = startRow + pageSize - 1;
      int count = 0;
      Map<String, String> map = new HashMap<String, String>();
      switch (cmd) {
      case "pbrand":
         map.put("cmd", cmd);
         map.put("subject", brandMapper.getSBrand(Integer.parseInt(params.get("pbnum"))));
         break;
      case "cname":
         map.put("cmd", cmd);
         map.put("subject", params.get("cname"));
         break;
      case "csname":
         map.put("cmd", cmd);
         map.put("subject", categoryMapper.getSCategoryname(Integer.parseInt(params.get("csnum"))));
         break;
      case "search":

         break;

      case "all":
         break;
      default:
         break;
      }
      count = productMapper.getProductCount(map);
      if (endRow > count)
         endRow = count;
      map.put("start", String.valueOf(startRow));
      map.put("end", String.valueOf(endRow));
      List<ProductDTO> list = productMapper.listProduct(map);
      req.setAttribute("list", list);
      int number = count - startRow + 1;
      int pageBlock = 3;
      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
      int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
      int endPage = startPage + pageBlock - 1;
      if (endPage > pageCount)
         endPage = pageCount;
      req.setAttribute("number", number);
      req.setAttribute("count", count);
      req.setAttribute("pageBlock", pageBlock);
      req.setAttribute("pageCount", pageCount);
      req.setAttribute("startPage", startPage);
      req.setAttribute("endPage", endPage);

      return "shop/product";
   }

   @RequestMapping("productViewgo.do")
   public String productView(HttpServletRequest req, RedirectAttributes redirectAttributes, String pcode) {
      ProductDTO dto = productMapper.getProduct(pcode);
      redirectAttributes.addAttribute("pnum", dto.getPnum());
      redirectAttributes.addAttribute("pname", dto.getPname());
      redirectAttributes.addAttribute("pcode", pcode);
      return "redirect:/productview.do";
   }

   @RequestMapping("productview.do")
   public String productView(HttpServletRequest req, @RequestParam(required = false) String pageNum, String pnum,
         String pcode, String pname) {
      List<BrandDTO> listBrand = brandMapper.listBrand();
      List<CategoryDTO> listCate = categoryMapper.listCate();
      int res = wishMapper.prodWish(pcode);

      req.setAttribute("prodWish", res);
      req.setAttribute("listBrand", listBrand);
      req.setAttribute("listCate", listCate);

      ProductDTO dto = productMapper.getProductSpec(pnum);
      req.setAttribute("dto", dto);

      // pcode 상품의 리뷰 가져오기
      if (pageNum == null)
         pageNum = "1";
      req.setAttribute("upPath", req.getServletContext()
            .getRealPath("D:\\fintech\\contents\\workspace\\CR2AM\\src\\main\\resources\\static\\files"));
      int pageSize = 8;
      int currentPage = Integer.parseInt(pageNum);
      int start = (currentPage - 1) * pageSize + 1;
      int end = start + pageSize - 1;
      int count = 0;
      List<ReviewDTO> list = null;

      try {
         count = reviewMapper.getProdReviewCount(pname);
         if (end > count)
            end = count;
         list = reviewMapper.listProReview(start, end, pname);

      } catch (Exception e) {
         e.printStackTrace();
         req.setAttribute("msg", "DB서버 오류 발생");
         req.setAttribute("url", "list_review.do");
      }
      int number = count - start + 1;
      int pageBlock = 3;
      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
      int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
      int endPage = startPage + pageBlock - 1;
      if (endPage > pageCount)
         endPage = pageCount;

      String[] key = new String[] { "number", "count", "pageBlock", "pageCount", "startPage", "endPage" };
      int[] values = new int[] { number, count, pageBlock, pageCount, startPage, endPage };
      for (int i = 0; i < 6; i++) {
         req.setAttribute(key[i], values[i]);
      }
      req.setAttribute("prodReviewList", list);

      return "shop/productView";
   }

   @RequestMapping(value = "searchResult.do", method = RequestMethod.GET)
   public String searchResult(HttpServletRequest req, HttpServletResponse resp,
         @RequestParam Map<String, String> map) {
      MemberDTO mdto;
      HttpSession session = req.getSession();
      if (session.getAttribute("loginMember") == null) {
         mdto = new MemberDTO();
         Random random = new Random();
         int checkNum = random.nextInt(888888) + 111111;
         if (session.getAttribute("random") == null
               || session.getAttribute("random").equals(Integer.toString(checkNum))) {
            session.setAttribute("random", checkNum);
            mdto.setId(Integer.toString(checkNum));
            num = 0;
         } else
            mdto.setId(String.valueOf(session.getAttribute("random")));
      } else
         mdto = (MemberDTO) session.getAttribute("loginMember");

      Cookie[] cookies = req.getCookies();
      if (cookies != null) {
         for (Cookie c : cookies) {
            String name = c.getName(); // 쿠키 이름 가져오기
            String value = c.getValue(); // 쿠키 값 가져오기
            for (int i = 0; i < num; i++) {
               if (name.equals(mdto.getId() + i)) {
                  if (value.equals(map.get("subject").replaceAll("\\s", "@"))) {
                     Cookie kc = new Cookie(mdto.getId() + i, null);
                     kc.setMaxAge(0);
                     resp.addCookie(kc);
                  }
               }
            }
         }
      }
      if (map.get("cmd").equals("")) {
         map.put("cmd", (String) session.getAttribute("cmd"));
         map.put("subject", (String) session.getAttribute("subject"));
      }
      Cookie ck1 = new Cookie(mdto.getId() + num, map.get("subject").replaceAll("\\s", "@"));
      resp.addCookie(ck1);
      num++;
      if (!map.get("cmd").equals("")) {
         session.setAttribute("cmd", map.get("cmd"));
         session.setAttribute("subject", map.get("subject"));
      }

      List<BrandDTO> listBrand = brandMapper.listBrand();
      List<String> clist = categoryMapper.listCate2();
      List<ProductDTO> dto = productMapper.searchProduct(map);
      req.setAttribute("listBrand", listBrand);
      req.setAttribute("listCate2", clist);
      req.setAttribute("list", dto);
      req.setAttribute("cmd", map.get("cmd"));
      return "shop/searchResult";
   }

   @RequestMapping(value = "deleteSearch.do")
   public String deleteSearch(HttpServletRequest req, HttpServletResponse resp, String subject) {
      MemberDTO mdto;
      HttpSession session = req.getSession();
      if (session.getAttribute("loginMember") == null) {
         mdto = new MemberDTO();
         int checkNum = (int) session.getAttribute("random");
         mdto.setId(Integer.toString(checkNum));
         System.out.println(mdto.getId());
      } else
         mdto = (MemberDTO) session.getAttribute("loginMember");

      Cookie[] cookies = req.getCookies();
      if (cookies != null) {
         for (Cookie c : cookies) {
            String name = c.getName(); // 쿠키 이름 가져오기
            String value = c.getValue(); // 쿠키 값 가져오기
            for (int i = 0; i < num; i++) {
               if (name.equals(mdto.getId() + i)) {
                  if (value.equals(subject.replaceAll("\\s", "@"))) {
                     Cookie kc = new Cookie(mdto.getId() + i, null);
                     kc.setMaxAge(0);
                     resp.addCookie(kc);
                  }
               }
            }
         }
      }
      return "redirect:search.do";
   }

   @RequestMapping(value = "deleteAllSearch.do")
   public String deleteAllSearch(HttpServletRequest req, HttpServletResponse resp) {
      MemberDTO mdto;
      HttpSession session = req.getSession();
      if (session.getAttribute("loginMember") == null) {
         mdto = new MemberDTO();
         int checkNum = (int) session.getAttribute("random");
         mdto.setId(Integer.toString(checkNum));
         System.out.println(mdto.getId());
      } else
         mdto = (MemberDTO) session.getAttribute("loginMember");

      Cookie[] cookies = req.getCookies();
      if (cookies != null) {
         for (Cookie c : cookies) {
            String name = c.getName();
            for (int i = 0; i < num; i++) {
               if (name.equals(mdto.getId() + i)) {
                  Cookie kc = new Cookie(mdto.getId() + i, null);
                  kc.setMaxAge(0);
                  resp.addCookie(kc);
               }
            }
         }
      }
      num = 0;
      return "redirect:search.do";
   }

   @RequestMapping("getProductDetailListToAjax.do")
   @ResponseBody
   public ProductDetailVO getPriceFromAjax(@RequestBody String pname) {
      pname = pname.substring(1,pname.length() - 1);
      ProductDetailVO productVO = new ProductDetailVO();
      List<String> list = sizeMapper.listProductSize2(pname);
      ProductDTO pdto = productMapper.getProductDetail(pname);
      List<String> relist = new ArrayList<String>();
      int res = 0;

      for (int i = 0; i < list.size(); i++) {
         pdto.setPbrand(list.get(i));

         res = auctionMapper.countAvgPrice(pdto);
         relist.add(String.valueOf(res));
      }
      productVO.setSizeList(list);
      productVO.setPriceList(relist);
      return productVO;
   }

   @RequestMapping("ranking.do")
   public String ranking(HttpServletRequest req, @RequestParam(required = false) String pageNum) {

      if (pageNum == null)
         pageNum = "1";
      req.setAttribute("upPath", req.getServletContext()
            .getRealPath("D:\\fintech\\contents\\workspace\\CR2AM\\src\\main\\resources\\static\\files"));
      int pageSize = 16;
      int currentPage = (Integer.parseInt(pageNum));
      int start = (currentPage - 1) * pageSize + 1;
      int end = start + pageSize - 1;
      int count = 0;
      List<ProductDTO> list = null;

      try {
         count = productMapper.getShopCount();
         if (end > count)
            end = count;
         list = productMapper.rankListProduct(start, end);

      } catch (Exception e) {
         e.printStackTrace();
         req.setAttribute("msg", "DB서버 오류 발생");
         req.setAttribute("url", "main.do");
      }
      int number = count - start + 1;
      int pageBlock = 3;
      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
      int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
      int endPage = startPage + pageBlock - 1;
      if (endPage > pageCount)
         endPage = pageCount;

      String[] key = new String[] { "number", "count", "pageBlock", "pageCount", "startPage", "endPage" };
      int[] values = new int[] { number, count, pageBlock, pageCount, startPage, endPage };
      for (int i = 0; i < 6; i++)
         req.setAttribute(key[i], values[i]);

      req.setAttribute("productList", list);
      List<String> clist = categoryMapper.listCate2();
      List<ProductDTO> plist = productMapper.listProduct();
      List<BrandDTO> blist = brandMapper.listBrand();
      req.setAttribute("listProduct", plist);
      req.setAttribute("listCate2", clist);
      req.setAttribute("listBrand", blist);
      return "shop/Ranking";
   }

   @RequestMapping(value = "ad_prod_delete.do")
   @ResponseBody
   public void productDelete(@RequestBody(required = false) List<String> arr) {
      int i = 0;
      System.out.println(arr.size());
      for (String pcode : arr) {
         int res = productMapper.deleteProduct(pcode);
      }
      return;
   }

}
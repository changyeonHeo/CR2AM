package com.example.demo;

import java.text.SimpleDateFormat;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.demo.dto.AuctionDTO;
import com.example.demo.dto.BrandDTO;
import com.example.demo.dto.CategoryDTO;
import com.example.demo.dto.MemberDTO;
import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.ReviewDTO;
import com.example.demo.service.AuctionMapper;
import com.example.demo.service.BrandMapper;
import com.example.demo.service.CategoryMapper;
import com.example.demo.service.ProductMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AuctionController {

   @Autowired
   private AuctionMapper auctionMapper;

   @Autowired
   private ProductMapper productMapper;

   @Autowired
   private BrandMapper brandMapper;

   @Autowired
   private CategoryMapper categoryMapper;

   @RequestMapping(value="/mypage_prodcheck.do")
   public String mypage_check() {
      return "/mypage/mypage_prodcheck";
   }
         
   @RequestMapping(value = "/mypage_check_ing.do")
   public String mypage_check_ing() {
      return "/mypage/mypage_check_ing";
   }
   
   @RequestMapping(value = "/mypage_check_end.do")
   public String mypage_check_end() {
      return "/mypage/mypage_check_end";
   }
   
   @RequestMapping(value = "/insertAuction.do", method = RequestMethod.GET)
   public String insertAuction() {
      return "/auction/insertauction";
   }

   @RequestMapping(value = "/insertAuction.do", method = RequestMethod.POST)
   public String insertAuction(HttpServletRequest req, @ModelAttribute AuctionDTO dto) {
      int res = auctionMapper.insertAuction(dto);
      if (res > 0) {
         req.setAttribute("msg", "성공적으로 등록되었습니다!");
         req.setAttribute("url", "listAuction.do");
      } else {
         req.setAttribute("msg", "등록에 실패하였습니다.");
         req.setAttribute("url", "listAuction.do");
      }
      return "foward:message.jsp";
   }

   @RequestMapping("/listAuction.do")
   public String listAuction(HttpServletRequest req, String mode) {
      if ((mode.equals("all"))) {
         List<AuctionDTO> list = auctionMapper.listAuctionAll();
         req.setAttribute("listAuction", list);
      }

      return "/auction/listAuction";
   }

   @RequestMapping("tobuy.do")
   public String tobuy(HttpServletRequest req, String pnum) {
      HttpSession session = req.getSession();
      MemberDTO dto = (MemberDTO) session.getAttribute("loginMember");
      try {
         if (dto.getId() == null || dto.getId().equals("")) {
            req.setAttribute("msg", "로그인하고 이용해주세요");
            req.setAttribute("url", "login.do");
            return "forward:message.jsp";
         }
      } catch (NullPointerException e) {
         req.setAttribute("msg", "로그인하고 이용해주세요");
         req.setAttribute("url", "login.do");
         return "forward:message.jsp";
      }
      List<BrandDTO> listBrand = brandMapper.listBrand();
      List<CategoryDTO> listCate = categoryMapper.listCate();
      req.setAttribute("listBrand", listBrand);
      req.setAttribute("listCate", listCate);

      req.setAttribute("dto", productMapper.getProductSpec(pnum));
      return "shop/toBuyChooseSize";
   }

   @RequestMapping(value = "buy_checklist.do", method = RequestMethod.GET)
   public String buy_checklist(HttpServletRequest req, @RequestParam Map<String, String> map) {
      ProductDTO dto = productMapper.getProductSpec(map.get("pnum"));
      req.setAttribute("dto", dto);
      req.setAttribute("size", map.get("size"));
      /* req.setAttribute("okornot", "yes"); */

      return "shop/buy_checklist";
   }

   @RequestMapping(value = "toBuyPricePay.do", method = RequestMethod.GET)
   public String toBuyPayPrice(HttpServletRequest req, @RequestParam Map<String, String> map) {
      ProductDTO dto = productMapper.getProductSpec(map.get("pnum"));
      req.setAttribute("dto", dto);
      req.setAttribute("size", map.get("size"));
      req.setAttribute("okornot", "yes");

      return "shop/toBuyPricePay";
   }

   @RequestMapping("tosell.do")
   public String tosell(HttpServletRequest req, String pnum) {
      HttpSession session = req.getSession();
      MemberDTO dto = (MemberDTO) session.getAttribute("loginMember");
      try {
         if (dto.getId() == null || dto.getId().equals("")) {
            req.setAttribute("msg", "로그인하고 이용해주세요");
            req.setAttribute("url", "login.do");
            return "forward:message.jsp";
         }
      } catch (NullPointerException e) {
         req.setAttribute("msg", "로그인하고 이용해주세요");
         req.setAttribute("url", "login.do");
         return "forward:message.jsp";
      }
      List<BrandDTO> listBrand = brandMapper.listBrand();
      List<CategoryDTO> listCate = categoryMapper.listCate();
      req.setAttribute("listBrand", listBrand);
      req.setAttribute("listCate", listCate);

      req.setAttribute("dto", productMapper.getProductSpec(pnum));
      return "shop/toSellChooseSize";
   }

   @RequestMapping(value = "sell_checklist.do", method = RequestMethod.GET)
   public String sell_checklist(HttpServletRequest req, @RequestParam Map<String, String> map) {
      ProductDTO dto = productMapper.getProductSpec(map.get("pnum"));
      req.setAttribute("dto", dto);
      req.setAttribute("size", map.get("size"));
      /* req.setAttribute("okornot", "yes"); */

      return "shop/sell_checklist";
   }

   @RequestMapping(value = "toSellPayPrice.do", method = RequestMethod.GET)
   public String toSellPayPrice(HttpServletRequest req, @RequestParam Map<String, String> map) {
      ProductDTO dto = productMapper.getProductSpec(map.get("pnum"));
      req.setAttribute("dto", dto);
      req.setAttribute("size", map.get("size"));
      req.setAttribute("okornot", "yes");

      return "shop/toSellPayPrice";
   }

   @RequestMapping(value = "auctionMaintance.do", method = RequestMethod.GET)
   public String auctionMaintance(HttpServletRequest req) {
      List<AuctionDTO> listAuction = auctionMapper.listAuctionAll();
      Date currentDate = new Date();
      SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
      for(int i = 0; i < listAuction.size(); i++) {
    	  System.out.println(listAuction.get(i).getSaledate());
         Scanner sc = new Scanner(listAuction.get(i).getSaledate()).useDelimiter("\\s*/");
         
         String SaleYear = sc.next();
         String SaleMonth = sc.next();
         String SaleDay = sc.next();
         
         String SaleDate =  SaleYear + SaleMonth + SaleDay;
         
         if(Integer.parseInt(formatter.format(currentDate)) > Integer.parseInt(SaleDate)) {
            auctionMapper.deleteAuction(listAuction.get(i).getAnum());
            listAuction.remove(listAuction.get(i));
         }
      }
      req.setAttribute("listAuction", listAuction);
      return "auction/auctionMaintance";
   }

   @RequestMapping(value = "auctionMaintance.do", method = RequestMethod.POST)
   public String auctionMaintance(HttpServletRequest req, int type) {
      List<AuctionDTO> listAuction = auctionMapper.listAuctionAll();
      if (type >= 0 || type <= 4) {
         listAuction.clear();
         listAuction = auctionMapper.listAuctionSpec(type);
      } 
      
      Date currentDate = new Date();
      SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
      for(AuctionDTO dto : listAuction) {
         Scanner sc = new Scanner(dto.getSaledate()).useDelimiter("\\s*/");
         
         String SaleYear = sc.next();
         String SaleMonth = sc.next();
         String SaleDay = sc.next();
         
         String SaleDate =  SaleYear + SaleMonth + SaleDay;
         
         if(Integer.parseInt(formatter.format(currentDate)) > Integer.parseInt(SaleDate)) {
            auctionMapper.deleteAuction(dto.getAnum());
            listAuction.remove(dto);
         }
      }
      
      req.setAttribute("listAuction", listAuction);
      return "auction/auctionMaintance";
   }

   @RequestMapping(value = "inspection.do")
   public String inspection(HttpServletRequest req, int anum) {
      AuctionDTO dto = auctionMapper.getAuctionDTO(anum);
      dto.setStatus(0);
      int res = auctionMapper.inspectionAuction(dto);
      if (res > 0) {
         req.setAttribute("msg", "검수 성공!! 입찰 관리자 관리 목록 페이지로 이동합니다.");
         req.setAttribute("url", "auctionMaintance.do");
      } else {
         req.setAttribute("msg", "검수  실패!! 입찰 관리자 관리 목록 페이지로 이동합니다.");
         req.setAttribute("url", "auctionMaintance.do");
      }
      return "forward:message.jsp";
   }

   @RequestMapping(value = "updateAuctionFromAdmin.do", method = RequestMethod.GET)
   public String updateAuctionFromAdmin(HttpServletRequest req, String anum) {
      AuctionDTO dto = auctionMapper.getAuctionDTO(Integer.parseInt(anum));
      req.setAttribute("dto", dto);
      return "auction/updateAuction";
   }

   @RequestMapping(value = "updateAuctionFromAdmin.do", method = RequestMethod.POST)
   public String updateAuctionFromAdmin(HttpServletRequest req, @RequestParam(required = false) AuctionDTO dto) {
     System.out.println(dto.getId());
      try {
      if (dto.getAid().isEmpty() || dto.getAid().equals("")) {
         dto.setAid("no");
      }
      }catch(NullPointerException e) {
         dto.setAid("no");
      }
      int res = auctionMapper.updateAuction(dto);
      if (res > 0) {
         req.setAttribute("msg", "입찰 정보 수정 성공!! 입찰 관리자 관리 목록 페이지로 이동합니다.");
         req.setAttribute("url", "auctionMaintance.do");
      } else {
         req.setAttribute("msg", "입찰 정보 수정 실패!! 입찰 관리자 관리 목록 페이지로 이동합니다.");
         req.setAttribute("url", "auctionMaintance.do");
      }
      return "forward:message.jsp";
   }

   protected AuctionDTO remaketoAuctionDTO(ProductDTO sdto, String atype, String size) {
      AuctionDTO adto = new AuctionDTO();
      adto.setAtype(atype);
      adto.setId("admin");
      adto.setAid("아직");
      adto.setPnum(sdto.getPnum());
      adto.setPrice(sdto.getPprice());
      adto.setPsize(size);
      adto.setSaledate("n");
      return adto;
   }

   @RequestMapping(value = "/buy.do", method = RequestMethod.GET)
   public String buy(HttpServletRequest req) {
      HttpSession session = req.getSession();
      MemberDTO dto = (MemberDTO) session.getAttribute("loginMember");
      List<AuctionDTO> listAuction = auctionMapper.listAuction(dto.getId());
      req.setAttribute("listAuction", listAuction);
      return "mypage/mypage_buylist";
   }

   @RequestMapping(value = "/buy_ing.do", method = RequestMethod.GET)
   public String buyIng(HttpServletRequest req) {
      HttpSession session = req.getSession();
      MemberDTO dto = (MemberDTO) session.getAttribute("loginMember");
      List<AuctionDTO> listAuction = auctionMapper.listAuction(dto.getId());
      req.setAttribute("listAuction", listAuction);
      return "mypage/mypage_buylist_ing";
   }

   @RequestMapping(value = "/buy_end.do", method = RequestMethod.GET)
   public String buyEnd(HttpServletRequest req) {
      HttpSession session = req.getSession();
      MemberDTO dto = (MemberDTO) session.getAttribute("loginMember");
      List<AuctionDTO> listAuction = auctionMapper.listAuction(dto.getId());
      req.setAttribute("listAuction", listAuction);
      return "mypage/mypage_buylist_end";
   }

   @RequestMapping(value = "/sell.do", method = RequestMethod.GET)
   public String sell(HttpServletRequest req) {
      HttpSession session = req.getSession();
      MemberDTO dto = (MemberDTO) session.getAttribute("loginMember");
      List<AuctionDTO> listAuction = auctionMapper.listAuction(dto.getId());
      req.setAttribute("listAuction", listAuction);
      return "mypage/mypage_selllist";
   }

   @RequestMapping(value = "/sell_ing.do", method = RequestMethod.GET)
   public String sellIng(HttpServletRequest req) {
      HttpSession session = req.getSession();
      MemberDTO dto = (MemberDTO) session.getAttribute("loginMember");
      List<AuctionDTO> listAuction = auctionMapper.listAuction(dto.getId());
      req.setAttribute("listAuction", listAuction);
      return "mypage/mypage_selllist_ing";
   }

   @RequestMapping(value = "/sell_end.do", method = RequestMethod.GET)
   public String sellEnd(HttpServletRequest req) {
      HttpSession session = req.getSession();
      MemberDTO dto = (MemberDTO) session.getAttribute("loginMember");
      List<AuctionDTO> listAuction = auctionMapper.listAuction(dto.getId());
      req.setAttribute("listAuction", listAuction);
      return "mypage/mypage_selllist_end";
   }

   @RequestMapping("toSellFinal.do")
   public String toSellFinal(HttpServletRequest req, @RequestParam Map<String, String> map) {
      ProductDTO pdto = productMapper.getProductSpec(map.get("pnum"));
      pdto.setPprice(Integer.parseInt(map.get("price")));
      HttpSession session = req.getSession();
      String type;
      if(map.get("date") == null)
         type = "s";
      else
         type = "sa";
      AuctionDTO dto = remaketoAuctionDTO(pdto, ((MemberDTO) session.getAttribute("loginMember")).getId(), type,
            map.get("size"), map.get("date"));
      dto.setStatus(2);
      int res = auctionMapper.insertAuction(dto);
      List<AuctionDTO> listAuction = auctionMapper.auction(dto);
      for(AuctionDTO adto : listAuction) {
         if(type.equals("sa") && !adto.getId().equals(dto.getId()) && adto.getAtype().equals("ba")) {
            adto.setAid(dto.getId());
            auctionMapper.insertAid(adto);
            res++;
            break;
         }
      }
      
      if (res > 0) {
         if (dto.getSaledate() == null)
            req.setAttribute("msg", "판매 완료");
         else {
            if(res == 1)
               req.setAttribute("msg", "입찰 등록 완료");
            else
               req.setAttribute("msg", "입찰 성사 완료");
         }
         req.setAttribute("url", "main.do");
      } else {
         if (dto.getSaledate() == null)
            req.setAttribute("msg", "판매 실패");
         else
            req.setAttribute("msg", "입찰 등록 실패");
         req.setAttribute("url", "main.do");
      }
      return "forward:message.jsp";
   }

   @RequestMapping(value="buyPage.do")
   public String buypage(HttpServletRequest req, @RequestParam Map<String, String> map) {
      ProductDTO pdto = productMapper.getProductSpec(map.get("pnum"));
      HttpSession session = req.getSession();
      pdto.setPprice(Integer.parseInt(map.get("total")));
         String type;
         if(map.get("date") == null)
            type = "b";
         else
            type = "ba";
         AuctionDTO adto = remaketoAuctionDTO(pdto, ((MemberDTO) session.getAttribute("loginMember")).getId(), type, map.get("size"), map.get("date"));
         adto.setStatus(0);
         int res = auctionMapper.insertAuction(adto);
         List<AuctionDTO> listAuction = auctionMapper.auction(adto);
         for(AuctionDTO audto : listAuction) {
            if(type.equals("ba") && !(audto.getId() == adto.getId()) && audto.getAtype().equals("sa")) {
              audto.setAid(adto.getId());
               auctionMapper.insertAid(audto);
               res++;
               break;
            }
         }
         if (res > 0) {
            if (adto.getSaledate() == null)
               req.setAttribute("msg", "구매 완료");
            else {
               if(res == 1)
                  req.setAttribute("msg", "입찰 등록 완료");
               else
                  req.setAttribute("msg", "입찰 성사 완료");
            }
            req.setAttribute("url", "main.do");
         } else {
            if (adto.getSaledate() == null)
               req.setAttribute("msg", "구매 실패");
            else
               req.setAttribute("msg", "입찰 등록 실패");
            req.setAttribute("url", "main.do");
         }
         return "forward:message.jsp";
      
   }

   @RequestMapping("toBuyFinal.do")
   public String toBuyFinal(HttpServletRequest req, @RequestParam Map<String, String> map) {
      ProductDTO pdto = productMapper.getProductSpec(map.get("pnum"));
      pdto.setPprice(Integer.parseInt(map.get("price")));
      req.setAttribute("size", map.get("size"));
      req.setAttribute("dto", pdto);
      return "/shop/buypage";
   }
   protected AuctionDTO remaketoAuctionDTO(ProductDTO sdto, String id, String atype, String size, String date) {
      AuctionDTO adto = new AuctionDTO();
      adto.setAtype(atype);
      adto.setId(id);
      if(atype.contains("a"))
         adto.setAid("");
      else if(atype.equals("s"))
         adto.setAid("즉시 판매");
      else
         adto.setAid("즉시 구매");
      adto.setPnum(sdto.getPnum());
      adto.setPrice(sdto.getPprice());
      adto.setPsize(size);
      adto.setSaledate(date);
      return adto;
   }
   
   @RequestMapping(value = "/check_standard.do")
   public String check_standard() {
      return "/shop/check_standard";
   }
   
   @RequestMapping("getBuyListFromPageAjax.do")
   @ResponseBody
   public List<ReviewDTO> getBuyListFromPageAjax(@RequestParam String id){
      List<ReviewDTO> list = new ArrayList<ReviewDTO>();
      List<AuctionDTO>alist = auctionMapper.reviewTransForAjax(id);
      for(AuctionDTO dto : alist) {
         System.out.println(dto.getId());
         ProductDTO pdto = productMapper.getProductSpec(String.valueOf(dto.getPnum()));
         ReviewDTO rdto = new ReviewDTO();
         rdto.setRtitle(pdto.getPname());
         rdto.setRimage(pdto.getPimage());
         rdto.setRegdate(dto.getSaledate()); 
         rdto.setRproduct(dto.getPsize());
         list.add(rdto);
         System.out.println(list.size());
      }
      return list;
   }

}
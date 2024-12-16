package com.example.demo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.WishDTO;
import com.example.demo.service.ProductMapper;
import com.example.demo.service.WishMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class WishController {
   
   @Autowired
   private WishMapper wishMapper;
   @Autowired
   private ProductMapper productMapper;
   
   public int countWish(int mem) {
       return wishMapper.countWish(mem);
   }
   
   @ResponseBody
   @RequestMapping(value = "/insert_wish.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
   public String clickWishButton(HttpServletRequest req, @RequestParam int mem, 
         @RequestParam String pcode) {
      WishDTO dto = new WishDTO();
       dto.setMem(mem);
       dto.setPcode(pcode);
       
       req.setAttribute("upPath", req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files"));
       ProductDTO dto2 = productMapper.getProduct(pcode);    
       dto.setPbrand(dto2.getPbrand());
       
       dto.setPname(dto2.getPname());
       dto.setPimage(dto2.getPimage());
       dto.setPprice(dto2.getPprice());
       wishMapper.insertWish(dto);
       
       productMapper.updateProductWishCount(pcode);
       return "위시리스트에 저장 완료!";
   }

   @ResponseBody
   @RequestMapping(value = "/delete_wish.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
   public String wishDel(@RequestParam Map<String, String> params) {
       wishMapper.deleteWish(params);
       productMapper.updateProductWishCount2(params.get("pcode"));
       return "위시리스트에서 삭제했습니다";
   }
    
   
   @RequestMapping(value="/list_wish.do", method=RequestMethod.GET)
   public String listWish(HttpServletRequest req,
         @RequestParam(required = false) String pageNum, int mem) {
      if (pageNum == null) pageNum = "1"; 
      req.setAttribute("upPath", req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files"));
        int pageSize = 5;
        int currentPage = (Integer.parseInt(pageNum));
        int start = (currentPage - 1) * pageSize + 1;
        int end = start + pageSize - 1;
        int count = 0;
        List<WishDTO> list = null;
 
        try {
            count = wishMapper.countWish(mem);
            if (end > count) end = count;
            list = wishMapper.listWish(start, end, mem);
            
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "DB서버 오류 발생");
            req.setAttribute("url", "mypage.do");
        }
        int number = count - start + 1;
        int pageBlock = 3;
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
        int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;
        String[] key = new String[] { "number", "count", "pageBlock", "pageCount", "startPage", "endPage" };
        int[] values = new int[] { number, count, pageBlock, pageCount, startPage, endPage };
        for (int i = 0; i < 6; i++)
            req.setAttribute(key[i], values[i]);

      req.setAttribute("listWish", list);
      return "mypage/wishList";
   }
   
   @ResponseBody
   @GetMapping("/getWish.do")
   public Map<String, Object> getWish(HttpServletRequest req, String pcode) {
       Map<String, Object> result = new HashMap<>();

       int res = wishMapper.prodWish(pcode);
       result.put("wishCount", res);

       return result;
   }
   
   
}
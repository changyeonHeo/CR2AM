package com.example.demo;

import java.io.File;
import java.io.IOException;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.MemberDTO;
import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.ReplyDTO;
import com.example.demo.dto.ReviewDTO;
import com.example.demo.service.ProductMapper;
import com.example.demo.service.ReplyMapper;
import com.example.demo.service.ReviewMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {
   
   @Autowired
   private ProductMapper productMapper;
   
   @Autowired
   private ReviewMapper reviewMapper;
   
   @Autowired
   private ReplyMapper replyMapper;
   
   
   @RequestMapping(value = "review_list.do")
   public String myReview(HttpServletRequest req, 
                          @RequestParam(required = false) String pageNum, String id) {  
         
       if (pageNum == null) pageNum = "1";
       req.setAttribute("upPath", req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files"));
       int pageSize = 8;
       int currentPage = (Integer.parseInt(pageNum));
       int start = (currentPage - 1) * pageSize + 1;
       int end = start + pageSize - 1;
       int count = 0;
       List<ReviewDTO> list = null;

       try {
           count = reviewMapper.getMyReviewCount(id);
           if (end > count) end = count;
           list = reviewMapper.listMyReview(start, end, id);
       } catch (Exception e) {
           e.printStackTrace();
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
       
       req.setAttribute("listMyReview", list);
       return "review/review_list";
   }

   @RequestMapping(value="/review_writeForm.do", method=RequestMethod.GET)
   public String review_writeForm_pro(HttpServletRequest req, @RequestParam String rproduct) {
         
      req.setAttribute("rproduct", rproduct);
      return "review/review_writeForm";
   } 
   
   @RequestMapping(value ="/review_writeForm.do", method = RequestMethod.POST)
   public String review_writeForm(HttpServletRequest req,
         @ModelAttribute ReviewDTO dto, BindingResult result) {
         
      MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
      MultipartFile mf = mr.getFile("rimage");
      
      if (mf != null && !mf.isEmpty()) {
         String filename = mf.getOriginalFilename();
         String path = req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files");
         File file = new File(path, filename);

      try {
         mf.transferTo(file);
      }catch(IOException e) {
         e.printStackTrace();
         req.setAttribute("msg", "파일 업로드 중 오류발생!! 관리자에게 문의해 주세요");
         req.setAttribute("url", "review_writeForm.do");   
         return "forward:message.jsp";
      }
      dto.setRimage(filename);
      } else {
         dto.setRimage("");
      }
      ProductDTO pdto = productMapper.getProductDetail(dto.getRproduct());
      int res = reviewMapper.insertReview(dto);
      if (res > 0) {
         req.setAttribute("msg", "리뷰 등록 완료");
         req.setAttribute("url", "productview.do?pnum="+pdto.getPnum()+"&pcode="+pdto.getPcode()+"&pname="+pdto.getPname());
      } else {
         req.setAttribute("msg", "리뷰 등록 실패");
         req.setAttribute("url", "productview.do?pnum="+pdto.getPnum()+"&pcode="+pdto.getPcode()+"&pname="+pdto.getPname());
      }
      return "forward:message.jsp";
   }

   @RequestMapping("/review_content.do")
   public String ReviewContent(HttpServletRequest req, 
         @RequestParam(required = false) String pageNum, int rnum) {
      
         ReviewDTO dto = reviewMapper.getReview(rnum);         
         req.setAttribute("upPath", req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files"));      
         req.setAttribute("getReview", dto);
         
         if (pageNum == null) pageNum = "1"; 

          int pageSize = 5;
          int currentPage = (Integer.parseInt(pageNum));
          int start = (currentPage - 1) * pageSize + 1;
          int end = start + pageSize - 1;
          int count = 0;
          List<ReplyDTO> list = null;

          try {
              count = replyMapper.getReplyCount();
              if (end > count) end = count;
              list = replyMapper.getReply(start, end, rnum);
              
          } catch (Exception e) {
              e.printStackTrace();
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

         req.setAttribute("getReply", list);
         return "review/review_content";
      }

//  // 사용자 댓글 달기 
//   @RequestMapping(value="/review_commentForm.do", method=RequestMethod.GET)
//   public String review_commentForm_pro(HttpServletRequest req, @RequestParam Map<String, String> params) {
//      req.setAttribute("replyMember", params);
//      return "review/review_commentForm";
//   } 
//   
//   // 사용자 댓글 달기    
//   @RequestMapping(value = "/review_commentForm.do", method = RequestMethod.POST)
//   public String review_commentForm(HttpServletRequest req, @ModelAttribute ReplyDTO dto) {
//      int res = replyMapper.insertReply(dto);
//     
//      if (res > 0) {
//         req.setAttribute("msg", "댓글 등록 완료");
//         req.setAttribute("url", "review_content.do?rnum="+dto.getRnum()+"&id="+dto.getId());
//      } else {
//         req.setAttribute("msg", "댓글 등록 실패");
//         req.setAttribute("url", "review_content.do?rnum="+dto.getRnum()+"&id="+dto.getId());
//      }
//      return "forward:message.jsp";
//   }

   // 사용자 댓글 달기  
   @PostMapping("/review_comment.do")
   @ResponseBody
   public String review_comment(HttpServletRequest req, @ModelAttribute ReplyDTO dto) {
       try {
           replyMapper.insertReply(dto);
           return "댓글이 성공적으로 등록되었습니다.";
       } catch (Exception e) {
           e.printStackTrace();
           return "댓글 등록에 실패했습니다.";
       }
   }
   
   @GetMapping("/getReply.do")
   @ResponseBody
   public Map<String, Object> getBreplyList(HttpServletRequest req,
           @RequestParam(required = false) String pageNum,
           @RequestParam(required = false, defaultValue = "5") int pageSize,
           int rnum) {
       Map<String, Object> resultMap = new HashMap<>();
       try {
           if (pageNum == null) pageNum = "1";

           int currentPage = Integer.parseInt(pageNum);
           int start = (currentPage - 1) * pageSize + 1;
           int end = start + pageSize - 1;
           int count = 0;
           List<ReplyDTO> list = null;

           try {
               count = replyMapper.getReplyCount();
               if (end > count) end = count;
               list = replyMapper.getReply(start, end, rnum);

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

           req.setAttribute("getReply", list);

           resultMap.put("getReply", list);

           // 더 불러올 댓글이 없을 때 해당 정보를 전달
           if (list.size() < pageSize) {
               resultMap.put("noMoreComments", true);
           } else {
               resultMap.put("noMoreComments", false);
           }

           return resultMap;
       } catch (Exception e) {
           e.printStackTrace();
           resultMap.put("getReply", Collections.emptyList());
           return resultMap;
       }
   }

   // 사용자 리뷰 삭제
   @RequestMapping(value = "/review_delete.do", method = RequestMethod.GET)
   public String deleteReview(HttpServletRequest req, @ModelAttribute ReviewDTO dto, 
         @ModelAttribute ProductDTO pdto, int rnum) {
      int res = reviewMapper.deleteReview(rnum);
      if (res > 0) {
         req.setAttribute("msg", "리뷰 삭제 성공!!");
         req.setAttribute("url", "productview.do?pnum="+pdto.getPnum()+"&pcode="+pdto.getPcode()+"&pname="+pdto.getPname());
      } else {
         req.setAttribute("msg", "리뷰 삭제 실패!!");
         req.setAttribute("url", "review_content.do?pnum="+pdto.getPnum()+"&pcode="+pdto.getPcode()+"&pname="+pdto.getPname());
      }
      return "forward:message.jsp";
   }
   
   // 사용자 댓글 삭제 
   @RequestMapping(value = "/review_comment_delete.do")
   public String replyDel(HttpServletRequest req, @RequestParam Map<String, String> params,@ModelAttribute ReplyDTO dto) {
         int res = replyMapper.deleteReply(Integer.parseInt(params.get("renum")));
         if (res > 0) {
             req.setAttribute("msg", "댓글 삭제 성공. 게시글 목록 페이지로 이동합니다.");
             req.setAttribute("url", "review_content.do?rnum="+dto.getRnum()+"&id="+dto.getId());
         } else {
             req.setAttribute("msg", "댓글 삭제 실패. 게시글 보기 페이지로 이동합니다.");
             req.setAttribute("url", "review_content.do?rnum="+dto.getRnum()+"&id="+dto.getId());         }
     
      return "forward:message.jsp";
   }
   
   //사용자 리뷰 수정
   @RequestMapping(value="/review_update.do", method=RequestMethod.GET)
   public String review_update_pro(HttpServletRequest req, int rnum) {
     ReviewDTO dto = reviewMapper.getReview(rnum);
     req.setAttribute("upPath", req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files"));
     req.setAttribute("getReview", dto);
     return "review/review_update";
   }
   
   //사용자 리뷰 수정  
   @RequestMapping(value ="/review_update.do", method = RequestMethod.POST)
   public String review_update(HttpServletRequest req,
         @ModelAttribute ReviewDTO dto, BindingResult result) {
      if (result.hasErrors()) {
            dto.setRimage("");
      }
            
      MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
       MultipartFile mf = mr.getFile("rimage");
       String filename = mf.getOriginalFilename();
       if (filename == null || filename.trim().equals("")) {
           dto.setRimage(req.getParameter("rimage2"));
       } else {
           String path = req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files");
           File file = new File(path, filename);
         try {
            mf.transferTo(file);
         }catch(IOException e) {
            e.printStackTrace();
            req.setAttribute("msg", "이미지 업로드 중 오류가 발생했습니다.");
            req.setAttribute("url", "review_update.do?rnum=" + dto.getRnum());   
            return "forward:message.jsp";
         }
         dto.setRimage(filename);
     } 
      int res = reviewMapper.updateReview(dto);
      
      if (res > 0) {
         req.setAttribute("msg", "리뷰 수정 완료");
         req.setAttribute("url", "review_content.do?rnum="+dto.getRnum()+"&id="+dto.getId());
      } else {
         req.setAttribute("msg", "리뷰 수정 실패");
         req.setAttribute("url", "review_content.do?rnum="+dto.getRnum()+"&id="+dto.getId());
      }
      return "forward:message.jsp";
   }
   
   //관리자 리뷰 목록
   @RequestMapping("/admin_review_list.do")
   public String AllReview(HttpServletRequest req, 
         @RequestParam(required = false) String pageNum, 
         @RequestParam Map<String, String> params) {
      
      if (pageNum == null) pageNum = "1";
       req.setAttribute("upPath", req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files"));
       int pageSize = 20;
       int currentPage = (Integer.parseInt(pageNum));
       int start = (currentPage - 1) * pageSize + 1;
       int end = start + pageSize - 1;
       int number;
       int count = 0;
       List<ReviewDTO> list = null;
       
       try {
         if (params.get("search") == null) {
            count = reviewMapper.getReviewCount();
              if (end > count) end = count;
              list = reviewMapper.getReviewAll(start, end);
         } else {
            params.replace("searchString", "%" + params.get("searchString") + "%");
            list = reviewMapper.findReview(start, end, params);
            number = list.size();
         }
         
      } catch (Exception e) {
         e.printStackTrace();
           req.setAttribute("msg", "DB서버 오류 발생");
           req.setAttribute("url", "reviewAll.do");
         return "forward:message.jsp";
      }
       
       number = count - start + 1;
       int pageBlock = 3;
       int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
       int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
       int endPage = startPage + pageBlock - 1;
       if (endPage > pageCount) endPage = pageCount;
       
       String[] key = new String[] { "number", "count", "pageBlock", "pageCount", "startPage", "endPage" };
       int[] values = new int[] { number, count, pageBlock, pageCount, startPage, endPage };
       for (int i = 0; i < 6; i++)
           req.setAttribute(key[i], values[i]);
       
       req.setAttribute("getReviewAll", list);
       return "review/admin_review_list";
   }
   
   // 관리자 리뷰 보기
   @RequestMapping("/admin_review_content.do")
   public String adminReviewContent(HttpServletRequest req, 
         @RequestParam(required = false) String pageNum, int rnum) {
      
         ReviewDTO dto = reviewMapper.getReview(rnum);         
         req.setAttribute("upPath", req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files"));      
         req.setAttribute("getReview", dto);
         
         if (pageNum == null) pageNum = "1"; 

          int pageSize = 5;
          int currentPage = (Integer.parseInt(pageNum));
          int start = (currentPage - 1) * pageSize + 1;
          int end = start + pageSize - 1;
          int count = 0;
          List<ReplyDTO> list = null;

          try {
              count = replyMapper.getReplyCount();
              if (end > count) end = count;
              list = replyMapper.getReply(start, end,rnum);
              
          } catch (Exception e) {
              e.printStackTrace();
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

         req.setAttribute("getReply", list);
         return "review/admin_review_content";
      }
 
      //관리자 리뷰 삭제
      @RequestMapping(value = "/admin_review_delete.do", method = RequestMethod.GET)
      public String deleteReview(HttpServletRequest req, int rnum) {
         int res = reviewMapper.deleteReview(rnum);
         if (res > 0) {
            req.setAttribute("msg", "리뷰 삭제 성공!!");
            req.setAttribute("url", "admin_review_list.do");
         } else {
            req.setAttribute("msg", "리뷰 삭제 실패!!");
            req.setAttribute("url", "admin_review_list.do");
         }
         return "forward:message.jsp";
      }
      
      // 관리자 댓글 삭제 
      @RequestMapping(value = "/admin_review_comment_delete.do")
      public String admin_review_comment_delete(HttpServletRequest req, 
            @RequestParam Map<String, String> params, @ModelAttribute ReplyDTO dto) {
         
         int res = replyMapper.deleteReply(Integer.parseInt(params.get("renum")));
            if (res > 0) {
                req.setAttribute("msg", "댓글 삭제 성공");
                req.setAttribute("url", "admin_review_content.do?rnum="+dto.getRnum()+"&id="+dto.getId());
            } else {
                req.setAttribute("msg", "댓글 삭제 실패!! 게시글 보기 페이지로 이동합니다.");
                req.setAttribute("url", "admin_review_content.do?rnum="+dto.getRnum()+"&id="+dto.getId());
            }        
         return "forward:message.jsp";
      }
      
}
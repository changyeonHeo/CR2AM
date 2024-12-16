package com.example.demo;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.BreplyDTO;
import com.example.demo.service.BoardMapper;
import com.example.demo.service.BreplyMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
   
   @Autowired
   private BoardMapper boardMapper;
   
   @Autowired
   private BreplyMapper breplyMapper;
   
   
   @RequestMapping(value = "admin_board_list.do")
   public String admin_board_list(HttpServletRequest req, @RequestParam(required = false) String pageNum
         , @RequestParam Map<String, String> params) {
      if (pageNum == null) {
         pageNum = "1";
      }
      int pageSize = 20;
      int currentPage = (Integer.parseInt(pageNum));
      int start = (currentPage - 1) * pageSize + 1;
      int end = start + pageSize - 1;
      int number;
      int count = 0;
      List<BoardDTO> list = null;
       
      try {
          if (params.get("search") == null) {
             count = boardMapper.getCount();
               if (end > count) end = count;
               list = boardMapper.listBoardAll(start,end);
          } else {
             params.replace("searchString", "%" + params.get("searchString") + "%");
             list = boardMapper.findBoard(start,end);
             number = list.size();
          }
          
       } catch (Exception e) {
          e.printStackTrace();
            req.setAttribute("msg", "DB서버 오류 발생");
            req.setAttribute("url", "mypage.do");
          return "forward:message.jsp";
       }
      number = count - start + 1;
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
      req.setAttribute("listBoardAll", list);
      return "board/admin_board_list";
   }
   
   @RequestMapping(value = "list.do")
   public String list(HttpServletRequest req, @RequestParam(required = false) String pageNum, @ModelAttribute BoardDTO dto,BindingResult result,String id) {
      if (pageNum == null) {
         pageNum = "1";
      }
      int pageSize = 5;
      int currentPage = (Integer.parseInt(pageNum));
      int start = (currentPage - 1) * pageSize + 1;
      int end = start + pageSize - 1;
      int count = 0;
      List<BoardDTO> list = null;
      try {
    	  count = boardMapper.getCountBoard(id);
         if (end > count)
            end = count;
         list = boardMapper.listBoard(start,end,id);
         
      } catch (Exception e) {
         e.printStackTrace();
         req.setAttribute("msg", "DB서버 오류 발생");
         req.setAttribute("url", "list.do");
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
      req.setAttribute("listBoard", list);
      return "board/board_list";
      
   }

   @RequestMapping(value = "/write.do", method = RequestMethod.GET)
   public String writeForm(HttpServletRequest req) {
      HttpSession session = req.getSession();
      if (session.getAttribute("loginMember") == null) {
         req.setAttribute("msg", "로그인을 해주세요");
         req.setAttribute("url", "login.do");
         return "forward:message.jsp";
      } else
         return "board/board_writeForm";
   }
   
   @RequestMapping(value = "/write.do", method = RequestMethod.POST)
   public String writeForm(HttpServletRequest req, @ModelAttribute BoardDTO dto, BindingResult result) {
      
       MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
       MultipartFile mf = mr.getFile("bimage");
       if (mf != null && !mf.isEmpty()) {
           String filename = mf.getOriginalFilename();
           String path = "C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files";
           File file = new File(path, filename);
           try {
               mf.transferTo(file);
           } catch (IOException e) {
               req.setAttribute("msg", "파일 업로드 중 오류 발생!! 관리자에게 문의해 주세요");
               req.setAttribute("url", "write.do");
               return "forward:message.jsp";
           }
           dto.setBimage(filename);
       } else {
           dto.setBimage("");
       }

       int res = boardMapper.insertBoard(dto);
       if (res > 0) {
           req.setAttribute("msg", "게시글 등록 완료");
           req.setAttribute("url", "list.do?id=" + dto.getId());
       } else {
           req.setAttribute("msg", "게시글 등록 실패");
           req.setAttribute("url", "write.do");
       }
       return "forward:message.jsp";
   }
   
      @RequestMapping("/admin_board_content.do")
      public String admin_board_content(HttpServletRequest req, 
         @RequestParam(required = false) String pageNum, int bnum) {
      
      BoardDTO dto = boardMapper.getBoard(bnum);     
      req.setAttribute("upPath", req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files"));      
      req.setAttribute("getBoard", dto);
      
       if (pageNum == null) pageNum = "1"; 

        int pageSize = 5;
        int currentPage = (Integer.parseInt(pageNum));
        int start = (currentPage - 1) * pageSize + 1;
        int end = start + pageSize - 1;
        int count = 0;
        List<BreplyDTO> list = null;

        try {
            count = breplyMapper.getBreplyCount();
            if (end > count) end = count;
            list = breplyMapper.getBreply(start, end, bnum);
            
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
               
       req.setAttribute("getBreply", list);
       return "board/admin_board_content";
   }
   
   
   @RequestMapping("/content.do")
   public String BoardContent(HttpServletRequest req, 
         @RequestParam(required = false) String pageNum, int bnum) {
      
      BoardDTO dto = boardMapper.getBoard(bnum);      
      req.setAttribute("upPath", req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files"));      
      req.setAttribute("getBoard", dto);
      
       if (pageNum == null) pageNum = "1"; 

        int pageSize = 5;
        int currentPage = (Integer.parseInt(pageNum));
        int start = (currentPage - 1) * pageSize + 1;
        int end = start + pageSize - 1;
        int count = 0;
        List<BreplyDTO> list = null;

        try {
            count = breplyMapper.getBreplyCount();
            if (end > count) end = count;
            list = breplyMapper.getBreply(start, end, bnum);
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
        
       
       req.setAttribute("getBreply", list);
       return "board/board_content";
   }
   
  
   
   @RequestMapping(value="/admin_board_comment.do", method=RequestMethod.GET)
   public String admin_replyinput(HttpServletRequest req, @RequestParam Map<String, String> params) {
      req.setAttribute("breplyList", params);
      return "board/admin_board_comment";
   } 
   
   @RequestMapping(value = "/admin_board_comment.do", method = RequestMethod.POST)
   public String admin_breplyPro(HttpServletRequest req, @ModelAttribute BreplyDTO dto) {
      int res = breplyMapper.insertBreply(dto);
      
      if (res > 0) {
         req.setAttribute("msg", "댓글 등록 완료");
         req.setAttribute("url", "admin_board_content.do?bnum="+dto.getBnum()+"&id="+dto.getId());
      } else {
         req.setAttribute("msg", "댓글 등록 실패");
         req.setAttribute("url", "admin_board_comment.do?bnum="+dto.getBnum()+"&id="+dto.getId());
      }

      return "forward:message.jsp";
   }
   
   @RequestMapping(value = "/breplyDelete.do")
   public String breplyDel(HttpServletRequest req, @RequestParam Map<String, String> params,@ModelAttribute BreplyDTO dto) {
         int res = breplyMapper.deleteBreply(Integer.parseInt(params.get("brenum")));
         if (res > 0) {
             req.setAttribute("msg", "댓글이 삭제 되었습니다.");
             req.setAttribute("url", "content.do?bnum="+dto.getBnum()+"&id="+dto.getId());
         } else {
             req.setAttribute("msg", "댓글 삭제 실패!! 게시글 보기 페이지로 이동합니다.");
             req.setAttribute("url", "content.do?bnum="+dto.getBnum()+"&id="+dto.getId());
         }
     
      return "forward:message.jsp";
   }
   
   @RequestMapping(value = "/admin_breplyDelete.do")
   public String admin_breplyDel(HttpServletRequest req, @RequestParam Map<String, String> params,@ModelAttribute BreplyDTO dto) {
         int res = breplyMapper.deleteBreply(Integer.parseInt(params.get("brenum")));
         if (res > 0) {
             req.setAttribute("msg", "댓글이 삭제 되었습니다.");
             req.setAttribute("url", "admin_board_content.do?bnum="+dto.getBnum()+"&id="+dto.getId());
         } else {
             req.setAttribute("msg", "댓글 삭제 실패!! 게시글 보기 페이지로 이동합니다.");
             req.setAttribute("url", "admin_board_content.do?bnum="+dto.getBnum()+"&id="+dto.getId());
         }
     
      return "forward:message.jsp";
   }

   @RequestMapping(value = "/delete.do")
   public String BoardDeletePro(HttpServletRequest req, @RequestParam Map<String, String> params,@ModelAttribute BoardDTO dto) {
     int res = boardMapper.deleteBoard(Integer.parseInt(params.get("bnum")));
      if (res > 0) {
         req.setAttribute("msg", "게시글 삭제 성공!! 게시글 목록 페이지로 이동합니다.");
         req.setAttribute("url", "list.do?id=" + dto.getId());
      }else {
         req.setAttribute("msg", "게시글 삭제 실패!! 게시글 보기 페이지로 이동합니다.");
         req.setAttribute("url", "content.do?bnum=" + params.get("bnum"));
      }
      return "forward:message.jsp";
   }
   
   @RequestMapping(value = "/delete_adminBoard.do")
   public String adminBoardDeletePro(HttpServletRequest req, @RequestParam Map<String, String> params,@ModelAttribute BoardDTO dto) {
     int res = boardMapper.deleteBoard(Integer.parseInt(params.get("bnum")));
      if (res > 0) {
         req.setAttribute("msg", "게시글 삭제 성공!! 게시글 목록 페이지로 이동합니다.");
         req.setAttribute("url", "admin_board_list.do");
      }else {
         req.setAttribute("msg", "게시글 삭제 실패!! 게시글 목록 페이지로 이동합니다.");
         req.setAttribute("url", "admin_board_list.do");
      }
      return "forward:message.jsp";
   }

   @RequestMapping(value = "/update.do", method = RequestMethod.GET)
   public String BoardUpdate(HttpServletRequest req, int bnum) {
     HttpSession session = req.getSession();
      BoardDTO dto = boardMapper.getBoard(bnum);
      req.setAttribute("upPath", req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files"));
      req.setAttribute("getBoard", dto);
      return "board/board_updateForm";
   }

   @RequestMapping(value = "/update.do", method = RequestMethod.POST)
   public String BoardUpdatePro(HttpServletRequest req, @ModelAttribute BoardDTO dto, BindingResult result) {
      if (result.hasErrors()) {
           dto.setBimage("");
       }

       MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
       MultipartFile mf = mr.getFile("bimage");
       String filename = mf.getOriginalFilename();
       if (filename == null || filename.trim().equals("")) {
           dto.setBimage(req.getParameter("bimage2"));
       } else {
           String path = req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files");
           File file = new File(path, filename);
           try {
               mf.transferTo(file);
           } catch (IOException e) {
               req.setAttribute("msg", "이미지 업로드 중 오류가 발생했습니다.");
               req.setAttribute("url", "write.do?bnum=" + dto.getBnum());
               return "forward:message.jsp";
           }
           dto.setBimage(filename);
       }
      int res = boardMapper.updateBoard(dto);

      if (res > 0) {
         req.setAttribute("msg", "게시글 수정 완료");
         req.setAttribute("url", "list.do?bnum="+dto.getBnum()+"&id="+dto.getId());
      } else {
         req.setAttribute("msg", "게시글 수정 실패!! 게시글 보기 페이지로 이동합니다.");
         req.setAttribute("url", "list.do?bnum="+dto.getBnum()+"&id="+dto.getId());
      }
      return "forward:message.jsp";
   }
   
   @PostMapping("/board_comment.do")
   @ResponseBody
   public String saveComment(HttpServletRequest req, @ModelAttribute BreplyDTO dto) {
       try {
           breplyMapper.insertBreply(dto);
           return "댓글이 성공적으로 등록되었습니다.";
       } catch (Exception e) {
           e.printStackTrace();
           return "댓글 등록에 실패했습니다.";
       }
   }
   
   @GetMapping("/getBreply.do")
   @ResponseBody
   public Map<String, Object> getBreplyList(HttpServletRequest req, 
           @RequestParam(required = false) String pageNum, 
           @RequestParam(required = false, defaultValue = "5") int pageSize, 
           int bnum) {
       Map<String, Object> resultMap = new HashMap<>();
       try {
           if (pageNum == null) pageNum = "1";

           int currentPage = Integer.parseInt(pageNum);
           int start = (currentPage - 1) * pageSize + 1;
           int end = start + pageSize - 1;
           int count = 0;
           List<BreplyDTO> list = null;

           try {
               count = breplyMapper.getBreplyCount();
               if (end > count) end = count;
               list = breplyMapper.getBreply(start, end, bnum);

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

           req.setAttribute("getBreply", list);

           resultMap.put("getBreply", list);
           return resultMap;
       } catch (Exception e) {
           e.printStackTrace();
           resultMap.put("getBreply", Collections.emptyList());
           return resultMap;  // 실패 시 빈 목록 반환 또는 적절한 실패 처리
       }
   }
}
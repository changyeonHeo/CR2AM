package com.example.demo;

import java.io.File;
import java.io.IOException;
import java.util.*;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.*;
import com.example.demo.service.*;
import jakarta.servlet.http.*;

@Controller
public class MemberController {

   @Autowired
   MemberMapper memberMapper;
   @Autowired
   JavaMailSenderImpl mailSender;
   @Autowired
   AddressMapper addressMapper;

   
   
   @RequestMapping(value = "/member_list.do")
   public String listMember(HttpServletRequest req, @RequestParam(required = false) String pageNum) {
      if (pageNum == null) {
         pageNum = "1";
      }

      int pageSize = 5;
      int currentPage = (Integer.parseInt(pageNum));
      int start = (currentPage - 1) * pageSize + 1;
      int end = start + pageSize - 1;
      int count = 0;
      List<MemberDTO> list = null;

      try {
         count = memberMapper.getCount();
         if (end > count)
            end = count;
         list = memberMapper.listMember(start, end);
      } catch (Exception e) {
         e.printStackTrace();
         req.setAttribute("msg", "DB오류발생!!");
         req.setAttribute("url", "member_list.do");
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
      req.setAttribute("listMember", list);

      return "admin/member_list";
   }

   @RequestMapping("/memberSsn.do")
   public String memberSsn() {
      return "member/member_input";
   }

   @RequestMapping("/member_check.do")
   public String memberCheck(HttpServletRequest req, @RequestParam Map<String, String> params) {
      boolean isMember = memberMapper.checkMember(params);
      if (isMember) {
         req.setAttribute("msg", "저희 회원이십니다. 로그인을 해 주세요");
         return "closeWindow";
      } else {
         req.setAttribute("msg", "회원가입페이지로 이동합니다.");
         req.setAttribute("url", "member_input.do");
         HttpSession session = req.getSession();
         session.setAttribute("name", params.get("name"));
         session.setAttribute("hp1", params.get("hp1"));
         session.setAttribute("hp2", params.get("hp2"));
         session.setAttribute("hp3", params.get("hp3"));
      }
      return "forward:message.jsp";
   }

   @RequestMapping(value = "/member_input.do", method = RequestMethod.GET)
   public String memberInput() {
      return "member/member_input";
   }

   @RequestMapping(value = "/personal_check.do")
   public String personalCheck(HttpServletRequest req, @ModelAttribute MemberDTO dto) {
      HttpSession session = req.getSession();
      session.setAttribute("dto", dto);
      return "member/personal_check";
   }

   @RequestMapping(value = "/checkOk.do")
   public String checkOk(HttpServletRequest req) {
      req.setAttribute("msg", "본인 인증 완료");
      return "closeWindow";
   }

   @RequestMapping(value = "/member_input.do", method = RequestMethod.POST)
   public String memberInput(HttpServletRequest req) {
      HttpSession session = req.getSession();
      MemberDTO dto = (MemberDTO) session.getAttribute("dto");
      int res = memberMapper.insertMember(dto);
      dto.setMem(memberMapper.getMem(dto.getId()));
      int resp = addressMapper.insertAddressMember(dto);
      session.setAttribute("dto", dto);
      if (res > 0 && resp > 0) {
         return "member/member_input_fin";
      } else {
         return "redirect:member_input.do";
      }
   }
   
   @RequestMapping(value = "/member_deleteAgree.do")
   public String memberDeleteAgree() {
      return "mypage/member_delete";
   }
   
   @RequestMapping(value = "/member_delete.do", method=RequestMethod.GET)
   public String memberDelete(HttpServletRequest req, int mem) {
      int res = memberMapper.deleteMember(mem);
      HttpSession session = req.getSession();
      session.invalidate();
      if (res > 0) {
         req.setAttribute("msg", "회원삭제성공!!");
         req.setAttribute("url", "main.do");
      } else {
         req.setAttribute("msg", "회원삭제실패!!");
         req.setAttribute("url", "mypage.do");
      }
      return "forward:message.jsp";
   }

@RequestMapping(value = "/ad_member_delete.do", method=RequestMethod.GET)
   public String adMemberDelete(HttpServletRequest req, int mem) {
	      int res = memberMapper.deleteMember(mem);
	      if (res > 0) {
	         req.setAttribute("msg", "회원삭제성공!!");
	         req.setAttribute("url", "member_list.do");
	      } else {
	         req.setAttribute("msg", "회원삭제실패!!");
	         req.setAttribute("url", "member_list.do");
	      }
	      return "forward:message.jsp";
	   }

   @RequestMapping(value = "/member_update.do", method = RequestMethod.GET)
   public String memberUpdate(HttpServletRequest req, String id) {
      MemberDTO dto = memberMapper.getMember(id);
      req.setAttribute("loginfo", dto);
      return "mypage/member_update";
   }

   @RequestMapping(value = "/member_update.do", method = RequestMethod.POST)
   public String memberUpdate(HttpServletRequest req, @ModelAttribute MemberDTO dto) {
      int res = memberMapper.updateMember(dto);
      if (res > 0) {
         req.setAttribute("msg", "정보수정성공!!");
         req.setAttribute("url", "loginfo.do?id="+dto.getId());
      } else {
         req.setAttribute("msg", "정보수정실패!!");
         req.setAttribute("url", "loginfo.do?id="+dto.getId());
      }
      return "forward:message.jsp";
   }


   @RequestMapping("/find_Member.do")
   public String findMember(HttpServletRequest req, @RequestParam Map<String, String> params) {
      String pageNum = params.get("pageNum");
      if (params.get("pageNum") == null) {
         pageNum = "1";
      }

      int pageSize = 5;
      int currentPage = (Integer.parseInt(pageNum));
      int startRow = (currentPage - 1) * pageSize + 1;
      int endRow = startRow + pageSize - 1;
      int count = 0;
      int number = 0;

      List<MemberDTO> list = null;
      try {
         if (params.get("search") == null) {
            count = memberMapper.getCount();
            if (endRow > count)
               endRow = count;
            list = memberMapper.listMember(startRow, endRow);
            number = count - startRow + 1;
         } else {
            params.replace("searchString", "%" + params.get("searchString") + "%");
            list = memberMapper.findMember1(params);
            number = list.size();
         }
      } catch (Exception e) {
         e.printStackTrace();
         req.setAttribute("msg", "DB오류발생!!");
         req.setAttribute("url", "member_list.do");

      }

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
      req.setAttribute("listMember", list);

      return "admin/member_list";
   }

   @ResponseBody
   @PostMapping("/EmailAuth")
   public String emailAuth(String email) {
      Random random = new Random();
      int checkNum = random.nextInt(888888) + 111111;

      // 이메일 보낼 양식
      String setFrom = "cr2amshop@naver.com"; // 2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
      String toMail = email;
      String title = "회원가입 인증 이메일 입니다.";
      String content = "인증 코드는 " + checkNum + " 입니다." + "<br>" + "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";

      try {
         MimeMessage message = mailSender.createMimeMessage(); // Spring에서 제공하는 mail API
         MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
         helper.setFrom(setFrom);
         helper.setTo(toMail);
         helper.setSubject(title);
         helper.setText(content, true);
         mailSender.send(message);
      } catch (Exception e) {
         e.printStackTrace();
      }

      return Integer.toString(checkNum);
   }

   @ResponseBody
   @PostMapping("/idChk.do")
   public String idChk(String id) {
      int result = memberMapper.idChk(id);

      if (result == 0) {
         return "success"; // 중복 아이디 없음
      } else {
         return "fail"; // 중복 아이디 존재
      }
   }
   
   @RequestMapping("/loginfo.do")
   public String logInfo(HttpServletRequest req, String id) {
      MemberDTO dto = memberMapper.getMember(id);
      req.setAttribute("myinfo", dto);
         return "mypage/loginfo";
      }

   
   @RequestMapping("/updateprofile.do")
   public String updateProfile(HttpServletRequest req, String id) {
	   MemberDTO dto = memberMapper.getMember(id);
	   req.setAttribute("updateprofile", dto);
	      return "mypage/mypage_profile";
	  }
   
   @RequestMapping(value ="/update_profile.do", method = RequestMethod.POST)
   public String updateProfile(HttpServletRequest req,
         @ModelAttribute MemberDTO dto, BindingResult result, String id) {
	   if (result.hasErrors()) {
	         dto.setProimg("");
	      }

	      MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
	      MultipartFile mf = mr.getFile("proimg");
	      String filename = mf.getOriginalFilename();
	      if (filename == null || filename.trim().equals("")) {
	         dto.setProimg(req.getParameter("proimg2"));
	      } else {
	         String path = req.getServletContext().getRealPath("C:\\fintech\\CR2AM\\src\\main\\resources\\static\\files");
	         File file = new File(path, filename);
	         try {
	            mf.transferTo(file);
	         } catch (IOException e) {
	            req.setAttribute("msg", "파일 업로드 중 오류발생!! 관리자에게 문의해 주세요");
	            req.setAttribute("url", "update_profile.do");
	            return "forward:message.jsp";
	         }
	         dto.setProimg(filename);
	      }
	      int res = memberMapper.updateProimg(dto);
	      if (res > 0) {
	          req.setAttribute("msg", "프로필사진 변경 성공");
	          req.setAttribute("url", "mypage.do?id="+dto.getId());
	       } else {
	          req.setAttribute("msg", "프로필사진 변경 실패");
	          req.setAttribute("url", "mypage.do?id="+dto.getId());
	       }
	      return "forward:message.jsp";
	   }

}
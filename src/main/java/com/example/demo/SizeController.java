package com.example.demo;

import java.util.HashMap;
import java.util.List;
import java.util.*;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.SizeDTO;
import com.example.demo.service.SizeMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SizeController {

   @Autowired
   private SizeMapper sizeMapper;

   @RequestMapping("sizeMaintance.do")
   public String sizeMaintance(HttpServletRequest req) {
      List<SizeDTO> list = sizeMapper.showSizeType();
      req.setAttribute("listSize", list);
      return "size/sizeMaintance";
   }

   @RequestMapping("showProductSize.do")
   public String showProductSize(HttpServletRequest req, String pname) {
      List<SizeDTO> list = sizeMapper.listProductSize(pname);
      req.setAttribute("listProductSize", list);
      return "size/productSize";
   }

   @RequestMapping(value = "insertProductSize.do")
   public String insertProductSize(HttpServletRequest req, @RequestParam  Map<String, String> map) {
      SizeDTO dto = new SizeDTO();
      dto.setPname(map.get("pname"));
      dto.setType(map.get("type"));
      for (int i = 0; i <= map.size() - 2; i++) {
         dto.setSeq(i);
         dto.setCsize(map.get(String.valueOf(i)));
         int res = sizeMapper.insertSizeDTO(dto);
         if (res <= 0) {
            req.setAttribute("msg", "사이즈 등록 실패!!");
            req.setAttribute("url", "showProductSize.do");
            return "forward:message.jsp";
         }
      }
      req.setAttribute("msg", "사이즈 등록 성공!!");
      req.setAttribute("url", "showProductSize.do");
      return "forward:message.jsp";
   }

   @RequestMapping(value = "sizeUpdate.do", method = RequestMethod.GET)
   public String sizeUpdate(HttpServletRequest req, String pname,String pcode) {
      List<SizeDTO> list = sizeMapper.listProductSize(pname);
      req.setAttribute("pname", pname);
      req.setAttribute("pcode", pcode);
      req.setAttribute("listProductSize", list);
      return "size/insertSize";
   }

   @RequestMapping(value = "sizeUpdate.do", method = RequestMethod.POST)
   public String sizeUpdate(HttpServletRequest req, @RequestParam Map<String,String>map) {
      SizeDTO dto = new SizeDTO();
      sizeMapper.deleteProductSize(map.get("pname"));
      dto.setPname(map.get("pname"));
      System.out.println(map.size());
      switch (map.get("type_select")) {
      case "s":
         dto.setType("s");
         for (int i = 0; i < 23; i++) {
            dto.setCsize(String.valueOf(i * 5 + 220));
            dto.setSeq(i);
            sizeMapper.updateSize(dto);
         }
         break;
      case "c":
         String sizearr[] = new String[] { "XXS", "XS", "S", "M", "L", "XL", "XXL" };
         dto.setType("c");
         for (int i = 0; i < sizearr.length; i++) {
            dto.setCsize(sizearr[i]);
            dto.setSeq(i);
            sizeMapper.updateSize(dto);
         }

         break;
      case "o":
         dto.setSeq(0);
         dto.setType("o");
         dto.setCsize("One Size");
         sizeMapper.updateSize(dto);
         break;
      case "choose":
         dto.setType(map.get("type"));
         for(int i = 0 ; i<(map.size()-4);i++) {
            dto.setSeq(i);
            dto.setCsize(map.get(String.valueOf(i)));
            sizeMapper.updateSize(dto);
         }
         break;
      default:

         break;

      }
      req.setAttribute("msg", "사이즈 등록 성공!!");
      req.setAttribute("url", "admin_prod_view.do?pcode="+map.get("pcode"));
      return "forward:message.jsp";

   }
   
   @RequestMapping("productSizeShow.do")
   public String productSizeShow(HttpServletRequest req, String pname) {
      List<SizeDTO> list = sizeMapper.listProductSize(pname);
      req.setAttribute("listProductSize", list);
      return "size/productsizelist";
   }
   
   @RequestMapping("getListToAjax.do")
   @ResponseBody
   public List<SizeDTO> getListToAjax(@RequestParam("pname") String pname) {
      List<SizeDTO> list = sizeMapper.listProductSize(pname);
      return list;
   }
}
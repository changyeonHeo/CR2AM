package com.example.demo;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.demo.dto.AddressDTO;
import com.example.demo.service.AddressMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AddressController {

   @Autowired
   AddressMapper addressMapper;

   @RequestMapping(value = "/address_insert.do", method = RequestMethod.GET)
   public String addressInsert(HttpServletRequest req, int mem) {
      req.setAttribute("mem", mem);
      return "address/address_insert";
   }

   @RequestMapping(value = "/address_insert.do", method = RequestMethod.POST)
   public String addressInsertOk(HttpServletRequest req, @ModelAttribute AddressDTO dto) {
      String phoneNumber = dto.getTel().replace("-", "");
      int max = addressMapper.MaxSeq(dto.getMem());

      // 앞 3자리를 hp1로, 가운데 4자리를 hp2로, 마지막 4자리를 hp3로 저장
      String hp1 = phoneNumber.substring(0, 3);
      String hp2 = phoneNumber.substring(3, 7);
      String hp3 = phoneNumber.substring(7);

      // DTO에 저장
      dto.setHp1(hp1);
      dto.setHp2(hp2);
      dto.setHp3(hp3);
      dto.setSeq(max + 1);

      int res = addressMapper.insertAddress(dto);

      return "Windowclose";
   }

   @RequestMapping(value = "/address_delete.do")
   public String addressDelete(HttpServletRequest req, @RequestParam Map<String, Integer> params) {
      int res = addressMapper.deleteAddress(params);
      if (res > 0) {
         req.setAttribute("msg", "주소 삭제성공!!");
         req.setAttribute("url", "address_list.do?mem=" + params.get("mem"));
      } else {
         req.setAttribute("msg", "주소 삭제실패!!");
         req.setAttribute("url", "address_list.do?mem=" + params.get("mem"));
      }
      return "forward:message.jsp";
   }

   @RequestMapping("/address_list.do")
   public String addressList(HttpServletRequest req, int mem) {
      List<AddressDTO> list = addressMapper.listAddress(mem);
      req.setAttribute("listAddress", list);
      return "/address/address_list";
   }

   @RequestMapping(value = "/address_update_seq.do")
   public String seqUpdate(HttpServletRequest req, @RequestParam Map<String, Integer> params) {
      addressMapper.updateSeqUnder(params);
      int res = addressMapper.changeSeq(params);
      if (res > 0) {
         req.setAttribute("msg", "기본 배송지 설정 완료");
         req.setAttribute("url", "address_list.do?mem=" + params.get("mem"));
      } else {
         req.setAttribute("msg", "기본 배송지 설정 실패");
         req.setAttribute("url", "address_list.do?mem=" + params.get("mem"));
      }
      return "forward:message.jsp";
   }

   @RequestMapping(value="insertNewAddressToAjax.do", method = RequestMethod.GET)
   @ResponseBody
   public void addNewAddressFromPage(@RequestParam Map<String, String> map){
      AddressDTO dto = toAddressDTO(map);
      int max = 0;
      try {
      max = addressMapper.MaxSeq(dto.getMem());
      dto.setSeq(max+1);
      }catch (BadSqlGrammarException e) {
      max = 0;
      dto.setSeq(max);
      }
      int res = addressMapper.insertAddress(dto);
      return;
   }
   
   @RequestMapping(value="getAddressListToAjax.do", method = RequestMethod.GET)
   @ResponseBody
   public List<AddressDTO> getAddressListToAjax(@RequestParam int mem){
      return addressMapper.listAddress(mem);
   }
   
   protected AddressDTO toAddressDTO(Map<String,String>map) {
      AddressDTO dto = new AddressDTO();
      dto.setMem(Integer.parseInt(map.get("mem")));
      dto.setName(map.get("name"));
      String phoneNumber = map.get("tel").replace("-", "");
      dto.setHp1(phoneNumber.substring(0, 3));
      dto.setHp2(phoneNumber.substring(3, 7));
      dto.setHp3(phoneNumber.substring(7));
      dto.setZipcode(map.get("zipcode"));
      dto.setAddress1(map.get("address1"));
      dto.setAddress2(map.get("address2"));
      return dto;
   }
}
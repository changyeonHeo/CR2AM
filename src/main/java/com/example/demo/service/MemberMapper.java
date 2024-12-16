package com.example.demo.service;

import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.MemberDTO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberMapper {
   
   @Autowired
   private SqlSession sqlSession;

   public boolean checkMember(Map<String, String> params) {
      MemberDTO dto = sqlSession.selectOne("checkMember", params);
      if (dto == null)
         return false;
      else
         return true;
   }

   public int insertMember(MemberDTO dto) {
      int res = sqlSession.insert("insertMember", dto);
      return res;
   }
   
   public int getMem(String id) {
      return sqlSession.selectOne("getMem", id);
   }

   public int deleteMember(int mem) {
      int res = sqlSession.delete("deleteMember", mem);
      return res;
   }

   public MemberDTO getMember(String id) {
      MemberDTO dto = sqlSession.selectOne("findMember", id);
      return dto;
   }

   public int updateMember(MemberDTO dto) {
      int res = sqlSession.update("updateMember", dto);
      return res;
   }

   public List<MemberDTO> listMember(int start, int end) {
      Map<String, Integer> map = new Hashtable<>();
      map.put("start", start);
      map.put("end", end);
      return sqlSession.selectList("listMember", map);
   }

   public List<MemberDTO> findMember(String id) {
      List<MemberDTO> list = sqlSession.selectList("findMember", id);
      return list;
   }
   public List<MemberDTO> findMember1(Map<String, String> map) {
      return sqlSession.selectList("findMember1", map);
   }

   public String searchMember(Map<String, String> params) {
      MemberDTO dto = sqlSession.selectOne("searchMember", params);
      String msg = null;
      if (!params.containsKey("id")) {
         if (dto == null) {
              msg = "해당하는 아이디가 없습니다. 다시 입력해 주세요";
           } else {
              msg = "아이디는 "+dto.getId()+"입니다.";
           }
        } else {
           if (dto == null) {
              msg = "해당하는 비밀번호가 없습니다. 다시 입력해 주세요";
           } else {
              msg = "비밀번호는 "+dto.getPasswd()+"입니다.";
           }
      }
      return msg;
   }   
   public  int getCount() {
      return sqlSession.selectOne("getCount");
   }
   public int getidCount(HashMap map) {
      return sqlSession.selectOne("MemberMapper.getidCount", map);
   }

   public int idChk(String id) {
      return sqlSession.selectOne("getidCount",id);
   }

   public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
      String api_key = "NCSUGPWIIVN7SHXC";
       String api_secret = "VSHWSZVNFB0EUJ1FRY0RGXXW8SLPEANC";
       Message coolsms = new Message(api_key, api_secret);

       HashMap<String, String> params = new HashMap<String, String>();
       params.put("to", userPhoneNumber);    // 수신전화번호
       params.put("from", "01033166847");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
       params.put("type", "SMS");
       params.put("text", "[CR2AM] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
       params.put("app_version", "test app 1.2"); // application name and version

       try {
           JSONObject obj = (JSONObject) coolsms.send(params);
           System.out.println(obj.toString());
         } catch (CoolsmsException e) {
           System.out.println(e.getMessage());
           System.out.println(e.getCode());
         }   
   }
   
   public int updateProimg(MemberDTO dto) {
	   return sqlSession.update("updateProimg",dto);
   }
}
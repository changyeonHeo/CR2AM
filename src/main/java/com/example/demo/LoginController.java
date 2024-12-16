package com.example.demo;

import java.io.*;
import java.net.*;
import java.util.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.demo.dto.LoginOkBean;
import com.example.demo.dto.MemberDTO;
import com.example.demo.service.MemberMapper;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

   @Autowired
   private MemberMapper memberMapper;

   @RequestMapping("/login.do")
   public String login() {
      return "/member/login";
   }
   
   @RequestMapping(value="/join.do")
   public String join() {
      return "terms/terms";
   }

   @RequestMapping(value = "/searchMember.do", method = RequestMethod.GET)
   public String searchMember() {
      return "/member/searchMember";
   }

   @ResponseBody
   @RequestMapping(value = "/searchMember.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   public String searchMember(HttpServletRequest req, @RequestParam Map<String, String> params) {
      System.out.println("name = " + params.get("name"));
      System.out.println("hp1 = " + params.get("hp1"));
      System.out.println("hp2 = " + params.get("hp2"));
      System.out.println("hp3 = " + params.get("hp3"));
      System.out.println("id = " + params.get("id"));
      String msg = memberMapper.searchMember(params);
      return msg;
   }

   @RequestMapping("/logout.do")
   public String logout(HttpServletRequest req) {
      HttpSession session = req.getSession();
      session.invalidate();
      req.setAttribute("msg", "로그아웃 되었습니다.");
      req.setAttribute("url", "main.do");
      return "forward:message.jsp";
   }

   @RequestMapping("/login_ok.do")
   public String loginOk(HttpServletRequest req, HttpServletResponse resp, @ModelAttribute LoginOkBean loginOk,
         @RequestParam(required = false) String saveId) {
      MemberDTO dto = memberMapper.getMember(loginOk.getId());
      int res = loginOk.loginOk(dto);
      String msg = null, url = null;
      switch (res) {
      case LoginOkBean.OK:
         Cookie ck = new Cookie("saveId", loginOk.getId());
         if (saveId != null) {
            ck.setMaxAge(7 * 24 * 60 * 60);
         } else {
            ck.setMaxAge(0);
         }
         resp.addCookie(ck);
         HttpSession session = req.getSession();
         session.setAttribute("loginMember", dto);
         if (dto.getId().equals("admin")) {
            msg = dto.getName() + "관리자 님이 로그인 하셨습니다.";
            url = "admin.do";
         } else {
            msg = dto.getName() + "님이 로그인 하셨습니다.";
            url = "main.do";
         }
         break;
      case LoginOkBean.NOT_ID:
         msg = "없는 아이디 입니다. 다시 확인하시고 입력해 주세요";
         url = "login.do";
         break;
      case LoginOkBean.NOT_PW:
         msg = "비밀번호가 틀렸습니다. 다시 확인하시고 입력해 주세요";
         url = "login.do";
         break;
      case LoginOkBean.ERROR:
         msg = "DB 서버 오류 발생!! 관리자에게 문의해 주세요.";
         url = "index.do";
         break;
      }

      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
      return "forward:message.jsp";
   }

   @RequestMapping(value = "/kakao.do")
   public String login(String code, HttpServletRequest req) {
      // 카카오 서버가 인자로 전달해준 인증코드가 code라는 변수로 받는다.

      // 받은 코드를 가지고 2번째 요청인 토큰을 요청하여 받기위한 작업
      String access_token = "";
      String refresh_token = "";
      // 요청하고자하는 서버의 카카오url
      String reqURL = "https://kauth.kakao.com/oauth/token";
      MemberDTO dto = new MemberDTO();

      try {
         // 웹상의 경로를 객체화 시킨다.
         URL url = new URL(reqURL);

         // 웹상의 경로와 연결한다.
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();

         // POST방식으로 요청하기 위해 setDoOutput을 true로 지정해줘야한다.
         conn.setRequestMethod("POST");
         conn.setDoOutput(true);

         // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
         // 전달하고자하는 파라미터들을 보낼 OutputStream준비
         BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

         // 파라미터 4개를 만들어서 bw를 통해 카카오서버로 보낸다.
         // 파라미터들을 담을 문자열 생성!
         // grant_type=authorization_code&client_id=개인키값...등등보내야한다
         StringBuffer sb = new StringBuffer();
         sb.append("grant_type=authorization_code"); // 이건 문서에서 넣으라해서 넣은거
         sb.append("&client_id=67bda85d88bb2dd819914ff0f9daa717"); // 본인이 발급받은 key
         sb.append("&redirect_uri=http://localhost:8080/kakao.do"); // 본인이 설정해 놓은 경로
         sb.append("&code=" + code); // 파라미터로 받은 String code

         // 연결된 카카오서버(bw로 연결함)로 준비된 파라미터들을 전달!!
         // 왜 전달하냐 카카오에서 보내달래!!
         bw.write(sb.toString());
         bw.flush();

         // 결과코드가 200이라면 성공
         int res_Code = conn.getResponseCode();

         if (res_Code == 200) {
            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            // response택스트를 얻기위해 이 친구를 준비했다!
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            StringBuffer result = new StringBuffer();
            String line = null;

            // 한 줄 단위로 읽어서 result라는 StringBuffer에 적재를 해보자!
            while ((line = br.readLine()) != null) {
               result.append(line);
            }
            // 현재 result는 하나의 문자열로 인식을한다.
            // 물론 꺼내서 서브스트링을 이용해서 하나씩 잘라서 사용할 수 있지만 너무 힘들자나
            // 차라리 이 문자열 자체를 json으로 인식을 해버리게 하는거야
            // 그러면 엑세스토큰 값을 주세요 ! 리프레쉬토큰값을 주세요 !!
            // 하면 바로 나올 수 있게 편하게 접근하는 방법을 알아보자

            // 잭슨은 언제 쓰나
            // 비동기식 통신이든 나한테 누가 요청을 해 그러면 그 값을
            // 제이슨으로 던져주고 싶을 때!
            // 내가 가지고 싶은 자원을 제이슨으로 던져주고 싶을 때 쓰는게 잭슨이다!

            // JSON파싱 처리
            // "access_token" "refresh_token" 이 두 가지가 필요하다!
            // 카카오api요청을 한 후
            // ModelAndView로 저장한 후 result.jsp로 이동하여 결과를 표현한다.
            // 이 놈이 JSON표현식의 값이 하나의 문자열로 되어있는것을
            // JSON객체로 변환 해주는 라이브러리!
            // result.toString() --- > JSON 객체! 이렇게해야 토큰값 두가지를 얻어낼 수 있다.
            // **************문자열로 넘어온 제이슨형식의 택스트를 내가원하는 값만 뽑아내기!************************
            JSONParser pars = new JSONParser();

            Object obj = pars.parse(result.toString());
            JSONObject json = (JSONObject) obj;

            access_token = (String) json.get("access_token");
            refresh_token = (String) json.get("refresh_token");
            // **********************************************************

            // 마지막 3번째 호출은 사용자 정보요청!!

            String header = "Bearer " + access_token;
            String apiURL = "https://kapi.kakao.com/v2/user/me";

            // 자바객체에서 특정 웹상의 경로를 호출하기위해서는 먼저 URL생성
            URL url2 = new URL(apiURL);

            // 위에 경로를 가지고 커넥션 준비
            HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();

            // 커넥션 설정
            conn2.setRequestMethod("POST");
            conn2.setDoOutput(true);

            // 헤더친구를 보내야 하기에 배관하나 준비해주자 문서에서 보내래
            conn2.setRequestProperty("Authorization", header);

            res_Code = conn2.getResponseCode(); // 200이라면 성공한거다

            if (res_Code == HttpURLConnection.HTTP_OK) {
               // 3번쨰 요청에 성공했다면...

               // 카카오 서버쪽에서 사용자의 정보를 보냈다
               // 이것을 읽어와서 필요한 정보만쏙쏙빼보자잉
               BufferedReader brd = new BufferedReader(new InputStreamReader(conn2.getInputStream(), "UTF-8"));

               StringBuffer res = new StringBuffer();
               String str = null;

               while ((str = brd.readLine()) != null) {
                  res.append(str);
               }
               // 카카오서버에서 전달되는 모든 값들이 res에 누적되었다.
               // System.out.println("res = " + res);

               // 받은 객체를 json객체로 변환한다.
               obj = pars.parse(res.toString());
               json = (JSONObject) obj;

               // 변환된 josn객체 안에서 다시 json객체로 얻어내야 하는 것이
               // 바로 "properties"라는 속성이다.
               JSONObject props = (JSONObject) json.get("properties");
               // System.out.println("props = " + props);

               String nickName = (String) props.get("nickname");
               String p_img = (String) props.get("profile_image");

               JSONObject kakao_acc = (JSONObject) json.get("kakao_account");
               String email = (String) kakao_acc.get("email");

               JSONObject profile = (JSONObject) kakao_acc.get("profile");
               nickName = (String) profile.get("nickname");
               p_img = (String) profile.get("profile_image_url");

               dto.setId(email);
               dto.setName(nickName);
               dto.setPasswd(" ");
               dto.setHp1("010");
               dto.setHp2(" ");
               dto.setHp3(" ");
               dto.setGender(" ");
               dto.setEmail(email);
            }
            br.close();
            bw.close();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      if (memberMapper.getMember(dto.getId()) == null) {
         int res = memberMapper.insertMember(dto);
         if (res > 0) {
            req.setAttribute("msg", dto.getName() + "님 환영합니다");
            req.setAttribute("url", "main.do");
            HttpSession session = req.getSession();
            session.setAttribute("loginMember", dto);
         } else {
            req.setAttribute("msg", "로그인 실패");
            req.setAttribute("url", "login.do");
         }
      } else {
         req.setAttribute("msg", dto.getName() + "님 환영합니다");
         req.setAttribute("url", "main.do");
         HttpSession session = req.getSession();
         session.setAttribute("loginMember", dto);
      }
      return "forward:message.jsp";
   }
   
   @RequestMapping(value = "/naver.do")
   public String Nlogin(String code, HttpServletRequest req) {
      String access_token = "";
      String refresh_token = "";
      String reqURL = "https://nid.naver.com/oauth2.0/token";
      MemberDTO dto = new MemberDTO();
      Scanner sc = null;
      
      try {
         URL url = new URL(reqURL);
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();

         conn.setRequestMethod("POST");
         conn.setDoOutput(true);

         BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
         StringBuffer sb = new StringBuffer();
         sb.append("grant_type=authorization_code"); 
         sb.append("&client_id=kd1bWj0XiKuexpuvUlsY"); 
         sb.append("&client_secret=eEmpHmpH39"); 
         sb.append("&redirect_uri=http://localhost:8080/naver.do"); 
         sb.append("&code=" + code); 

         bw.write(sb.toString());
         bw.flush();

         int res_Code = conn.getResponseCode();
         
         if (res_Code == 200) {
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            StringBuffer result = new StringBuffer();
            String line = null;

            while ((line = br.readLine()) != null) {
               result.append(line);
            }
            
            JSONParser pars = new JSONParser();

            Object obj = pars.parse(result.toString());
            JSONObject json = (JSONObject) obj;

            access_token = (String) json.get("access_token");
            refresh_token = (String) json.get("refresh_token");
            
            String header = "Bearer " + access_token;
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            
            URL url2 = new URL(apiURL);

            HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
            
            conn2.setRequestMethod("POST");
            conn2.setDoOutput(true);

            conn2.setRequestProperty("Authorization", header);

            res_Code = conn2.getResponseCode();
            
            if (res_Code == HttpURLConnection.HTTP_OK) {
               BufferedReader brd = new BufferedReader(new InputStreamReader(conn2.getInputStream(), "UTF-8"));

               StringBuffer res = new StringBuffer();
               String str = null;

               while ((str = brd.readLine()) != null) {
                  res.append(str);
               }
               
               obj = pars.parse(res.toString());
               json = (JSONObject) obj;

               JSONObject resp = (JSONObject) json.get("response");
               String name = (String) resp.get("name");
               String email = (String) resp.get("email");
               String mobile = (String) resp.get("mobile");
               String mobile_e164 = (String) resp.get("mobile_e164");
               String gender = (String) resp.get("gender");
               
               sc = new Scanner(mobile).useDelimiter("\\s*-");
               String hp1 = sc.next();
               String hp2 = sc.next();
               String hp3 = sc.next();
               
               dto.setId(email);
               dto.setName(name);
               dto.setPasswd(mobile_e164);
               dto.setHp1(hp1);
               dto.setHp2(hp2);
               dto.setHp3(hp3);
               if(gender.equals("M"))
                  dto.setGender("남자");
               else
                  dto.setGender("여자");
            }
            br.close();
            bw.close();
            sc.close();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      if (memberMapper.getMember(dto.getId()) == null) {
         int res = memberMapper.insertMember(dto);
         if (res > 0) {
            req.setAttribute("msg", dto.getName() + "님 환영합니다");
            req.setAttribute("url", "main.do");
            HttpSession session = req.getSession();
            session.setAttribute("loginMember", dto);
         } else {
            req.setAttribute("msg", "로그인 실패");
            req.setAttribute("url", "login.do");
         }
      } else {
         req.setAttribute("msg", dto.getName() + "님 환영합니다");
         req.setAttribute("url", "main.do");
         HttpSession session = req.getSession();
         session.setAttribute("loginMember", dto);
      }
      return "forward:message.jsp";
   }
   
   @ResponseBody
   @RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
   public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
      int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

      memberMapper.certifiedPhoneNumber(userPhoneNumber,randomNumber);
      
      return Integer.toString(randomNumber);
   }
}
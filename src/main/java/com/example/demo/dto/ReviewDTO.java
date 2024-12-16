package com.example.demo.dto;

public class ReviewDTO {
   
   private int rnum;
   private int mem;
   private String id;
   private String rtitle;
   private String rcontent;
   private String rcode;
   private String rproduct;
   private String regdate;
   private String rimage;

   public int getRnum() {
      return rnum;
   }
   public void setRnum(int rnum) {
      this.rnum = rnum;
   }

   public int getMem() {
      return mem;
   }
   public void setMem(int mem) {
      this.mem = mem;
   }

   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
  
   public String getRimage() {
      return rimage;
   }
   public void setRimage(String rimage) {
      this.rimage = rimage;
   }
  
   public String getRcontent() {
      return rcontent;
   }
   public void setRcontent(String rcontent) {
      this.rcontent = rcontent;
   }
   public String getRcode() {
      return rcode;
   }
   public void setRcode(String rcode) {
      this.rcode = rcode;
   }
   public String getRproduct() {
      return rproduct;
   }
   public void setRproduct(String rproduct) {
      this.rproduct = rproduct;
   }
   public String getRtitle() {
      return rtitle;
   }
   public void setRtitle(String rtitle) {
      this.rtitle = rtitle;
   }
   public String getRegdate() {
      return regdate;
   }
   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }
 
 

}
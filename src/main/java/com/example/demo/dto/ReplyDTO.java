package com.example.demo.dto;

public class ReplyDTO {
   
   private int rnum;
   private int renum;
   private int mem;
   private String id;
   private String rcontent;
   private String regdate;
   
   public int getRnum() {
      return rnum;
   }
   public void setRnum(int rnum) {
      this.rnum = rnum;
   }
   public int getRenum() {
      return renum;
   }
   public void setRenum(int renum) {
      this.renum = renum;
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
   public String getRcontent() {
      return rcontent;
   }
   public void setRcontent(String rcontent) {
      this.rcontent = rcontent;
   }
   public String getRegdate() {
      return regdate;
   }
   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }
   
}
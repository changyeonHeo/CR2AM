package com.example.demo.dto;

public class WishDTO {
   private int wnum;
   private int mem;
   private String pcode;
   private String pname;
   private int pprice;
   private String pimage;
   private String pbrand;
   
   public String getPname() {
      return pname;
   }
   public void setPname(String pname) {
      this.pname = pname;
   }
   public int getPprice() {
      return pprice;
   }
   public void setPprice(int pprice) {
      this.pprice = pprice;
   }
   public String getPimage() {
      return pimage;
   }
   public void setPimage(String pimage) {
      this.pimage = pimage;
   }
   public String getPbrand() {
      return pbrand;
   }
   public void setPbrand(String pbrand) {
      this.pbrand = pbrand;
   }
   public String getPcode() {
      return pcode;
   }
   public void setPcode(String pcode) {
      this.pcode = pcode;
   }
   public int getWnum() {
      return wnum;
   }
   public void setWnum(int wnum) {
      this.wnum = wnum;
   }
   public int getMem() {
      return mem;
   }
   public void setMem(int mem) {
      this.mem = mem;
   }



}
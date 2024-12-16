package com.example.demo.dto;

public class BoardDTO {
   private int bnum;
   private int mem;
   private String bcontent;
   private String btitle;
   private String bregdate;
   private String bimage;
   private String id;
   

public String getId() {
   return id;
}
public void setId(String id) {
   this.id = id;
}
public int getMem() {
   return mem;
}
public void setMem(int mem) {
   this.mem = mem;
}
public int getBnum() {
      return bnum;
   }
   public void setBnum(int bnum) {
      this.bnum = bnum;
   }
   
   public String getBcontent() {
      return bcontent;
   }
   public void setBcontent(String bcontent) {
      this.bcontent = bcontent;
   }
   public String getBtitle() {
      return btitle;
   }
   public void setBtitle(String btitle) {
      this.btitle = btitle;
   }
   public String getBregdate() {
      return bregdate;
   }
   public void setBregdate(String bregdate) {
      this.bregdate = bregdate;
   }
   public String getBimage() {
      return bimage;
   }
   public void setBimage(String bimage) {
      this.bimage = bimage;
   }
}
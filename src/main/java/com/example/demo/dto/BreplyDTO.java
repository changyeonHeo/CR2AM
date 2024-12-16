package com.example.demo.dto;

public class BreplyDTO {
   private int bnum;
   private int brenum;
   private int mem;
   private String bcontent;
   private String begdate;
   private String id;
   
   public String getId() {
   return id;
}
public void setId(String id) {
   this.id = id;
}
public int getBnum() {
      return bnum;
   }
   public void setBnum(int bnum) {
      this.bnum = bnum;
   }
   public int getBrenum() {
      return brenum;
   }
   public void setBrenum(int brenum) {
      this.brenum = brenum;
   }
  
   public String getBcontent() {
      return bcontent;
   }
   public void setBcontent(String bcontent) {
      this.bcontent = bcontent;
   }
public int getMem() {
   return mem;
}
public void setMem(int mem) {
   this.mem = mem;
}
public String getBegdate() {
   return begdate;
}
public void setBegdate(String begdate) {
   this.begdate = begdate;
}

}
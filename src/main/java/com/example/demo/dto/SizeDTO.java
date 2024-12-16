package com.example.demo.dto;

public class SizeDTO {

   String pname;
   String type;
   int seq;
   String csize;

   public int getSeq() {
      return seq;
   }

   public void setSeq(int seq) {
      this.seq = seq;
   }

   public String getPname() {
      return pname;
   }

   public void setPname(String pname) {
      this.pname = pname;
   }

   public String getType() {
      return type;
   }

   public void setType(String type) {
      this.type = type;
   }

   public String getCsize() {
      return csize;
   }

   public void setCsize(String csize) {
      this.csize = csize;
   }
}
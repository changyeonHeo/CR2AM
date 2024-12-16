package com.example.demo.dto;

public class AuctionDTO {
   
   private int anum;
   private String atype;
   private String id;
   private String aid;
   private int pnum;
   private int price;
   private String psize;
   private int status;
   private String insertdate;
   private String saledate;
   
   public int getAnum() {
      return anum;
   }
   public void setAnum(int anum) {
      this.anum = anum;
   }
   public String getAtype() {
      return atype;
   }
   public void setAtype(String atype) {
      this.atype = atype;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   
   public String getAid() {
      return aid;
   }
   public void setAid(String aid) {
      this.aid = aid;
   }
   public int getPnum() {
      return pnum;
   }
   public void setPnum(int pnum) {
      this.pnum = pnum;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public String getPsize() {
      return psize;
   }
   public void setPsize(String psize) {
      this.psize = psize;
   }
   public int getStatus() {
      return status;
   }
   public void setStatus(int status) {
      this.status = status;
   }
   public String getInsertdate() {
      return insertdate;
   }
   public void setInsertdate(String insertdate) {
      this.insertdate = insertdate;
   }
   public String getSaledate() {
      return saledate;
   }
   public void setSaledate(String saledate) {
      this.saledate = saledate;
   }
   
}
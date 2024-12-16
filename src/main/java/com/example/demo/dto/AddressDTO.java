package com.example.demo.dto;

public class AddressDTO {
   private int anum;
   private int mem;
   private String name;
   private String hp1;
   private String hp2;
   private String hp3;
   private String zipcode;
   private String address1;
   private String address2;
   private int seq;
   private String tel;

   public int getAnum() {
      return anum;
   }

   public void setAnum(int anum) {
      this.anum = anum;
   }

   public int getMem() {
      return mem;
   }

   public void setMem(int mem) {
      this.mem = mem;
   }

   public String getTel() {
      return tel;
   }

   public void setTel(String tel) {
      this.tel = tel;
   }

   public int getSeq() {
      return seq;
   }

   public void setSeq(int seq) {
      this.seq = seq;
   }

   public String getAllHp() {
      if (hp1 == null)
         return "전화없음";
      return hp1 + "-" + hp2 + "-" + hp3;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getHp1() {
      return hp1;
   }

   public void setHp1(String hp1) {
      this.hp1 = hp1;
   }

   public String getHp2() {
      return hp2;
   }

   public void setHp2(String hp2) {
      this.hp2 = hp2;
   }

   public String getHp3() {
      return hp3;
   }

   public void setHp3(String hp3) {
      this.hp3 = hp3;
   }

   public String getZipcode() {
      return zipcode;
   }

   public void setZipcode(String zipcode) {
      this.zipcode = zipcode;
   }

   public String getAddress1() {
      return address1;
   }

   public void setAddress1(String address1) {
      this.address1 = address1;
   }

   public String getAddress2() {
      return address2;
   }

   public void setAddress2(String address2) {
      this.address2 = address2;
   }
}
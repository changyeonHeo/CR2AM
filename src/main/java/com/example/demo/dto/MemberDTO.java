package com.example.demo.dto;

public class MemberDTO {
   private int mem;
   private String id;
   private String name;
   private String passwd;
   private String hp1;
   private String hp2;
   private String hp3;
   private String gender;
   private String joindate;
   private int point;
   private String email;
   private String zipcode;
   private String address1;
   private String address2;
   private String proimg;
   private String thumbimg;
   
   public int getMem() {
	   return mem;
   }
   public void setMem(int mem) {
	   this.mem = mem;
   }
   public String getEmail() {
	   return email;
   }
   public void setEmail(String email) {
	   this.email = email;
   }
   public String getId() {
	   return id;
   }
   public void setId(String id) {
	   this.id = id;
   }
   public String getName() {
	   return name;
   }
   public void setName(String name) {
	   this.name = name;
   }
   public String getPasswd() {
	   return passwd;
   }
   public void setPasswd(String passwd) {
	   this.passwd = passwd;
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
   public String getGender() {
	   return gender;
   }
   public String getAllHp() {
	   if(hp1 ==null )return "전화없음";
	   return hp1+"-"+hp2+"-"+hp3;
   }
   public void setGender(String gender) {
	   this.gender = gender;
   }
   public String getJoindate() {
	   return joindate;
   }
   public void setJoindate(String joindate) {
	   this.joindate = joindate;
   }
   public int getPoint() {
	   return point;
   }
   public void setPoint(int point) {
	   this.point = point;
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
   public String getProimg() {
	   return proimg;
   }
   public void setProimg(String proimg) {
	   this.proimg = proimg;
   }

}
package com.example.demo.dto;

import java.util.*;

public class ProductDetailVO {
   private List<String> sizeList;
   private List<String> priceList;

   public List<String> getSizeList() {
      return sizeList;
   }

   public void setSizeList(List<String> sizeList) {
      this.sizeList = sizeList;
   }

   public List<String> getPriceList() {
      return priceList;
   }

   public void setPriceList(List<String> priceList) {
      this.priceList = priceList;
   }

}
package com.pet.model;

public class StartendDTO {
   private int startNo;
   private int endNo;
   private int ckNo;
   private String find_field;
   private String find_name;

   public String getFind_field() {
      return find_field;
   }

   public void setFind_field(String find_field) {
      this.find_field = find_field;
   }

   public String getFind_name() {
      return find_name;
   }

   public void setFind_name(String find_name) {
      this.find_name = find_name;
   }

   public int getCkNo() {
      return ckNo;
   }

   public void setCkNo(int ckNo) {
      this.ckNo = ckNo;
   }

   public int getStartNo() {
      return startNo;
   }

   public void setStartNo(int startNo) {
      this.startNo = startNo;
   }

   public int getEndNo() {
      return endNo;
   }

   public void setEndNo(int endNo) {
      this.endNo = endNo;
   }
}
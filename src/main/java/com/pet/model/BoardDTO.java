package com.pet.model;
public class BoardDTO {
   private int no;
   private String title;
   private String cont;
   private String writer;
   private int hit;
   private String regdate;
   private int up;
   private String cate;
   private String upload;
   
   public String getUpload() {
      return upload;
   }
   public void setUpload(String upload) {
      this.upload = upload;
   }
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getCont() {
      return cont;
   }
   public void setCont(String cont) {
      this.cont = cont;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public int getHit() {
      return hit;
   }
   public void setHit(int hit) {
      this.hit = hit;
   }
   public String getRegdate() {
      return regdate;
   }
   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }
   public int getUp() {
      return up;
   }
   public void setUp(int up) {
      this.up = up;
   }
   public String getCate() {
      return cate;
   }
   public void setCate(String cate) {
      this.cate = cate;
   }
   
   
}
 package com.edusys.entity;


  import java.util.Date;


  public class KhoaHoc {

     private int maKH;
        private String maCD;
        private double hocPhi;
        private int thoiLuong;
        private Date ngayKG;
        private String ghiChu;
        private String maNV;
       private Date ngayTao = new Date();

    
 
  public String toString() {
       return this.maCD + " (" + this.ngayKG + ")";
            }

    
  public int getMaKH() {
         return this.maKH;
            }

    
  public void setMaKH(int maKH) {
         this.maKH = maKH;
            }

    
  public String getMaCD() {
        return this.maCD;
            }

    
  public void setMaCD(String maCD) {
         this.maCD = maCD;
            }

    
  public double getHocPhi() {
         return this.hocPhi;
            }

    
  public void setHocPhi(double hocPhi) {
         this.hocPhi = hocPhi;
            }

    
  public int getThoiLuong() {
         return this.thoiLuong;
            }

    
  public void setThoiLuong(int thoiLuong) {
         this.thoiLuong = thoiLuong;
            }

    
  public Date getNgayKG() {
         return this.ngayKG;
            }

    
  public void setNgayKG(Date ngayKG) {
        this.ngayKG = ngayKG;
            }

    
  public String getGhiChu() {
        return this.ghiChu;
            }

    
  public void setGhiChu(String ghiChu) {
         this.ghiChu = ghiChu;
            }

    
  public String getMaNV() {
         return this.maNV;
            }

    
  public void setMaNV(String maNV) {
         this.maNV = maNV;
            }

    
  public Date getNgayTao() {
         return this.ngayTao;
            }

    
  public void setNgayTao(Date ngayTao) {
         this.ngayTao = ngayTao;
            }
     }



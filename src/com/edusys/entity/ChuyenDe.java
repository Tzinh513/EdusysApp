package com.edusys.entity;

public class ChuyenDe {

    private String maCD;
    private String tenCD;
    private double hocPhi;
    private int thoiLuong;
    private String hinh;
    private String moTa;

    public String toString() {
        return this.tenCD;
    }

    public boolean equals(Object obj) {
        ChuyenDe other = (ChuyenDe) obj;
        return other.getMaCD().equals(getMaCD());
    }

    public String getMaCD() {
        return this.maCD;
    }

    public void setMaCD(String maCD) {
        this.maCD = maCD;
    }

    public String getTenCD() {
        return this.tenCD;
    }

    public void setTenCD(String tenCD) {
        this.tenCD = tenCD;
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

    public String getHinh() {
        return this.hinh;
    }

    public void setHinh(String hinh) {
        this.hinh = hinh;
    }

    public String getMoTa() {
        return this.moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }
}

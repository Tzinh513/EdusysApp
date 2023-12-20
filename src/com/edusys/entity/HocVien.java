package com.edusys.entity;

public class HocVien {

    private Integer maHV;
    private Integer maKH;
    private String maNH;
    private Float diem;

    public int getMaHV() {
        return this.maHV;
    }

    public void setMaHV(Integer maHV) {
        this.maHV = maHV;
    }

    public Integer getMaKH() {
        return this.maKH;
    }

    public void setMaKH(Integer maKH) {
        this.maKH = maKH;
    }

    public String getMaNH() {
        return this.maNH;
    }

    public void setMaNH(String maNH) {
        this.maNH = maNH;
    }

    public double getDiem() {
        return this.diem;
    }

    public void setDiem(Float diem) {
        this.diem = diem;
    }
}

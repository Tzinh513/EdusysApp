package com.edusys.entity;

public class NhanVien {

    private String maNV;
    private String matKhau;
    private String hoTen;
    private boolean vaiTro = false;

    public String toString() {
        return this.hoTen;
    }

    public String getMaNV() {
        return this.maNV;
    }

    public void setMaNV(String maNV) {
        this.maNV = maNV;
    }

    public String getMatKhau() {
        return this.matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getHoTen() {
        return this.hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public boolean isVaiTro() {
        return this.vaiTro;
    }

    public void setVaiTro(boolean vaiTro) {
        this.vaiTro = vaiTro;
    }
}

package com.edusys.dao;

import com.edusys.entity.HocVien;
import com.edusys.utils.XJdbc;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HocVienDAO
        extends EduSysDAO<HocVien, Integer> {

    public void insert(HocVien model) {
        String sql = "INSERT INTO HocVien(MaKH, MaNH, Diem) VALUES(?, ?, ?)";
        XJdbc.update(sql, new Object[]{
            Integer.valueOf(model.getMaKH()), model
            .getMaNH(),
            Double.valueOf(model.getDiem())});
    }

    public void update(HocVien model) {
        String sql = "UPDATE HocVien SET MaKH=?, MaNH=?, Diem=? WHERE MaHV=?";
        XJdbc.update(sql, new Object[]{
            Integer.valueOf(model.getMaKH()), model
            .getMaNH(),
            Double.valueOf(model.getDiem()),
            Integer.valueOf(model.getMaHV())});
    }

    public void delete(Integer MaHV) {
        String sql = "DELETE FROM HocVien WHERE MaHV=?";
        XJdbc.update(sql, new Object[]{MaHV});
    }

    public List<HocVien> selectAll() {
        String sql = "SELECT * FROM HocVien";
        return selectBySql(sql, new Object[0]);
    }

    public HocVien selectById(Integer mahv) {
        String sql = "SELECT * FROM HocVien WHERE MaHV=?";
        List<HocVien> list = selectBySql(sql, new Object[]{mahv});
        return (list.size() > 0) ? list.get(0) : null;
    }

    protected List<HocVien> selectBySql(String sql, Object... args) {
        List<HocVien> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);
                while (rs.next()) {
                    HocVien entity = new HocVien();
                    entity.setMaHV(rs.getInt("MaHV"));
                    entity.setMaKH(rs.getInt("MaKH"));
                    entity.setMaNH(rs.getString("MaNH"));
                    entity.setDiem(rs.getFloat("Diem"));
                    list.add(entity);
                }
            } finally {

                rs.getStatement().getConnection().close();
            }

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return list;
    }

    public List<HocVien> selectByKhoaHoc(int maKH) {
        String sql = "SELECT * FROM HocVien WHERE MaKH=?";
        return selectBySql(sql, new Object[]{Integer.valueOf(maKH)});
    }
}

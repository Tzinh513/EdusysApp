package com.edusys.dao;

import com.edusys.entity.ChuyenDe;
import com.edusys.utils.XJdbc;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ChuyenDeDAO
        extends EduSysDAO<ChuyenDe, String> {

    public void insert(ChuyenDe model) {
        String sql = "INSERT INTO ChuyenDe (MaCD, TenCD, HocPhi, ThoiLuong, Hinh, MoTa) VALUES (?, ?, ?, ?, ?, ?)";
        XJdbc.update(sql, new Object[]{model
            .getMaCD(), model
            .getTenCD(),
            Double.valueOf(model.getHocPhi()),
            Integer.valueOf(model.getThoiLuong()), model
            .getHinh(), model
            .getMoTa()});
    }

    public void update(ChuyenDe model) {
        String sql = "UPDATE ChuyenDe SET TenCD=?, HocPhi=?, ThoiLuong=?, Hinh=?, MoTa=? WHERE MaCD=?";
        XJdbc.update(sql, new Object[]{model
            .getTenCD(),
            Double.valueOf(model.getHocPhi()),
            Integer.valueOf(model.getThoiLuong()), model
            .getHinh(), model
            .getMoTa(), model
            .getMaCD()});
    }

    public void delete(String MaCD) {
        String sql = "DELETE FROM ChuyenDe WHERE MaCD=?";
        XJdbc.update(sql, new Object[]{MaCD});
    }

    public List<ChuyenDe> selectAll() {
        String sql = "SELECT * FROM ChuyenDe";
        return selectBySql(sql, new Object[0]);
    }

    public ChuyenDe selectById(String macd) {
        String sql = "SELECT * FROM ChuyenDe WHERE MaCD=?";
        List<ChuyenDe> list = selectBySql(sql, new Object[]{macd});
        return (list.size() > 0) ? list.get(0) : null;
    }

    protected List<ChuyenDe> selectBySql(String sql, Object... args) {
        List<ChuyenDe> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);
                while (rs.next()) {
                    ChuyenDe entity = new ChuyenDe();
                    entity.setMaCD(rs.getString("MaCD"));
                    entity.setHinh(rs.getString("Hinh"));
                    entity.setHocPhi(rs.getDouble("HocPhi"));
                    entity.setMoTa(rs.getString("MoTa"));
                    entity.setTenCD(rs.getString("TenCD"));
                    entity.setThoiLuong(rs.getInt("ThoiLuong"));
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
}

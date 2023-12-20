package com.edusys.dao;

import com.edusys.entity.KhoaHoc;
import com.edusys.utils.XJdbc;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdk.jshell.execution.Util;

public class KhoaHocDAO
        extends EduSysDAO<KhoaHoc, Integer> {

//    String insert_sql = "insert into KhoaHoc(MaKH,MaCD,HocPhi,ThoiLuong,NgayKG,GhiChi,MaNV,NgayTao)values (?,?,?,?,?,?,?,?)";
//    String update_sql = "update KhoaHoc set MaCD = ?,HocPhi = ?,ThoiLuong = ?,NgayKG = ?,GhiChu = ?,MaNV = ?,NgayTao = ? where MaKH = ?";
//    String delete_sql = "delete from KhoaHoc where MaKH = ?";
//    String selectAll_sql = "select * from KhoaHoc";
//    String SelectById_sql = "select * from KhoaHoc where MaKH = ?";
//
//    @Override
//    public void insert(KhoaHoc entity) {
//        try {
//            XJdbc.update(insert_sql,
//                    entity.getMaKH(), entity.getMaCD(), entity.getHocPhi(), entity.getThoiLuong(),
//                    entity.getNgayKG(), entity.getGhiChu(), entity.getMaNV(), entity.getNgayTao());
//        } catch (SQLException ex) {
//            throw new RuntimeException(ex);
//        }
//    }
//
//    @Override
//    public void update(KhoaHoc model) {
//        String sql = "UPDATE KhoaHoc SET MaCD=?, HocPhi=?, ThoiLuong=?, NgayKG=?, GhiChi=?, MaNV=? "
//                + "WHERE MaKH =  ?";
//
//        try {
//            XJdbc.update(sql,
//                    model.getMaCD(),
//                    model.getHocPhi(),
//                    model.getThoiLuong(),
//                    model.getNgayKG(),
//                    model.getGhiChi(),
//                    model.getMaNV(),
//                    model.getMaKH());
//        } catch (SQLException ex) {
//            throw new RuntimeException(ex);
//        }
//    }
//
//    @Override
//    public void delete(Integer id) {
//        try {
//            Util..update(delete_sql, id);
//        } catch (SQLException ex) {
//            throw new RuntimeException(ex);
//        }
//    }
//
//    @Override
//    public List<KhoaHoc> selectAll() {
//        return this.selectBySQL(selectAll_sql);
//    }
//
//    @Override
//    public KhoaHoc selectByID(Integer ID) {
//        List<KhoaHoc> list = this.selectBySQL(SelectById_sql, ID);
//        if (list.isEmpty()) {
//            return null;
//        }
//        return list.get(0);
//    }
//
//    @Override
//    protected List<KhoaHoc> selectBySQL(String sql, Object... args) {
//        List<KhoaHoc> list = new ArrayList<>();
//        try {
//            ResultSet rs = Utils.jdbcHelper.query(sql, args);
//            while (rs.next()) {
//                KhoaHoc entity = new KhoaHoc();
//                entity.setMaKH(rs.getInt("MaKH"));
//                entity.setMaCD(rs.getString("MaCD"));
//                entity.setHocPhi(rs.getFloat("HocPhi"));
//                entity.setThoiLuong(rs.getInt("ThoiLuong"));
//                entity.setNgayKG(rs.getDate("NgayKG"));
//                entity.setGhiChi(rs.getString("GhiChi"));
//                entity.setMaNV(rs.getString("MaNV"));
//                entity.setNgayTao(rs.getDate("NgayTao"));
//
//                list.add(entity);
//            }
//            rs.getStatement().getConnection().close();
//            return list;
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    public List<KhoaHoc> selectByChuyenDe(String macd) {
//        String sql = "select * from KhoaHoc where MaCD = ?";
//        return this.selectBySQL(sql, macd);
//    }
//
//    public List<Integer> selectYears() {
//        String sql = "SELECT DISTINCT year(NgayKG) Year FROM KhoaHoc ORDER BY Year DESC";
//        List<Integer> list = new ArrayList<>();
//        try {
//            ResultSet rs = jdbcHelper.query(sql);
//            while (rs.next()) {
//                list.add(rs.getInt(1));
//            }
//            rs.getStatement().getConnection().close();
//            return list;
//        } catch (SQLException ex) {
//            throw new RuntimeException(ex);
//        }
//    }

    
    
    
    
    
    
    
    public void insert(KhoaHoc model) {
        String sql = "INSERT INTO KhoaHoc (MaCD, HocPhi, ThoiLuong, NgayKG, GhiChu, MaNV) VALUES (?, ?, ?, ?, ?, ?)";
        XJdbc.update(sql, new Object[]{model
            .getMaCD(),
            Double.valueOf(model.getHocPhi()),
            Integer.valueOf(model.getThoiLuong()), model
            .getNgayKG(), model
            .getGhiChu(), model
            .getMaNV()});
    }

    public void update(KhoaHoc model) {
        String sql = "UPDATE KhoaHoc SET MaCD=?, HocPhi=?, ThoiLuong=?, NgayKG=?, GhiChu=?, MaNV=? WHERE MaKH=?";
        XJdbc.update(sql, new Object[]{model
            .getMaCD(),
            Double.valueOf(model.getHocPhi()),
            Integer.valueOf(model.getThoiLuong()), model
            .getNgayKG(), model
            .getGhiChu(), model
            .getMaNV(),
            Integer.valueOf(model.getMaKH())});
    }

    public void delete(Integer MaKH) {
        String sql = "DELETE FROM KhoaHoc WHERE MaKH=?";
        XJdbc.update(sql, new Object[]{MaKH});
    }

    public List<KhoaHoc> selectAll() {
        String sql = "SELECT * FROM KhoaHoc";
        return selectBySql(sql, new Object[0]);
    }

    public KhoaHoc selectById(Integer makh) {
        String sql = "SELECT * FROM KhoaHoc WHERE MaKH=?";
        List<KhoaHoc> list = selectBySql(sql, new Object[]{makh});
        return (list.size() > 0) ? list.get(0) : null;
    }

    protected List<KhoaHoc> selectBySql(String sql, Object... args) {
        List<KhoaHoc> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);
                while (rs.next()) {
                    KhoaHoc entity = new KhoaHoc();
                    entity.setMaKH(rs.getInt("MaKH"));
                    entity.setHocPhi(rs.getDouble("HocPhi"));
                    entity.setThoiLuong(rs.getInt("ThoiLuong"));
                    entity.setNgayKG(rs.getDate("NgayKG"));
                    entity.setGhiChu(rs.getString("GhiChu"));
                    entity.setMaNV(rs.getString("MaNV"));
                    entity.setNgayTao(rs.getDate("NgayTao"));
                    entity.setMaCD(rs.getString("MaCD"));
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

    public List<KhoaHoc> selectByChuyenDe(String macd) {
        String sql = "SELECT * FROM KhoaHoc WHERE MaCD=?";
        return selectBySql(sql, new Object[]{macd});
    }

    public List<Integer> selectYears() {
        String sql = "SELECT DISTINCT year(NgayKG) Year FROM KhoaHoc ORDER BY Year DESC";
        List<Integer> list = new ArrayList<>();
        try {
            ResultSet rs = XJdbc.query(sql, new Object[0]);
            while (rs.next()) {
                list.add(Integer.valueOf(rs.getInt(1)));
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}

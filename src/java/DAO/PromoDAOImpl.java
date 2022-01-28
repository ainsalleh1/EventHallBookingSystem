package DAO;

import DBUtility.DBConnection;
import Model.Promo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PromoDAOImpl implements PromoDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Promo> getAllPromo() {
        List<Promo> p1 = new ArrayList<Promo>();
        try {
            String sql = "select * from promotion";
//            conn = DBUtility.DBConnection.openConnection();
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Promo p = new Promo();
                p.setPromo_id(rs.getInt("promo_id"));
                p.setPromo_name(rs.getString("promo_name"));
                p.setDiscount(rs.getDouble("discount"));
                p.setStartDate(rs.getString("startDate"));
                p.setEndDate(rs.getString("endDate"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getString("status"));
                p1.add(p);
            }
        } catch (Exception ex) {
        }

        return p1;
    }

    @Override
    public Promo getPromo(String PromoName) {
        Promo pu = new Promo();
        String cond = PromoName;
        try {
            String SQL = "SELECT * FROM promotion WHERE name=?";
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(SQL);
            ps.setString(1, cond);
            rs = ps.executeQuery();

            while (rs.next()) {
                pu.setPromo_id(rs.getInt("promo_id"));
                pu.setPromo_name(rs.getString("promo_name"));
                pu.setDiscount(rs.getDouble("discount"));
                pu.setStartDate(rs.getString("startDate"));
                pu.setEndDate(rs.getString("endDate"));
                pu.setDescription(rs.getString("description"));
                pu.setStatus(rs.getString("status"));
            }

        } catch (Exception ex) {
        }

        return pu;
    }

    @Override
    public void insertPromo(Promo p) {

        Promo pu = p;

        try {
            String sqlinsert = "insert into promotion(promo_name,discount,startDate,endDate,description,status)values(?,?,?,?,?,?)";
            conn = DBUtility.DBConnection.openConnection();
            ps = conn.prepareStatement(sqlinsert);

            ps.setString(1, p.getPromo_name());
            ps.setDouble(2, p.getDiscount());
            ps.setString(3, p.getStartDate());
            ps.setString(4, p.getEndDate());
            ps.setString(5, p.getDescription());
            ps.setString(6, p.getStatus());

            ps.executeUpdate();
        } catch (Exception ex) {
        }
    }

    @Override
    public void deletePromo(int id) {
        
        int promo_id = id;
        try {
            String sqldelete = "DELETE FROM promotion "
                    + "WHERE promo_id=?";
            conn = DBUtility.DBConnection.openConnection();            
            ps = conn.prepareStatement(sqldelete);

            ps.setInt(1, promo_id);
            ps.executeUpdate();
        } 
        catch (Exception ex) {}
    }

    @Override
    public void updatePromo(int id, Promo p) {
        
        Promo pu = p;
        int promo_id = id;
        
        try{            
            String sqlupdate = "update promotion set promo_name=?,discount=?,startDate=?,endDate=?,description=?,status=? where promo_id=?";
            conn = DBUtility.DBConnection.openConnection();            
            ps = conn.prepareStatement(sqlupdate);
            
            ps.setString(1, pu.getPromo_name());
            ps.setDouble(2, pu.getDiscount());
            ps.setString(3, pu.getStartDate());
            ps.setString(4, pu.getEndDate());
            ps.setString(5, pu.getDescription());
            ps.setString(6, pu.getStatus());
            ps.setInt(7, promo_id);
            ps.executeUpdate();
            
        }
        catch(Exception ex){}
        
    }
}

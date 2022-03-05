/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author quocb
 */
public class CategoryDAO implements IMethodDAO<Category> {
     
    
    @Override
    public ArrayList<Category> getAll() {
        try {
            ArrayList<Category> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from category";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = Category.builder()
                        .id(rs.getInt(1))
                        .categoryName(rs.getString(2))
                        .status(rs.getInt(3))
                        .totalC(rs.getInt(4))
                        .build();
                list.add(category);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    

    @Override
    public Category getOne(int id) {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from category where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return Category.builder()
                        .id(rs.getInt(1))
                        .categoryName(rs.getString(2))
                        .status(rs.getInt(3))
                        .build();
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean insert(Category category) {
        int numRow = 0;
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO [dbo].[category]\n"
                    + "           ,[categoryName]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category.getCategoryName());
            ps.setInt(2, category.getStatus());
            numRow = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return (numRow > 0);
    }

    @Override
    public boolean update(Category category) {
        int numRow = 0;
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "UPDATE [dbo].[category]\n"
                    + "   SET [categoryName] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category.getCategoryName());
            ps.setInt(2, category.getStatus());
            ps.setInt(3, category.getId());
            numRow = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return (numRow > 0);
    }

    @Override
    public boolean delete(int id) {
        int numRow = 0;
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "DELETE FROM [dbo].[category]\n"
                    + "      WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            numRow = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return (numRow > 0);
    }


}
